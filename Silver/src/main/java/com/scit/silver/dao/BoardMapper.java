package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.scit.silver.vo.SilverBoard;

public interface BoardMapper {

	public int insertsb(SilverBoard sb);
	
	public SilverBoard selectsbone(int sb_seq);
	
	public ArrayList<SilverBoard> selectall(RowBounds rb, int seach_seq);
	
	public int countRecord(int seach_seq);
}
 