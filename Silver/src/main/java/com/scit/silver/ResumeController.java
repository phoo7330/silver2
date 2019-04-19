package com.scit.silver;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.silver.dao.ResumeDAO;
import com.scit.silver.vo.Resume;

@Controller
public class ResumeController {
	
	@Autowired
	ResumeDAO dao;
	
	@RequestMapping(value = "/insertResume", method = RequestMethod.POST)
	public String insertResume(Resume resume ,HttpSession session) {
		int result = 0;
		String loginId = (String) session.getAttribute("loginId");
		resume.setUserid(loginId);
		result = dao.insertResume(resume);
		
		if(result==0) {
			System.out.println("[insertResume실패]!");
			return "mypage";
		}
		System.out.println("[insertResume 성공]: "+resume);
		
		return "/redirect:/mypage";
	}
	
	@RequestMapping(value = "/updateResume", method =  RequestMethod.POST)
	public String updateResume(Resume resume ,HttpSession session) {
		int result = 0;
		String loginId = (String) session.getAttribute("loginId");
		resume.setUserid(loginId);
		result = dao.updateResume(resume);
		
		if(result==0) {
			System.out.println("[updateResume실패]!");
			return "mypage";
		}
		System.out.println("[updateResume]: "+resume);
		
		return "redirect:/mypage";
	}
	
	
}
