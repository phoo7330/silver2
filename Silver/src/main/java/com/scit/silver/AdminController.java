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
		
		int a,b,c = 0;
		a=dao.counttype("정규직");
		b=dao.counttype("계약직");
		c=dao.counttype("시간제");
		
		model.addAttribute("ctype1", a);
		model.addAttribute("ctype2", b);
		model.addAttribute("ctype3", c);
		int a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23 = 0;
		a1=dao.countjob("시설장");
		a2=dao.countjob("사무국장");
		a3=dao.countjob("사회복지사");
		a4=dao.countjob("의사");
		a5=dao.countjob("촉탁의사");
		a6=dao.countjob("간호사");
		a7=dao.countjob("간호조무사");
		a8=dao.countjob("치과위생사");
		a9=dao.countjob("물리치료사");
		a10=dao.countjob("작업치료사");
		a11=dao.countjob("요양보호사 1급");
		a12=dao.countjob("요양보호사 2급");
		a13=dao.countjob("요양보호사 기존유예자");
		a14=dao.countjob("영양사");
		a15=dao.countjob("사무원");
		a16=dao.countjob("조리원");
		a17=dao.countjob("위생원");
		a18=dao.countjob("관리인");
		a19=dao.countjob("보조원 운전사");
		a20=dao.countjob("프로그램관리자");
		a21=dao.countjob("치매전문교육이수자");
		a22=dao.countjob("청구담당자");
		a23=dao.countjob("기타");
		model.addAttribute("cjob1", a1);
		model.addAttribute("cjob2", a2);
		model.addAttribute("cjob3", a3);
		model.addAttribute("cjob4", a4);
		model.addAttribute("cjob5", a5);
		model.addAttribute("cjob6", a6);
		model.addAttribute("cjob7", a7);
		model.addAttribute("cjob8", a8);
		model.addAttribute("cjob9", a9);
		model.addAttribute("cjob10", a10);
		model.addAttribute("cjob11", a11);
		model.addAttribute("cjob12", a12);
		model.addAttribute("cjob13", a13);
		model.addAttribute("cjob14", a14);
		model.addAttribute("cjob15", a15);
		model.addAttribute("cjob16", a16);
		model.addAttribute("cjob17", a17);
		model.addAttribute("cjob18", a18);
		model.addAttribute("cjob19", a19);
		model.addAttribute("cjob20", a20);
		model.addAttribute("cjob21", a21);
		model.addAttribute("cjob22", a22);
		model.addAttribute("cjob23", a23);
		
		
		int mm, ww, all = 0;
		mm = dao.countgen("남");
		ww = dao.countgen("여");
		all = dao.countgen("전체");
		model.addAttribute("cgen1", mm);
		model.addAttribute("cgen2", ww);
		model.addAttribute("cgen3", all);
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
	
	
	@RequestMapping(value = "/messagepage", method = RequestMethod.GET)
	public String messagepage(HttpSession session, Model model) {
		String aid = (String)session.getAttribute("adminId");
		if(aid==null) {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "index"; 
		}
		return "admin/messagepage";
	}
	
}
