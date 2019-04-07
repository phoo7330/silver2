package com.scit.silver;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.silver.dao.SeniorDAO;
import com.scit.silver.vo.Member;
import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;

@Controller
public class SeniorController {

	@Autowired
	SeniorDAO dao;
	//노인정보등록
	@RequestMapping(value ="/insertSenior", method = RequestMethod.POST)
	public String insertSenior(SeniorCitizen sc, SeniorCitizenDetails scd,HttpSession session,Model model) {
		int result = 0;
		int result2 = 0;
		int seq = 0;
		String loginId = (String) session.getAttribute("loginId");
		sc.setUserid(loginId);
		result = dao.insertSenior(sc);
		seq = dao.SelectSeq(loginId);
		scd.setSc_seq(seq);
		result2 = dao.insertSeniorDetails(scd);
		
		if(result!=0 && seq!=0 && result2!=0) {
			System.out.println("[어르신등록성공]");
			return "mypage";
		}
		System.out.println("[어르신등록실패!]");
		return "index";
	}
}
