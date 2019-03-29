package com.scit.silver.dao;

import java.util.ArrayList;

import com.scit.silver.vo.SilverBoard;

public interface BoardMapper {

	public int insertsb(SilverBoard sb);
	
	public SilverBoard selectsbone(int sb_seq);
	
	public ArrayList<SilverBoard> selectall(int seach_seq);
}
 