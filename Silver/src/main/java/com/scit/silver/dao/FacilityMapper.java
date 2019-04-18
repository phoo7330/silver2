package com.scit.silver.dao;

import java.util.ArrayList;

import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.Job;

public interface FacilityMapper {

	public int upDetails1(DetailsOne DetailsOne);
	
	public int upDetails2(DetailsOne DetailsOne);
	
	public int upDetails3(DetailsOne DetailsOne);
	
	public String mname(String userid);
	
	public int insertjob(Job job);
	
	public ArrayList<Job> selectjob(String userid);
	
	public Job selectonejob(int job_seq);

}
 