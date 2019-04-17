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
	
	public Integer SelectSeq(String loginId) {
		Integer result = null;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		try {
			result = mapper.SelectSeq(loginId);
		}catch(Exception e) {
			 e.printStackTrace();
			 return null;
		}
		return result;
		}
	
	public SeniorCitizen SelectSenior(String loginId) {
		SeniorCitizen result = null;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		try {
			result = mapper.SelectSenior(loginId);
		}catch(Exception e) {
			 e.printStackTrace();
			 return null;
		}
		return result;
	}
	
	public SeniorCitizenDetails SelectSeniorDetails(Integer seq) {
		SeniorCitizenDetails result = null;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		try {
			result = mapper.SelectSeniorDetails(seq);
		}catch(Exception e) {
			 e.printStackTrace();
			 return null;
		}
		return result;
	}
	
	public int updateSenior(SeniorCitizen updateSc) {
		int result = 0;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		try {
			result = mapper.updateSenior(updateSc);
		}catch(Exception e) {
			 e.printStackTrace();
			 return 0;
		}
		return result;
	}
	
	public int updateSeniorDetail(SeniorCitizenDetails updateScd) {
		int result = 0;
		SeniorMapper mapper = session.getMapper(SeniorMapper.class);
		try {
			result = mapper.updateSeniorDetail(updateScd);
		}catch(Exception e) {
			 e.printStackTrace();
			 return 0;
		}
		return result;
	}
	
}
