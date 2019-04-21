package com.scit.silver.dao;

import java.util.ArrayList;

import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.Job;
import com.scit.silver.vo.Member;
import com.scit.silver.vo.Resume;
import com.scit.silver.vo.SilverBoard;
import com.scit.silver.vo.SilverBoardComent;

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
	
	public int countmember(int type);
	
	public int counts(String gender);
	
	public Job selonejob(int jo_seq);
	
	public int deljob2(int jo_seq);
	
	public ArrayList<SilverBoard> selectallboard();
	
	public int delboard2(int sb_seq);
	
	public ArrayList<SilverBoardComent> selectallComent();
	
	public int delcoment2(int sbc_seq);
	
	public int counttype(String jo_type);
	
	public int countjob(String jo_job);

	public int countgen(String gender);
}
 