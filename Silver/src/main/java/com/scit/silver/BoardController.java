package com.scit.silver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.scit.silver.dao.BoardDAO;


@Controller
public class BoardController {


	@Autowired
	BoardDAO dao;
	
	/*@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String login() {
		return "login";
	}*/

	
}
