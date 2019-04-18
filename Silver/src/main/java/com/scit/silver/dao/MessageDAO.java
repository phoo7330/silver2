package com.scit.silver.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.message;

@Repository
public class MessageDAO {

	@Autowired
	SqlSession session;
	
	public int insertMessage(message ms) {
		int result = 0;
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		result = mapper.insertMessage(ms);
		return result;
	}
	
	public message selectMessage(int ms_seq) {
		
		message result = null;
		
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		
		result = mapper.selectmessage(ms_seq);
		
		return result;
		
	}  
}
