package com.scit.silver.dao;

import com.scit.silver.vo.SeniorCitizen;
import com.scit.silver.vo.SeniorCitizenDetails;

public interface SeniorMapper {
	
	public int insertSenior(SeniorCitizen seniorcitizen);
	
	public int insertSeniorDetails(SeniorCitizenDetails seniorcitizendetails);
}
