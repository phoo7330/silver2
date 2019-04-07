package com.scit.silver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.scit.silver.dao.SeniorDAO;

@Controller
public class SeniorController {

	@Autowired
	SeniorDAO dao;
	
}
