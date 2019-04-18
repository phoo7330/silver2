package com.scit.silver.dao;

import com.scit.silver.vo.message;

public interface MessageMapper {

	public int insertMessage(message ms);

	public message selectmessage(int ms_seq);
	
	
}
