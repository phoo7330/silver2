package com.scit.silver;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.silver.dao.MemberDAO;
import com.scit.silver.vo.Member;


@Controller
public class MemberController {


	@Autowired
	MemberDAO dao;
	
	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/signup", method = { RequestMethod.POST, RequestMethod.GET })
	public String signup() {
		return "signup";
	}

	@RequestMapping(value = "/search", method = { RequestMethod.POST, RequestMethod.GET })
	public String search () {
		return "search";
	}
	
	
	@RequestMapping(value = "/logout", method = { RequestMethod.POST, RequestMethod.GET })
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/";
	}
	
	
	
	@RequestMapping(value ="/insertMember", method = RequestMethod.POST)
	public String insertMember(Member member, Model model) {
		int result = dao.insertMember(member);

		if (result == 0) {
			model.addAttribute("message", "ID중복으로 가입실패");
			model.addAttribute("member", member);
			System.out.println("[회원가입실패!]");
			return "signup";
		}

		return "index";
	}
	
	@RequestMapping(value = "/selectMember", method = RequestMethod.POST)
	public String selectMember(Member member, HttpSession session, Model model) {

		Member result = dao.selectMember(member);

		if (result == null) {
			model.addAttribute("message", "id와 pw를 확인해주세요.");
			model.addAttribute("member", member);
			System.out.println("[로그인실패]!");
			return "login";
		}

		if(result.getType()==1) {
			session.setAttribute("loginId", result.getUserid());
			session.setAttribute("nomalId", result.getUserid());
			session.setAttribute("usertype", "1");
			System.out.println("[일반회원]: "+result.getUserid());
		} else if(result.getType()==2){
			session.setAttribute("loginId", result.getUserid());
			session.setAttribute("workerId", result.getUserid());
			session.setAttribute("usertype", "2");
			System.out.println("[구직자]: "+result.getUserid());
		} else if(result.getType()==3) {
			session.setAttribute("loginId", result.getUserid());
			session.setAttribute("managerId", result.getUserid());
			session.setAttribute("usertype", "3");
			System.out.println("[시설관리자]: "+result.getUserid());
		} else if(result.getType()==10) {
			session.setAttribute("loginId", result.getUserid());
			session.setAttribute("adminId", result.getUserid());
			session.setAttribute("usertype", "10");
			System.out.println("[사이트관리자]: "+result.getUserid());
		} 
		System.out.println("[세션에 입력된 아이디]: "+result.getUserid());
		System.out.println("[세션에서 입력된 회원타입]: "+session.getAttribute("usertype"));
		return "index";
	}
}
