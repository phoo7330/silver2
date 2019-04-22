package com.scit.silver;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.silver.dao.SearchDAO;
import com.scit.silver.dao.SeniorDAO;
import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.Member;
import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;
import com.scit.silver.vo.SilverSearch;
import com.test.fileTest.util.PageNavigator;

@Controller
public class SearchController {

	@Autowired
	SearchDAO dao;
	@Autowired
	SeniorDAO sdao;

	private static final int boardPerPage = 4;
	private static final int pagePerGroup = 3;

	@RequestMapping(value = "/search", method = { RequestMethod.POST, RequestMethod.GET })
	public String search () {
		return "search";
	}
	
	@RequestMapping(value = "/searchsilver", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<SilverSearch> searchsilver(String silvername, int type) {
		
		SilverSearch ss = new SilverSearch();
		ss.setSilvername(silvername);
		ss.setType(type);
		ArrayList<SilverSearch> result = dao.searchsilver(ss);

		return result;
		
	}
	
	
	@RequestMapping(value = "/pagemap", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<SilverSearch> pagemap(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "") int type) {

		int totalRecord = dao.countRecord(type);

		PageNavigator pn = new PageNavigator(boardPerPage, pagePerGroup, page, totalRecord);

		ArrayList<SilverSearch> result = dao.selectmap(pn, type);

		return result;
	}

	@RequestMapping(value = "/selectmap", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<SilverSearch> selectmap(int type) {

		ArrayList<SilverSearch> result = dao.selectmap(type);

		// System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/selectmap2", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<SilverSearch> selectmap2(@RequestParam(defaultValue = "1") int page, HttpServletRequest request,
			String maptestJSON) {

		ArrayList<SilverSearch> result = null;

		try {
			// System.out.println(maptestJSON);
			JSONParser jsonParse = new JSONParser();
			// JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			// JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
			JSONArray mapArray = (JSONArray) jsonParse.parse(maptestJSON);
			ArrayList<SilverSearch> maptest = mapArray;
			int totalRecord = dao.countRecord2(maptest);
			 System.out.println(maptest);
			PageNavigator pn = new PageNavigator(boardPerPage, pagePerGroup, page, totalRecord);

			result = dao.selectmap2(pn, maptest);
			// System.out.println(result);
			return result;
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "/searchDetail", method = RequestMethod.GET)
	public String searchDetail(int seach_seq, Model model, HttpSession session) {
		String userid = (String)session.getAttribute("loginId");
		if(userid!=null) {
			SeniorCitizen sc = sdao.SelectSenior(userid);
			System.out.println("[sc] : "+sc);
			Member member = dao.selmem(userid);
			
			if(sc==null) {
				model.addAttribute("message","어르신정보를 먼저 등록해주세요.");
			}else {
				int seq = sdao.SelectSeq(userid);
				SeniorCitizenDetails scd = sdao.SelectSeniorDetails(seq);
				System.out.println("[scd]"+scd);
				model.addAttribute("sc",sc);
				model.addAttribute("scd",scd);
				model.addAttribute("member",member);
			}
		}
		
		
		
		int type = dao.TypeSearch(seach_seq); // 시퀀스번호에 맞는 컬럼의 타입이 담긴값
		if (type == 1) {
			DetailsOne DetailsOne = dao.selectmap4(seach_seq); // 타입이 1일경우 요양병원에서 값을 가져온다.
			String silid = dao.selsilid(DetailsOne.getSilvername());
			model.addAttribute("silid",silid);
			model.addAttribute("DetailsOne", DetailsOne);
			return "searchDetail";
		} else {
			DetailsTwo DetailsTwo = dao.selectmap3(seach_seq); // 그외의 경우 통일된컬럼에서 값을 가져온다.
			String silid = dao.selsilid(DetailsTwo.getSilvername());
			model.addAttribute("silid",silid);
			System.out.println("나머지 타입일경우");
			System.out.println("[detail2의 객체정보]: " + DetailsTwo);
			model.addAttribute("DetailsTwo", DetailsTwo);
			return "searchDetail2";
		}

	}
}
