package com.scit.silver;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.silver.dao.MemberDAO;
import com.scit.silver.vo.Member;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MemberDAO dao;
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		return "test";
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		return "redirect:/";
	}
	


	@RequestMapping(value = "/careersIndex", method = RequestMethod.GET)
	public String careersIndex(Locale locale, Model model, HttpSession session) {
		String userid = (String)session.getAttribute("loginId");
		
		if(userid!=null) {
			Member member = null;
		
			member = dao.selectMember2(userid);
			model.addAttribute("member", member);
		}
		
		
		return "careers/careersIndex";
	}
	


	


	
	
	
	
	

	
	@RequestMapping(value = "/openFacilitypage2", method = RequestMethod.GET)
	public String openFacilitypage2(Locale locale, Model model) {

		return "admin/openFacilitypage2";
	}
	
	
	
	
	
	
}
