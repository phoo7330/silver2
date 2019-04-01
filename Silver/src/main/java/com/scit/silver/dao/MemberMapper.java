package com.scit.silver.dao;


import com.scit.silver.vo.Member;

public interface MemberMapper {
	
	
	public int insertMember(Member member);
	
	public Member selectMember(Member member);

	public Member selectMember2(String userid);
	
	public int updateMember(Member member);
	
	public int updateMember2(Member member);
	
	public int updateMember3(Member member);
}
