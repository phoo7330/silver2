package com.scit.silver.dao;

import com.scit.silver.vo.Resume;

public interface ResumeMapper {
	
	public int insertResume(Resume resume);
	
	public Resume selectResume(String loginId);
	
	public int updateResume(Resume resume);
}
