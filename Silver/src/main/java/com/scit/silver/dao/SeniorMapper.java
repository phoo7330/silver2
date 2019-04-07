package com.scit.silver.dao;

import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;

public interface SeniorMapper {
	
	public int insertSenior(SeniorCitizen sc);
	
	public int insertSeniorDetails(SeniorCitizenDetails scd);
	
	public int SelectSeq(String loginId);
}
