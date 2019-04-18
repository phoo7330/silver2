package com.scit.silver;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.silver.dao.FacilityDAO;
import com.scit.silver.dao.MemberDAO;
import com.scit.silver.dao.SearchDAO;
import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.Job;


@Controller
public class FacilityController {
	
	@Autowired
	FacilityDAO dao;
	@Autowired
	SearchDAO sdao;
	@Autowired
	MemberDAO mdao;
	
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
			model.addAttribute("message", "정보수정에 성공했습니다.");
			return "facility/facilitymypage";
		}
		
	}
	@RequestMapping(value = "/recruitpage", method = RequestMethod.GET)
	public String recruitpage(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("managerId");
		System.out.println("mid"+mid);
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
			System.out.println(DetailsTwo);
			model.addAttribute("DetailsTwo", DetailsTwo);
			return "facility/recruitpage";
		}
		
	}
	
	@RequestMapping(value = "/facilitymypage", method = RequestMethod.GET)
	public String facilitymypage(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("managerId");
		System.out.println("mid"+mid);
		if(mid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index";
		}
		String name = dao.mname(mid);
		int seach_seq = mdao.selseq(name);
		DetailsOne DetailsOne = sdao.selectmap4(seach_seq); // 타입이 1일경우 요양병원에서 값을 가져온다.
		System.out.println(DetailsOne);
		model.addAttribute("DetailsOne", DetailsOne);
		
		return "facility/facilitymypage";
	}
	@RequestMapping(value = "/insertjob", method = { RequestMethod.POST, RequestMethod.GET })
	public String insertjob(String jobJSON) {
		
		try {
			JSONParser jsonParse = new JSONParser();
			JSONObject json = null;
			// JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			// JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
			JSONArray mapArray = (JSONArray) jsonParse.parse(jobJSON);
			System.out.println(mapArray.get(0));
		
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
			
			System.out.println(job);
			int result = 0;
			result = dao.insertjob(job);
			System.out.println(result);
			return null;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}