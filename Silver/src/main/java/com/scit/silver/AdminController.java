package com.scit.silver;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.silver.dao.BoardDAO;
import com.scit.silver.dao.SearchDAO;

@Controller
public class AdminController {

	@Autowired
	BoardDAO dao;
	SearchDAO sdao;
	
	
	@RequestMapping(value = "/adminlogin", method = RequestMethod.GET)
	public String adminlogin(Locale locale, Model model) {

		return "admin/adminlogin";
	}
	
	@RequestMapping(value = "/memberpage", method = RequestMethod.GET)
	public String memberpage(Locale locale, Model model) {

		return "admin/memberpage";
	}
	
}
