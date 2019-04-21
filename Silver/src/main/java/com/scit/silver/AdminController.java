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
import com.scit.silver.dao.BoardDAO;
import com.scit.silver.dao.JobDAO;
import com.scit.silver.dao.SeniorDAO;
import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.Job;
import com.scit.silver.vo.Member;
import com.scit.silver.vo.Resume;
import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;
import com.scit.silver.vo.SilverBoard;
import com.scit.silver.vo.SilverBoardComent;

@Controller
public class AdminController {

	@Autowired
	AdminDAO dao;
	@Autowired
	SeniorDAO sndao;
	@Autowired
	JobDAO jdao;
	@Autowired
	BoardDAO bdao;
	
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
		
		int a,b,c = 0;
		a=dao.countmember(1);
		b=dao.countmember(2);
		c=dao.countmember(3);
		
		model.addAttribute("count1", a);
		model.addAttribute("count2", b);
		model.addAttribute("count3", c);
		
		int aa,bb = 0;
		aa=dao.counts("남성");
		bb=dao.counts("여성");
		model.addAttribute("count11", aa);
		model.addAttribute("count22", bb);
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
	public String openMemberpage(String userid, Model model, HttpSession session) {
		String aid = (String)session.getAttribute("adminId");
		if(aid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index"; 
		}
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
			return "admin/openMemberpage";
		}
		
		
	}
	
	
	@RequestMapping(value = "/openFacilitypage", method = RequestMethod.GET)
	public String openFacilitypage(String username, Model model, HttpSession session) {
		String aid = (String)session.getAttribute("adminId");
		if(aid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index"; 
		}
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
	public String boardpage(Locale locale, Model model, HttpSession session) {
		String aid = (String)session.getAttribute("adminId");
		if(aid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index"; 
		}
		return "admin/boardpage";
	}
	
	@RequestMapping(value = "/selb1", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<Job> selb1() {
		ArrayList<Job> result = jdao.selectAllJob();
		
		return result;
	}
	
	@RequestMapping(value = "/openRecruitDetail", method = RequestMethod.GET)
	public String openRecruitDetail(int jo_seq, Model model, HttpSession session) {
		String aid = (String)session.getAttribute("adminId");
		if(aid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index"; 
		}
		
		Job result = dao.selonejob(jo_seq);
		model.addAttribute("job", result);
		return "admin/openRecruitDetail";
	}
	@RequestMapping(value = "/deljob2", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody int deljob2(int jo_seq) {
		int result = dao.deljob2(jo_seq);
		
		return result;
	}
	
	@RequestMapping(value = "/selb2", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<SilverBoard> selb2() {
		ArrayList<SilverBoard> result = dao.selectallboard();
		
		return result;
	}
	@RequestMapping(value = "/openBoardDetail", method = RequestMethod.GET)
	public String openBoardDetail(int sb_seq, Model model, HttpSession session) {
		String aid = (String)session.getAttribute("adminId");
		if(aid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index"; 
		}
		//System.out.println(sb_seq);
		SilverBoard result = bdao.selectsbone(sb_seq);
		model.addAttribute("sbone", result);
		return "admin/openBoardDetail";
	}
	
	@RequestMapping(value = "/delboard2", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody int delboard2(int sb_seq) {
		int result = dao.delboard2(sb_seq);
		
		return result;
	}
	@RequestMapping(value = "/selb3", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<SilverBoardComent> selb3() {
		ArrayList<SilverBoardComent> result = dao.selectallComent();
		
		return result;
	}
	@RequestMapping(value = "/openCommentDetail", method = RequestMethod.GET)
	public String openCommentDetail(int sbc_seq, Model model, HttpSession session) {
		String aid = (String)session.getAttribute("adminId");
		if(aid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index"; 
		}
		SilverBoardComent sbc = bdao.selectonec(sbc_seq);
		
		model.addAttribute("sbcone", sbc);
		return "admin/openCommentDetail";
	}
	
	@RequestMapping(value = "/delcoment2", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody int delcoment2(int sbc_seq) {
		
		int result = dao.delcoment2(sbc_seq);
		
		return result;
	}
}
