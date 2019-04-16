package com.scit.silver.dao;


import java.util.ArrayList;

import com.scit.silver.vo.Member;
import com.scit.silver.vo.SilverSearch;

public interface MemberMapper {
	
	
	
	public int insertMember(Member member);
	
	public int insertSilver(Member member);
	
	public String seachname(String username);
	
	public String seachid(String userid);
	
	public Member selectMember(Member member);

	public Member selectMember2(String userid);
	
	public int updateMember(Member member);
	
	public ArrayList<SilverSearch> whatsilver(String Silvername);
	
	
}
