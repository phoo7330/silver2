package com.scit.silver.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;

@Repository
public class SeniorDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertSenior(SeniorCitizen seniorcitizen) {
		int result = 0;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		
		return result;
	}
	
	public int insertSeniorDetails(SeniorCitizenDetails seniorcitizendetails) {
		int result = 0;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		return result;
	}
	
}
