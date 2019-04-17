package com.scit.silver;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.silver.dao.SeniorDAO;
import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;

@Controller
public class SeniorController {

	@Autowired
	SeniorDAO dao;
	//노인정보등록
	@RequestMapping(value ="/insertSenior", method = RequestMethod.POST)
	public String insertSenior(SeniorCitizen sc, SeniorCitizenDetails scd,HttpSession session,Model model) {
		int resultSc = 0;
		int resultScd = 0;
		Integer seq = 0;
		String loginId = (String) session.getAttribute("loginId");
		sc.setUserid(loginId);
		resultSc = dao.insertSenior(sc);
		System.out.println("insert[어르신정보]: "+resultSc);
		seq = dao.SelectSeq(loginId);
		System.out.println("insert[시퀀스]: "+seq);
		scd.setSc_seq(seq);
		resultScd = dao.insertSeniorDetails(scd);
		System.out.println("insert[어르신상세정보]: "+resultScd);
		
		if(resultSc!=0 && seq!=0 && resultScd!=0) {
			System.out.println("[어르신등록성공]");
			return "redirect:/mypage";
		}
		System.out.println("[insertSenior실패!]");
		return "redirect:/";
		}
	
	@RequestMapping(value = "/updateSenior", method = RequestMethod.POST)
	public String updateSenior(SeniorCitizenDetails updateScd, SeniorCitizen updateSc, HttpSession session, Model model) {
		System.out.println(updateScd);
		System.out.println(updateSc);
		int result = 0;
		int result2 = 0;
		Integer seq = 0;
		String loginId = (String) session.getAttribute("loginId");
		updateSc.setUserid(loginId);
		
		
		result = dao.updateSenior(updateSc);
		seq = dao.SelectSeq(loginId);
		updateScd.setSc_seq(seq);
		result2 = dao.updateSeniorDetail(updateScd);
		
		
		if(result==0 || result2==0 || seq==null) {
			System.out.println("[updateSenior실패]!");
			return "redirect:/";
		}
		return "redirect:/mypage";
	}
}
