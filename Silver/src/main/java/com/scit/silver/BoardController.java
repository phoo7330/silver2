package com.scit.silver;

import java.util.ArrayList;
import java.util.HashMap;

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
import com.test.fileTest.util.PageNavigator2;

@Controller
public class BoardController {

	@Autowired
	BoardDAO dao;
	SearchDAO sdao;
	private static final int boardPerPage=5;
	private static final int pagePerGroup=5;

	@RequestMapping(value = "/insertsb", method = { RequestMethod.POST, RequestMethod.GET })
	public String insertsb(SilverBoard sb, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			return "redirect:/";
		}

		int result = dao.insertsb(sb);
		int seq= sb.getSb_seq();
		
		
		return "redirect:/searchDetail?seach_seq="+sb;
	}

	@RequestMapping(value = "/pageboard", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody HashMap<String,Object> pageboard(Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "") int seach_seq) {

		HashMap<String,Object> result = new HashMap<String,Object>();
		int totalBoard=dao.countRecord(seach_seq);
		System.out.println(totalBoard);
		PageNavigator2 pn = new PageNavigator2(boardPerPage, pagePerGroup, page, totalBoard);

		ArrayList<SilverBoard> sult = dao.selectall(pn, seach_seq);

		System.out.println(result);
		model.addAttribute("navi",pn);
		System.out.println(pn);
		result.put("navi", pn);
		result.put("result", sult);
		return result;
	}
	
	@RequestMapping(value = "/oneboard", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody SilverBoard oneboard(int sb_seq) {

		SilverBoard result = dao.selectsbone(sb_seq);

		// System.out.println(result);
		return result;
	}
	
}
