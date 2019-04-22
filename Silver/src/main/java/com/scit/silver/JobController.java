package com.scit.silver;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.silver.dao.JobDAO;
import com.scit.silver.dao.ResumeDAO;
import com.scit.silver.vo.Job;
import com.scit.silver.vo.Resume;
import com.test.fileTest.util.PageNavigator;



@Controller
public class JobController {
	
	@Autowired
	JobDAO dao;
	@Autowired
	ResumeDAO rdao;
	
	private static final int boardPerPage = 4;
	private static final int pagePerGroup = 3;
	
	
	@RequestMapping(value = "/jpagemap", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<Job> jpagemap(@RequestParam(defaultValue = "1") int page) {
		
		int totalRecord = dao.countRecord();
		PageNavigator pn = new PageNavigator(boardPerPage, pagePerGroup, page, totalRecord);
		
		ArrayList<Job> result = dao.selectAllJob(pn);
		//System.out.println("jpagemap : "+result.size());

		return result;
	}
	
	@RequestMapping(value = "/jselectmap", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<Job> jselectmap() {

		ArrayList<Job> result = dao.selectAllJob();

		//System.out.println("jselectmap : "+result.size());
		return result;
	}
	
	@RequestMapping(value = "/jselectmap2", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Job> jselectmap2(@RequestParam(defaultValue = "1") int page, HttpServletRequest request,
			String maptestJSON) {

		ArrayList<Job> result = null;

		try {
			// System.out.println(maptestJSON);
			JSONParser jsonParse = new JSONParser();
			// JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			// JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
			JSONArray mapArray = (JSONArray) jsonParse.parse(maptestJSON);
			ArrayList<Job> maptest = mapArray;
			
			int totalRecord = dao.countRecord2(maptest);
			 System.out.println("jselectmap2"+maptest);
			PageNavigator pn = new PageNavigator(boardPerPage, pagePerGroup, page, totalRecord);

			result = dao.selectmap2(pn, maptest);
			return result;
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@RequestMapping(value = "/selectjob1", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<Job> selectjob1(Job job) {
		//System.out.println(job);
		String seach = null;
		seach = job.getSilvername();
		System.out.println("서치: "+seach);
		
		if(seach.isEmpty()) {
			System.out.println("서치가 널일경우");
			ArrayList<Job> result = dao.selectAllJob();
			return result;
		}else {
			System.out.println("서치가 널이 아닐경우");
			ArrayList<Job> result = dao.seachjob1(seach);
			return result;
		}
	
		
	}
	
	@RequestMapping(value = "/selectjob2", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody 
	public ArrayList<Job> selectjob2(String jobJSON) {
		ArrayList<Job> result = null;

		try {
			JSONParser jsonParse = new JSONParser();
			JSONObject json = null;
			// JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			// JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
			JSONArray mapArray = (JSONArray) jsonParse.parse(jobJSON);
			System.out.println(mapArray.get(0));
		
					  json = new JSONObject();
					  json = (JSONObject) mapArray.get(0);
					  String areaa = (String) json.get("areaa");
					  String jo_gender = (String) json.get("jo_gender");
					  String areab = (String) json.get("areab");
					  String jo_job = (String) json.get("jo_job");
					  String jo_detailtype = (String) json.get("jo_detailtype");
					  String jo_type = (String) json.get("jo_type");
					  
					  System.out.println(areaa+jo_gender+areab+jo_job+jo_detailtype+jo_type);
			Job job = new Job();
			job.setAreaa(areaa);
			job.setAreab(areab);
			job.setJo_gender(jo_gender);
			job.setJo_job(jo_job);
			job.setJo_type(jo_type);
			job.setJo_detailtype(jo_detailtype);
			System.out.println(job);
			result = dao.seachjob2(job);
					 
			System.out.println("seachjob2:"+result);
			return result;
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@RequestMapping(value = "/selonere", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody Resume selonere(String userid) {
		Resume result = null;
		result = rdao.selonere(userid);
		return result;
	}
	
	
	
}
