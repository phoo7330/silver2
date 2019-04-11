package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.Job;
import com.scit.silver.vo.SilverSearch;
import com.test.fileTest.util.PageNavigator;


@Repository
public class JobDAO {

	@Autowired
	SqlSession session;
	
	public ArrayList<Job> selectAllJob(){
		ArrayList<Job> result =null;
		
		JobMapper mapper = session.getMapper(JobMapper.class);
		
		result = mapper.selectAllJob();
		
		return result;
	}
	public ArrayList<Job> selectAllJob(PageNavigator pn){
		ArrayList<Job> result =null;
		
		RowBounds rb=new RowBounds(pn.getStartBoardCurrentPage(),pn.getBoardPerPage());//어디위치부터, 몇개까지
	      
		JobMapper mapper = session.getMapper(JobMapper.class);
		
		result = mapper.selectAllJob(rb);
		
		return result;
	}
	public ArrayList<Job> selectmap2(PageNavigator pn, ArrayList<Job> Job){
	      ArrayList<Job> result = null;
	      
	      RowBounds rb=new RowBounds(pn.getStartBoardCurrentPage(),pn.getBoardPerPage());//어디위치부터, 몇개까지
	      
	      
	      JobMapper mapper = session.getMapper(JobMapper.class);
	      
	      result = mapper.selectmap2(rb, Job);

	      return result;
	   }
	
	public int countRecord() {
		int result = 0;
	      
		JobMapper mapper = session.getMapper(JobMapper.class);
	      
	    result = mapper.countRecord();
	      
	    return result;
	}
	
	public int countRecord2(ArrayList<Job> Job) {
		 int result = 0;
	      
		 JobMapper mapper = session.getMapper(JobMapper.class);
	      
	      result = mapper.countRecord2(Job);
	      
	      return result;
	}
	

	public ArrayList<Job> seachjob1(String seach){
		ArrayList<Job> result = null;
		JobMapper mapper = session.getMapper(JobMapper.class);

		result = mapper.seachjob1(seach);
		
		return result;
	}

}
