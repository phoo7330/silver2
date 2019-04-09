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

		return result;
	}
	
	@RequestMapping(value = "/jselectmap", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<Job> jselectmap() {

		ArrayList<Job> result = dao.selectAllJob();

		// System.out.println(result);
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
			// System.out.println(totalRecord);
			PageNavigator pn = new PageNavigator(boardPerPage, pagePerGroup, page, totalRecord);

			result = dao.selectmap2(pn, maptest);
			// System.out.println(result);
			return result;
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
}
