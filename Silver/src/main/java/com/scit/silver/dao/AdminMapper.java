package com.scit.silver.dao;

import java.util.ArrayList;

import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.Member;
import com.scit.silver.vo.Resume;

public interface AdminMapper {

	public ArrayList<Member> selmember(int type);
	
	public int whattype(String silvername);
	
	public int whattype2(String userid);
	
	public Member selonemem(String userid);
	
	public Resume selonere(String userid);
	
	public DetailsTwo seldetwo(String silvername);
	
	public DetailsOne seldeone(String silvername);
	
	public int warningmem(String userid);
	
	public int delmember(String userid);
	
}
 