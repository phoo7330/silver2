package com.scit.silver;

import javax.servlet.http.HttpSession;

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
	
}
