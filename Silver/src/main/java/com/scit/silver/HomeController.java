package com.scit.silver;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		return "redirect:/";
	}
	
	@RequestMapping(value = "/searchDetail2", method = RequestMethod.GET)
	public String searchDetail2(Locale locale, Model model) {

		return "searchDetail2";
	}

	@RequestMapping(value = "/careersIndex", method = RequestMethod.GET)
	public String careersIndex(Locale locale, Model model) {

		return "careers/careersIndex";
	}
	
	@RequestMapping(value = "/questionpage", method = RequestMethod.GET)
	public String questionpage(Locale locale, Model model) {

		return "facility/questionpage";
	}
	 
	@RequestMapping(value = "/adminlogin", method = RequestMethod.GET)
	public String adminlogin(Locale locale, Model model) {

		return "admin/adminlogin";
	}
	
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String adminMain(Locale locale, Model model) {

		return "admin/adminMain";
	}
	
	@RequestMapping(value = "/messagepage", method = RequestMethod.GET)
	public String messagepage(Locale locale, Model model) {

		return "admin/messagepage";
	}
	
	@RequestMapping(value = "/memberpage", method = RequestMethod.GET)
	public String memberpage(Locale locale, Model model) {

		return "admin/memberpage";
	}
	
	@RequestMapping(value = "/boardpage", method = RequestMethod.GET)
	public String boardpage(Locale locale, Model model) {

		return "admin/boardpage";
	}
	
	@RequestMapping(value = "/openMemberpage", method = RequestMethod.GET)
	public String openMemberpage(Locale locale, Model model) {

		return "admin/openMemberpage";
	}
	
	@RequestMapping(value = "/openFacilitypage", method = RequestMethod.GET)
	public String openFacilitypage(Locale locale, Model model) {

		return "admin/openFacilitypage";
	}
	
	@RequestMapping(value = "/openFacilitypage2", method = RequestMethod.GET)
	public String openFacilitypage2(Locale locale, Model model) {

		return "admin/openFacilitypage2";
	}
}
