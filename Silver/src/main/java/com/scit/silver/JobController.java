package com.scit.silver;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.silver.dao.JobDAO;
import com.scit.silver.vo.Job;
import com.scit.silver.vo.SilverSearch;
import com.test.fileTest.util.PageNavigator;



@Controller
public class JobController {
	
	@Autowired
	JobDAO dao;
	
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
			 
			PageNavigator pn = new PageNavigator(boardPerPage, pagePerGroup, page, totalRecord);

			result = dao.selectmap2(pn, maptest);
			return result;
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@RequestMapping(value = "/selectjob2", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<Job> selectjob2(Job job) {
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
		/*System.out.println(totalRecord);
		System.out.println(result.size());*/
		
		
	}
}
