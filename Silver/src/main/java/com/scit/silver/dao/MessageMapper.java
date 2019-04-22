package com.scit.silver.dao;

import java.util.ArrayList;

import com.scit.silver.vo.message;

public interface MessageMapper {
	
	public int insertmessage1(message ms);
	
	public ArrayList<message> selmessage1(String userid);

	public int insertMessage(message ms);

	public message selectmessageAll(int ms_seq);
	
	public ArrayList<message> selectMesageSender(String loginId);
	
	public ArrayList<message> selectMesageReceiver(String loginId);
}
