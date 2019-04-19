package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsResume;
import com.scit.silver.vo.Job;
import com.scit.silver.vo.SilverSearch;

public interface FacilityMapper {

	public int upDetails1(DetailsOne DetailsOne);
	
	public int upDetails2(DetailsOne DetailsOne);
	
	public int upDetails3(DetailsOne DetailsOne);
	
	public String mname(String userid);
	
	public int insertjob(Job job);
	
	public int updatejob(Job job);
	
	public ArrayList<Job> selectjob(String userid);
	
	public Job selectonejob(int job_seq);

	public int upSilverSearch(SilverSearch sb);
	
	public int deljob(Job job);
	
	public ArrayList<DetailsResume> selallres(RowBounds rb);
	
	public int countResume();
	
}
 