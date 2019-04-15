package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.Member;
import com.scit.silver.vo.SilverSearch;


@Repository
public class MemberDAO {
	
	
	@Autowired
	SqlSession session;
	
	public int insertMember(Member member) {
		int result = 0;
		
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try{
		result = mapper.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int insertSilver(Member member) {
		int result = 0;
		
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try{
		result = mapper.insertSilver(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public String seachname(String username) {
		String result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		result = mapper.seachname(username);
		return result;
	}
	
	public Member selectMember(Member member) {
		Member result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = mapper.selectMember(member);
		} catch (Exception e) {
				e.printStackTrace();
				return null;
		}
		return result;
	}
	
	public Member selectMember2(String userid) {
		Member result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = mapper.selectMember2(userid);
		} catch (Exception e) {
				e.printStackTrace();
				return null;
		}
		return result;
	}
	
	public int updateMember(Member member) {
		int result = 0;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = mapper.updateMember(member);
		} catch (Exception e) {
				e.printStackTrace();
				return result;
		}
		return result;
	}
	
	public ArrayList<SilverSearch> whatsilver(String Silvername){
		ArrayList<SilverSearch> result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		result = mapper.whatsilver(Silvername);

		
		return result;
	}

	
	
}
