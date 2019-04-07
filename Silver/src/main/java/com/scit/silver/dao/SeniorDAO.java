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
	
	public int insertSenior(SeniorCitizen sc) {
		int result = 0;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		try {
			result = mapper.insertSenior(sc);
		}catch(Exception e) {
			 e.printStackTrace();
			 return 0;
		}
		return result;
	}
	
	public int insertSeniorDetails(SeniorCitizenDetails scd) {
		int result = 0;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		try {
			result = mapper.insertSeniorDetails(scd);
		}catch(Exception e) {
			 e.printStackTrace();
			 return 0;
		}
		return result;
	}
	
	public int SelectSeq(String loginId) {
		int result = 0;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		try {
			result = mapper.SelectSeq(loginId);
		}catch(Exception e) {
			 e.printStackTrace();
			 return 0;
		}
		return result;
		}
}
