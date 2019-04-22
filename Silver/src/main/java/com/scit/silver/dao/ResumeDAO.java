package com.scit.silver.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.Resume;

@Repository
public class ResumeDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertResume(Resume resume) {
		int result = 0;
		
		ResumeMapper  mapper = session.getMapper(ResumeMapper.class);
		try{
		result = mapper.insertResume(resume);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public Resume selectResume(String loginId) {
		Resume result = null;
		
		ResumeMapper  mapper = session.getMapper(ResumeMapper.class);
		try{
		result = mapper.selectResume(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int updateResume(Resume resume){
		int result = 0;
		
		ResumeMapper  mapper = session.getMapper(ResumeMapper.class);
		try{
		result = mapper.updateResume(resume);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public Resume selonere(String loginId) {
		Resume result = null;
		
		ResumeMapper  mapper = session.getMapper(ResumeMapper.class);
		try{
		result = mapper.selonere(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
}
