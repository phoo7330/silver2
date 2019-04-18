package com.scit.silver.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.SilverSearch;


@Repository
public class FacilityDAO {

	@Autowired
	SqlSession session;
	public int upSilverSearch(SilverSearch sb) {	
		int result = 0;
		FacilityMapper mapper = session.getMapper(FacilityMapper.class);
		try {
			System.out.println(sb);
			result = mapper.upSilverSearch(sb);
			System.out.println(result);
			} catch(Exception e) {
			e.printStackTrace();
		}
		return result;		
	}
	
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
}
