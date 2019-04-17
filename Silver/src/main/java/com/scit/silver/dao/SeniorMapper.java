package com.scit.silver.dao;

import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;

public interface SeniorMapper {
	
	public int insertSenior(SeniorCitizen sc);
	
	public int insertSeniorDetails(SeniorCitizenDetails scd);
	
	public Integer SelectSeq(String loginId);
	
	public SeniorCitizen SelectSenior(String loginId);
	
	public SeniorCitizenDetails SelectSeniorDetails(int seq);
	
	public int updateSenior(SeniorCitizen updateSc);
	
	public int updateSeniorDetail(SeniorCitizenDetails updateScd);
	
}
