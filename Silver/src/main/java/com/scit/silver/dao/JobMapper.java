package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.scit.silver.vo.Job;

public interface JobMapper {
	public ArrayList<Job> selectAllJob();
	
	public ArrayList<Job> selectAllJob(RowBounds rb);
	
	public ArrayList<Job> selectmap2(RowBounds rb, ArrayList<Job> Job);
	
	public int countRecord();
	
	public int countRecord2(ArrayList<Job> Job);
	
	public ArrayList<Job> seachjob1(String seach);
	
	public ArrayList<Job> seachjob2(Job Job);
	
}
 