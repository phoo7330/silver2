package com.scit.silver.dao;


import com.scit.silver.vo.Member;

public interface MemberMapper {
	
	
	public int insertMember(Member member);
	
	public Member selectMember(Member member);
}
