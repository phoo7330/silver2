package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.message;

@Repository
public class MessageDAO {

	@Autowired
	SqlSession session;
	
	
	public int insertmessage1(message ms) {
		int result = 0;
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		try {
			result = mapper.insertmessage1(ms);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public ArrayList<message> selmessage1(String userid){
		ArrayList<message> result = null;
		MessageMapper mapper = session.getMapper(MessageMapper.class);	
		result = mapper.selmessage1(userid);	
		return result;
	}
	
	public message selectonem(int ms_seq) {
		message result = null;
		MessageMapper mapper = session.getMapper(MessageMapper.class);	
		result = mapper.selectonem(ms_seq);
		return result;
	}
	
	public int delmessage1(int ms_seq) {
		int result = 0;
		MessageMapper mapper = session.getMapper(MessageMapper.class);	
		result = mapper.delmessage1(ms_seq);
		return result;
	}
	public ArrayList<message> selmessage2(String userid){
		ArrayList<message> result = null;
		MessageMapper mapper = session.getMapper(MessageMapper.class);	
		result = mapper.selmessage2(userid);	
		return result;
	}
	
	
	
	
	
	
	public int insertMessage(message ms) {
		int result = 0;
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		result = mapper.insertMessage(ms);
		return result;
	}
	
	public message selectmessageAll(int ms_seq) {
		
		message result = null;
		
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		
		result = mapper.selectmessageAll(ms_seq);
		
		return result;
		
	}
	
	public ArrayList<message> selectMesageSender(String loginId) {
		ArrayList<message> result = null;
		
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		
		result = mapper.selectMesageSender(loginId);
		
		return result;
	}
	
	public ArrayList<message> selectMesageReceiver(String loginId) {
		ArrayList<message> result = null;
		
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		
		result = mapper.selectMesageReceiver(loginId);
		
		return result;
	}
}
