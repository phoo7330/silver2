package com.scit.silver;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.scit.silver.dao.FacilityDAO;
import com.scit.silver.dao.SearchDAO;
import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.SilverSearch;


@Controller
public class FacilityController {
	@Autowired
	SearchDAO dao1;
	@Autowired
	FacilityDAO dao;
	@Autowired
	SearchDAO sdao;
	private static final String UPLOADPATH="c:/222/";
	@RequestMapping(value = "/upDetails1", method = { RequestMethod.POST, RequestMethod.GET })
	public String upDetails1(DetailsOne DetailsOne, Model model) {
		int result = 0;
		result = dao.upDetails1(DetailsOne);
		if(result==0) {
			System.out.println("업데이트 실패");
			model.addAttribute("message", "정보수정에 실패했습니다.");
			return "facility/facilitymypage";
		}else {
			int seach_seq =DetailsOne.getSeach_seq();
			DetailsOne reDetailsOne = sdao.selectmap4(seach_seq);
			model.addAttribute("DetailsOne", reDetailsOne);
			model.addAttribute("message", "정보수정에 성공했습니다.");
			return "facility/facilitymypage";
		}
		
	}
	@RequestMapping(value = "/upDetails2", method = { RequestMethod.POST, RequestMethod.GET })
	public String upDetails2(DetailsOne DetailsOne, Model model) {
		
		System.out.println(DetailsOne);
		int result = 0;
		result = dao.upDetails2(DetailsOne);
		if(result==0) {
			System.out.println("업데이트 실패");
			model.addAttribute("message", "정보수정에 실패했습니다.");
			return "facility/facilitymypage";
		}else {
			int seach_seq =DetailsOne.getSeach_seq();
			DetailsOne reDetailsOne = sdao.selectmap4(seach_seq);
			model.addAttribute("DetailsOne", reDetailsOne);
			model.addAttribute("message", "정보수정에 성공했습니다.");
			return "facility/facilitymypage";
		}
		
	}

	@RequestMapping(value = "/upDetails3", method = { RequestMethod.POST, RequestMethod.GET })
	public String upDetails3(DetailsOne DetailsOne, Model model) {
		
		System.out.println(DetailsOne);
		int result = 0;
		result = dao.upDetails3(DetailsOne);
		if(result==0) {
			System.out.println("업데이트 실패");
			model.addAttribute("message", "정보수정에 실패했습니다.");
			return "facility/facilitymypage";
		}else {
			int seach_seq =DetailsOne.getSeach_seq();
			DetailsOne reDetailsOne = sdao.selectmap4(seach_seq);
			model.addAttribute("DetailsOne", reDetailsOne);
			model.addAttribute("0", "정보수정에 성공했습니다.");
			return "facility/facilitymypage";
		}
		
	}
	
	@RequestMapping(value = "/upSilverSearch_1", method = { RequestMethod.POST, RequestMethod.GET })
	public String upSilverSearch_1(SilverSearch silversearch, Model model, MultipartFile file,HttpSession session) {
		String orgname = file.getOriginalFilename();
		String name;
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddmmss");
		String secondNow=sdf.format(date);
		String ext=orgname.split("\\.")[orgname.split("\\.").length-1];
		
		name=secondNow+"."+ext;
		System.out.println("name"+name);
		try {
			file.transferTo(new File(UPLOADPATH+name));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id=(String) session.getAttribute("loginId");
		System.out.println("[세션아이디]" + id);


		silversearch.setOrgname(orgname);
		System.out.println("[본파일명]"+orgname);
		silversearch.setName(name);
		System.out.println("[서버에올린파일명]"+name);
		
		int result = 0;
		result = dao.upSilverSearch(silversearch);
		System.out.println("[들어가나??]"+silversearch);
		
		if(result==0) {
			System.out.println("업데이트 실패");
			return "facility/facilitymypage";
		}else {
			int seach_seq =silversearch.getSeach_seq();
			DetailsOne DatailOne= sdao.selectmap4(seach_seq);
			model.addAttribute("DetailsOne", DatailOne);
			System.out.println("업데이트성공");
			return "facility/facilitymypage";
		}
	}
}
