package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.Job;


@Repository
public class FacilityDAO {

	@Autowired
	SqlSession session;
	
	
	public int upDetails1(DetailsOne DetailsOne) {
		int result = 0;
		FacilityMapper mapper = session.getMapper(FacilityMapper.class);
		try {
			result = mapper.upDetails1(DetailsOne);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int upDetails2(DetailsOne DetailsOne) {
		int result = 0;
		FacilityMapper mapper = session.getMapper(FacilityMapper.class);
		try {
			result = mapper.upDetails2(DetailsOne);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int upDetails3(DetailsOne DetailsOne) {
		int result = 0;
		FacilityMapper mapper = session.getMapper(FacilityMapper.class);
		try {
			result = mapper.upDetails3(DetailsOne);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String mname(String userid) {
		String result = null;
		FacilityMapper mapper = session.getMapper(FacilityMapper.class);
		result = mapper.mname(userid);

		return result;
	}

	public int insertjob(Job job) {
		int result = 0;
		FacilityMapper mapper = session.getMapper(FacilityMapper.class);
		result = mapper.insertjob(job);

		return result;
	}
	
	public int updatejob(Job job) {
		int result = 0;
		FacilityMapper mapper = session.getMapper(FacilityMapper.class);
		result = mapper.updatejob(job);

		return result;
	}
	public ArrayList<Job> selectjob(String userid){
		ArrayList<Job> result = null;
		FacilityMapper mapper = session.getMapper(FacilityMapper.class);
		result = mapper.selectjob(userid);
		
		return result;
	}
	
	public Job selectonejob(int jo_seq) {
		Job result = null;
		FacilityMapper mapper = session.getMapper(FacilityMapper.class);
		result = mapper.selectonejob(jo_seq);
		
		return result;
		
	}

}
