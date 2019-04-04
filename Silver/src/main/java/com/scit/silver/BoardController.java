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
import com.scit.silver.vo.SilverBoardComent;
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
		int seq= sb.getSeach_seq();
		
		
		return "redirect:/searchDetail?seach_seq="+seq;
	}

	
	@RequestMapping(value = "/updatesb", method = { RequestMethod.POST, RequestMethod.GET })
	public String updatesb(SilverBoard sb, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			return "redirect:/";
		}

		System.out.println(sb);
		int result = dao.updatesb(sb);
		int seq= sb.getSeach_seq();
		
		
		return "redirect:/searchDetail?seach_seq="+seq;
	}
	@RequestMapping(value = "/pageboard", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody HashMap<String,Object> pageboard(
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "") int seach_seq) {

		HashMap<String,Object> result = new HashMap<String,Object>();
		int totalBoard=dao.countRecord(seach_seq);
		PageNavigator2 pn = new PageNavigator2(boardPerPage, pagePerGroup, page, totalBoard);

		ArrayList<SilverBoard> sult = dao.selectall(pn, seach_seq);

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
	@RequestMapping(value = "/insertComment", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody int insertComment(SilverBoardComent sbc) {

		int result = dao.insertComment(sbc);

		// System.out.println(result);
		return result;
	}
	
	@RequestMapping(value = "/selectComment", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody HashMap<String,Object> selectComment(
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "") int sb_seq) {
		
		HashMap<String,Object> result = new HashMap<String,Object>();
		int totalBoard=dao.countRecord2(sb_seq);
		PageNavigator2 pn = new PageNavigator2(boardPerPage, pagePerGroup, page, totalBoard);

		ArrayList<SilverBoardComent> sult = dao.selectComent(pn, sb_seq);

		result.put("navi", pn);
		result.put("result", sult);
		//System.out.println(result);
		return result;
	}
	@RequestMapping(value = "/delsb", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody int delsb(int sb_seq, HttpSession session) {
		SilverBoard sb = dao.selectsbone(sb_seq);
		String loginId=(String)session.getAttribute("loginId");
		
		if(sb.getUserid()==loginId) {
			int result = dao.delsb(sb_seq);

			System.out.println(result);
			return result;
		}else {
			return 0;
		}
		
		
	}
	
}
