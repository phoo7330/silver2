package com.scit.silver;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.silver.dao.ResumeDAO;
import com.scit.silver.vo.Resume;

@Controller
public class ResumeController {
	
	@Autowired
	ResumeDAO dao;
	
	@RequestMapping(value = "/insertResume", method = RequestMethod.POST)
	public @ResponseBody int insertResume(Resume resume ,HttpSession session) {
		int result = 0;
		
		
		String loginId = (String) session.getAttribute("loginId");
		resume.setUserid(loginId);
		result = dao.insertResume(resume);
		
		
		if(result==0) {
			System.out.println("[insertResume실패]!");
			return 0;
		}
		System.out.println("[insertResume 성공]: "+resume);
		
		return result;
	}
	
	@RequestMapping(value = "/selectResume", method = RequestMethod.POST)
	public @ResponseBody Resume selectResume(HttpSession session) {
		Resume result = null;
		
		String loginId = (String) session.getAttribute("loginId");
		result = dao.selectResume(loginId);
		System.out.println("selectResume입력전 값"+result);
		
		if(result==null) {
			System.out.println("[insertResume실패]!");
			return null;
		}
		System.out.println("[selectResume 성공]: "+result);
		
		return result;
	}
	
	
	@RequestMapping(value = "/updateResume", method =  RequestMethod.POST)
	public @ResponseBody int updateResume(Resume resume ,HttpSession session) {
		int result = 0;
		String loginId = (String) session.getAttribute("loginId");
		resume.setUserid(loginId);
		result = dao.updateResume(resume);
		
		if(result==0) {
			System.out.println("[updateResume실패]!");
			return 0;
		}
		System.out.println("[updateResume]: "+resume);
		
		return result;
	}
	
	
}
