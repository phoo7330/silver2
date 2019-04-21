package com.scit.silver;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.silver.dao.AdminDAO;
import com.scit.silver.dao.JobDAO;
import com.scit.silver.dao.SeniorDAO;
import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.Job;
import com.scit.silver.vo.Member;
import com.scit.silver.vo.Resume;
import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;

@Controller
public class AdminController {

	@Autowired
	AdminDAO dao;
	@Autowired
	SeniorDAO sndao;
	@Autowired
	JobDAO jdao;
	
	
	@RequestMapping(value = "/adminlogin", method = RequestMethod.GET)
	public String adminlogin(Locale locale, Model model) {

		return "admin/adminlogin";
	}
	
	@RequestMapping(value = "/memberpage", method = RequestMethod.GET)
	public String memberpage(HttpSession session, Model model) {
		String aid = (String)session.getAttribute("adminId");
		if(aid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index"; 
		}
		
		return "admin/memberpage";
	}
	
	@RequestMapping(value = "/selmem1", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<Member> selmem1(int type) {
		ArrayList<Member> result = null;
		
		result = dao.selmember(type);
		/*for(int i = 0; i<result.size(); i++) {
			if(result.get(i).getWarning()>=3) {
				int j = dao.delmember(result.get(i).getUserid());
			}
		}*/
	
		return result;
	}
	
	@RequestMapping(value = "/selmem2", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<Member> selmem2(int type) {
		ArrayList<Member> result = null;
		result = dao.selmember(type);
		return result;
	}
	
	@RequestMapping(value = "/openMemberpage", method = RequestMethod.GET)
	public String openMemberpage(String userid, Model model) {

		System.out.println(userid);
		int type = dao.whattype2(userid);
		Member member = null;
		member = dao.selonemem(userid);
		model.addAttribute("member", member);
		SeniorCitizen scResult = null;
		SeniorCitizenDetails scdResult = null;
		Integer seq = sndao.SelectSeq(userid);
		
		if(seq!=null){
		scResult = sndao.SelectSenior(userid);
		scdResult = sndao.SelectSeniorDetails(seq);
		System.out.println("[시퀀스번호]:" +seq);
		model.addAttribute("seq", seq);
		System.out.println("[어르신정보]: "+scResult);
		model.addAttribute("sc", scResult);
		System.out.println("[어르신상세정보]: "+scdResult);
		model.addAttribute("scd", scdResult);
		}
		
		if(type==1) { //일반회원일경우 member 정보와 노인정보
			return "admin/openMemberpage";
		}else {	//종사자일경우 member,노인정보,이력서 정보
			Resume resume = dao.selonere(userid);
			model.addAttribute("resume", resume);
			System.out.println(resume);
			return "admin/openMemberpage";
		}
		
		
	}
	
	
	@RequestMapping(value = "/openFacilitypage", method = RequestMethod.GET)
	public String openFacilitypage(String username, Model model) {
		System.out.println(username);
		int type = dao.whattype(username);
		
		if(type==1) {
			DetailsOne result = dao.seldeone(username);
			model.addAttribute("DetailsOne", result);
			return "admin/openFacilitypage";
		}else {
			DetailsTwo result = dao.seldetwo(username);
			model.addAttribute("DetailsTwo", result);
			return "admin/openFacilitypage2";
		}
		
		
	}
	
	@RequestMapping(value = "/warningmem", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody int warningmem(String userid) {
		int result = 0;
		result = dao.warningmem(userid);
		
		return result;
	}
	
	@RequestMapping(value = "/boardpage", method = RequestMethod.GET)
	public String boardpage(Locale locale, Model model) {
		ArrayList<Job> result = jdao.selectAllJob();
		
		System.out.println(result);
		return "admin/boardpage";
	}
	
}
