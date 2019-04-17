package com.scit.silver;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.silver.dao.MemberDAO;
import com.scit.silver.dao.SearchDAO;
import com.scit.silver.dao.SeniorDAO;
import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.Member;
import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;
import com.scit.silver.vo.SilverSearch;


@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	@Autowired
	SearchDAO sdao;
	@Autowired
	SeniorDAO sndao;
	
	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/signup", method = { RequestMethod.POST, RequestMethod.GET })
	public String signup() {
		return "signup";
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
			System.out.println("[회원가입실패!]");
			return "signup";
		}else {
			model.addAttribute("message", "회원가입이 완료되었습니다!");
			return "index";
		}

		
	}
	@RequestMapping(value ="/insertSilver", method = RequestMethod.POST)
	public String insertSilver(Member member, Model model) {
		
		System.out.println(member);
		String name = member.getUsername();
		System.out.println(name);
		String name2 = null;
		name2 = dao.seachname(name);
		System.out.println("name2"+name2);
		if(name2!=null) {
			model.addAttribute("message", "이미 가입된 시설입니다. 관리자에게 문의하세요");
			System.out.println("[이미가입된시설!]");
			return "signup";
		}else {
			int result = dao.insertSilver(member);
			if(result==0) {
				model.addAttribute("message", "ID중복으로 가입실패");
				System.out.println("[중복된 아이디!]");
				return "signup";
			}else {
				model.addAttribute("message", "회원가입이 완료되었습니다!");
				return "index";
			}
			
		}
		
		
	}
	@RequestMapping(value = "/selectMember", method = RequestMethod.POST)
	public String selectMember(Member member, HttpSession session, Model model) {
		System.out.println(member); 
		int type = member.getType();
		
		if(type==1) {
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
				return "redirect:/index";
			} else if(result.getType()==2){
				session.setAttribute("loginId", result.getUserid());
				session.setAttribute("workerId", result.getUserid());
				session.setAttribute("usertype", "2");
				System.out.println("[구직자]: "+result.getUserid());
				return "redirect:/index";
			} else {
				model.addAttribute("message", "id와 pw를 확인해주세요.");
				return "index";
			}
			
		}
		else if(type==3){
			Member result = dao.selectMember(member);
			
			if (result == null) {
				model.addAttribute("message", "id와 pw를 확인해주세요.");
				model.addAttribute("member", member);
				System.out.println("[로그인실패]!");
				return "login";
			}
			if(result.getType()==3) {
				session.setAttribute("managerId", result.getUserid());
				session.setAttribute("usertype", "3");
				System.out.println("[시설관리자]: "+result.getUserid());
				int seach_seq = dao.selseq(result.getUsername());
				DetailsOne DetailsOne = sdao.selectmap4(seach_seq); // 타입이 1일경우 요양병원에서 값을 가져온다.
				System.out.println(DetailsOne);
				model.addAttribute("DetailsOne", DetailsOne);
				
				return "facility/facilitymypage";
			} else if(result.getType()==10) {
				session.setAttribute("adminId", result.getUserid());
				session.setAttribute("usertype", "10");
				System.out.println("[사이트관리자]: "+result.getUserid());
			} else {
				model.addAttribute("message", "id와 pw를 확인해주세요.");
				return "index";
			}
			
		}
		return "index";
	}
	
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(Member member, HttpSession session, Model model) {
		
		int result = 0;
		String loginId = (String) session.getAttribute("loginId");
		member.setUserid(loginId);
		result = dao.updateMember(member);
		
		if(result==0) {
			System.out.println("[회원정보수정실패]!");
			return "mypage";
		}
		model.addAttribute("message", "회원정보수정성공");
		System.out.println("[업데이트된 정보1]: "+result);
		
		return "redirect:/mypage";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Member member ,HttpSession session, Model model) {
		if (session.getAttribute("loginId") == null) {
			return "redirect:/";
		}
		Member result = null;
		SeniorCitizen scResult = null;
		SeniorCitizenDetails scdResult = null;
		Integer seq = null;
		String loginId = (String) session.getAttribute("loginId");
		
		result = dao.selectMember2(loginId);
		
		if(result == null) {
			System.out.println("mypage실패!");
			return "redirect:/";
		}
		seq = sndao.SelectSeq(loginId);
		
		if(seq!=null){
		scResult = sndao.SelectSenior(loginId);
		
		scdResult = sndao.SelectSeniorDetails(seq);
		System.out.println("[시퀀스번호]:" +seq);
		model.addAttribute("seq", seq);
		System.out.println("[어르신정보]: "+scResult);
		model.addAttribute("sc", scResult);
		System.out.println("[어르신상세정보]: "+scdResult);
		model.addAttribute("scd", scdResult);
		}
		System.out.println("[마이페이지]: "+result);
		model.addAttribute("member", result);
		
		return "mypage";
	}
	
	@RequestMapping(value = "/whatsilver", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<SilverSearch> whatsilver(String silvername) {
		System.out.println(silvername);
		
		ArrayList<SilverSearch> result = dao.whatsilver(silvername);

		System.out.println(result);
		return result;
		
	}
	
	@RequestMapping(value = "/printsilverone", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody DetailsOne printsilverone(int seach_seq) {
	
		DetailsOne result = sdao.selectmap4(seach_seq);
		
		return result;
	}
	@RequestMapping(value = "/printsilvertwo", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody DetailsTwo printsilvertwo(int seach_seq) {
		
		DetailsTwo result = sdao.selectmap3(seach_seq);
		
		return result;
	}
	@RequestMapping(value = "/idtest", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public int idtest(String userid) {
		String id = null;
				id = dao.seachid(userid);
		System.out.println(id);
		int result = 0;
		if(id!=null) { //아이디가 들어있으면 사용할수 없다.
			result = 0;
			return result;
		}else if(id==null) {
			result=1;
			return result;
		}
		return result;
		
	}
}
