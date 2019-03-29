package com.scit.silver;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.silver.dao.BoardDAO;
import com.scit.silver.vo.SilverBoard;


@Controller
public class BoardController {


	@Autowired
	BoardDAO dao;
	
	@RequestMapping(value = "/insertsb", method = { RequestMethod.POST, RequestMethod.GET })
	public String insertsb(SilverBoard sb, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			
			return "redirect:/";
		}
		
		System.out.println(sb);
		int result = dao.insertsb(sb);
		
		
		
		return "redirect:/";
	}

	
}
