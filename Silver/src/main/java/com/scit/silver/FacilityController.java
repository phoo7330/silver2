package com.scit.silver;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scit.silver.dao.FacilityDAO;
import com.scit.silver.dao.MemberDAO;
import com.scit.silver.dao.SearchDAO;
import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.Job;
import com.scit.silver.vo.SilverSearch;


@Controller
public class FacilityController {
	@Autowired
	SearchDAO dao1;
	@Autowired
	FacilityDAO dao;
	@Autowired
	SearchDAO sdao;
	@Autowired
	MemberDAO mdao;
	
	private static final String UPLOADPATH="c:/222/";
	@RequestMapping(value = "/upDetails1", method = { RequestMethod.POST, RequestMethod.GET })
	public String upDetails1(DetailsOne DetailsOne, Model model) {
		int result = 0;
		result = dao.upDetails1(DetailsOne);
		if(result==0) {
			System.out.println("업데이트 실패");
			model.addAttribute("message", "정보수정에 실패했습니다.");
			return "facility/facilitymypage";
		}else {
			int seach_seq =DetailsOne.getSeach_seq();
			DetailsOne reDetailsOne = sdao.selectmap4(seach_seq);
			model.addAttribute("DetailsOne", reDetailsOne);
			model.addAttribute("message", "정보수정에 성공했습니다.");
			return "facility/facilitymypage";
		}
		
	}
	@RequestMapping(value = "/upDetails2", method = { RequestMethod.POST, RequestMethod.GET })
	public String upDetails2(DetailsOne DetailsOne, Model model) {
		
		System.out.println(DetailsOne);
		int result = 0;
		result = dao.upDetails2(DetailsOne);
		if(result==0) {
			System.out.println("업데이트 실패");
			model.addAttribute("message", "정보수정에 실패했습니다.");
			return "facility/facilitymypage";
		}else {
			int seach_seq =DetailsOne.getSeach_seq();
			DetailsOne reDetailsOne = sdao.selectmap4(seach_seq);
			model.addAttribute("DetailsOne", reDetailsOne);
			model.addAttribute("message", "정보수정에 성공했습니다.");
			return "facility/facilitymypage";
		}
		
	}

	@RequestMapping(value = "/upDetails3", method = { RequestMethod.POST, RequestMethod.GET })
	public String upDetails3(DetailsOne DetailsOne, Model model) {
		
		System.out.println(DetailsOne);
		int result = 0;
		result = dao.upDetails3(DetailsOne);
		if(result==0) {
			System.out.println("업데이트 실패");
			model.addAttribute("message", "정보수정에 실패했습니다.");
			return "facility/facilitymypage";
		}else {
			int seach_seq =DetailsOne.getSeach_seq();
			DetailsOne reDetailsOne = sdao.selectmap4(seach_seq);
			model.addAttribute("DetailsOne", reDetailsOne);
			model.addAttribute("0", "정보수정에 성공했습니다.");
			return "facility/facilitymypage";
		}
		
	}
	@RequestMapping(value = "/recruitpage", method = RequestMethod.GET)
	public String recruitpage(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("managerId");
		if(mid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index";
		}
		String name = dao.mname(mid);
		int seach_seq = mdao.selseq(name);
		int type = sdao.TypeSearch(seach_seq);
		if(type==1) {
			DetailsOne DetailsOne = sdao.selectmap4(seach_seq); // 타입이 1일경우 요양병원에서 값을 가져온다.
			System.out.println(DetailsOne);
			model.addAttribute("DetailsOne", DetailsOne);
			return "facility/recruitpage";
		}else {
			DetailsTwo DetailsTwo = sdao.selectmap3(seach_seq);
			model.addAttribute("DetailsTwo", DetailsTwo);
			return "facility/recruitpage";
		}
		
	}
	
	@RequestMapping(value = "/facilitymypage", method = RequestMethod.GET)
	public String facilitymypage(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("managerId");
		if(mid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index";
		}
		String name = dao.mname(mid);
		int seach_seq = mdao.selseq(name);
		DetailsOne DetailsOne = sdao.selectmap4(seach_seq); // 타입이 1일경우 요양병원에서 값을 가져온다.
		model.addAttribute("DetailsOne", DetailsOne);
		
		return "facility/facilitymypage";
	}
	@RequestMapping(value = "/insertjob", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody 
	public int insertjob(String jobJSON) {
		int result = 0;
		try {
			JSONParser jsonParse = new JSONParser();
			JSONObject json = null;
			// JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			// JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
			JSONArray mapArray = (JSONArray) jsonParse.parse(jobJSON);

		
					  json = new JSONObject();
					  json = (JSONObject) mapArray.get(0);
					  String jo_job = (String) json.get("jo_job");
					  String jo_intt = (String)json.get("jo_int");
					  String jo_gender = (String) json.get("jo_gender");
					  String jo_content = (String) json.get("jo_content");
					  String jo_detailtype = (String) json.get("jo_detailtype");
					  String jo_type = (String) json.get("jo_type");
					  String userid = (String) json.get("userid");
					  String seq = (String) json.get("seach_seq");
					  int jo_int = Integer.parseInt(jo_intt);
					  int seach_seq = Integer.parseInt(seq);
					  
			Job job = new Job();
			job.setJo_job(jo_job);
			job.setJo_int(jo_int);
			job.setJo_gender(jo_gender);
			job.setJo_content(jo_content);
			job.setJo_detailtype(jo_detailtype);
			job.setJo_type(jo_type);
			job.setUserid(userid);
			job.setSeach_seq(seach_seq);

			result = dao.insertjob(job);

			return result;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "/updatejob", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody 
	public int updatejob(String jobJSON) {
		int result = 0;
		try {
			JSONParser jsonParse = new JSONParser();
			JSONObject json = null;
			// JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			// JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
			JSONArray mapArray = (JSONArray) jsonParse.parse(jobJSON);
		
					  json = new JSONObject();
					  json = (JSONObject) mapArray.get(0);
					  String jo_job = (String) json.get("jo_job");
					  String jo_intt = (String)json.get("jo_int");
					  String jo_gender = (String) json.get("jo_gender");
					  String jo_content = (String) json.get("jo_content");
					  String jo_detailtype = (String) json.get("jo_detailtype");
					  String jo_type = (String) json.get("jo_type");
					  String userid = (String) json.get("userid");
					  String seq = (String) json.get("seach_seq");
					  String jseq = (String) json.get("jo_seq");
					  int jo_int = Integer.parseInt(jo_intt);
					  int seach_seq = Integer.parseInt(seq);
					  int jo_seq = Integer.parseInt(jseq);
					  
			Job job = new Job();
			job.setJo_job(jo_job);
			job.setJo_int(jo_int);
			job.setJo_gender(jo_gender);
			job.setJo_content(jo_content);
			job.setJo_detailtype(jo_detailtype);
			job.setJo_type(jo_type);
			job.setUserid(userid);
			job.setSeach_seq(seach_seq);
			job.setJo_seq(jo_seq);
		
			result = dao.updatejob(job);

			return result;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping(value = "/selectjob", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<Job> selectjob(String userid) {
		ArrayList<Job> result = null;
		
		result = dao.selectjob(userid);
	
		return result;
	}
	@RequestMapping(value = "/selectonejob", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody Job selectonejob(int jo_seq) {
		Job result = null;
		
		result = dao.selectonejob(jo_seq);
	
		return result;
	}
	
	@RequestMapping(value = "/upSilverSearch_1", method = { RequestMethod.POST, RequestMethod.GET })
	public String upSilverSearch_1(SilverSearch silversearch, Model model, MultipartFile file,HttpSession session) {
		String orgname = file.getOriginalFilename();
		String name;
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddmmss");
		String secondNow=sdf.format(date);
		String ext=orgname.split("\\.")[orgname.split("\\.").length-1];
		
		name=secondNow+"."+ext;
		System.out.println("name"+name);
		try {
			file.transferTo(new File(UPLOADPATH+name));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id=(String) session.getAttribute("loginId");
		System.out.println("[세션아이디]" + id);


		silversearch.setOrgname(orgname);
		System.out.println("[본파일명]"+orgname);
		silversearch.setName(name);
		System.out.println("[서버에올린파일명]"+name);
		
		int result = 0;
		result = dao.upSilverSearch(silversearch);
		System.out.println("[들어가나??]"+silversearch);
		
		if(result==0) {
			System.out.println("업데이트 실패");
			return "facility/facilitymypage";
		}else {
			int seach_seq =silversearch.getSeach_seq();
			DetailsOne DatailOne= sdao.selectmap4(seach_seq);
			model.addAttribute("DetailsOne", DatailOne);
			System.out.println("업데이트성공");
			return "facility/facilitymypage";
		}
	}
}
