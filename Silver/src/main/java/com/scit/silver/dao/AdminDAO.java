package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.Member;
import com.scit.silver.vo.Resume;


@Repository
public class AdminDAO {

	@Autowired
	SqlSession session;
	
	public ArrayList<Member> selmember(int type){
		ArrayList<Member> result = null;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		result = mapper.selmember(type);
		
		return result;
	}
	
	public int whattype(String silvername) {
		int result = 0;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		result = mapper.whattype(silvername);
		return result;
	}
	public int whattype2(String userid) {
		int result = 0;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		result = mapper.whattype2(userid);
		return result;
	}
	
	public Member selonemem(String userid) {
		Member result = null;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		result = mapper.selonemem(userid);
		return result;
	}
	public Resume selonere(String userid) {
		Resume result = null;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		result = mapper.selonere(userid);
		return result;
	}
	
	public DetailsTwo seldetwo(String silvername) {
		DetailsTwo result = null;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		result = mapper.seldetwo(silvername);
		return result;
		
	}
	public DetailsOne seldeone(String silvername) {
		DetailsOne result = null;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		result = mapper.seldeone(silvername);
		return result;
		
	}
	public int warningmem(String userid) {
		int result = 0;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		result = mapper.warningmem(userid);
		return result;
	}
	public int delmember(String userid) {
		int result = 0;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		result = mapper.delmember(userid);
		return result;
	}
}
