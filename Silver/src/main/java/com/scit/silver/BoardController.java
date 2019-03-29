package com.scit.silver;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.silver.dao.BoardDAO;
import com.scit.silver.dao.SearchDAO;
import com.scit.silver.vo.SilverBoard;
import com.scit.silver.vo.SilverSearch;
import com.test.fileTest.util.PageNavigator;
import com.test.fileTest.util.PageNavigator2;

@Controller
public class BoardController {

	@Autowired
	BoardDAO dao;
	SearchDAO sdao;
	private static final int boardPerPage=5;
	private static final int pagePerGroup=3;

	@RequestMapping(value = "/insertsb", method = { RequestMethod.POST, RequestMethod.GET })
	public String insertsb(SilverBoard sb, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			return "redirect:/";
		}

		int result = dao.insertsb(sb);

		return "redirect:/";
	}

	@RequestMapping(value = "/pageboard", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<SilverBoard> pageboard(Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "") int seach_seq) {

		
		int totalRecord=dao.countRecord(seach_seq);
		
		PageNavigator2 pn = new PageNavigator2(boardPerPage, pagePerGroup, page, totalRecord);

		ArrayList<SilverBoard> result = dao.selectall(pn, seach_seq);

		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value = "/oneboard", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody SilverBoard oneboard(int sb_seq) {

		SilverBoard result = dao.selectsbone(sb_seq);

		// System.out.println(result);
		return result;
	}
	
}
