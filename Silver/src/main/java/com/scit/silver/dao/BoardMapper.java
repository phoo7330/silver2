package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.scit.silver.vo.SilverBoard;
import com.scit.silver.vo.SilverBoardComent;

public interface BoardMapper {

public int insertsb(SilverBoard sb);
	
	public SilverBoard selectsbone(int sb_seq);
	
	public ArrayList<SilverBoard> selectall(RowBounds rb, int seach_seq);
	
	public int countRecord(int seach_seq);
	
	public int insertComment(SilverBoardComent sbc);
	
	public ArrayList<SilverBoardComent> selectComent(RowBounds rb, int sb_seq);
	
	public int countRecord2(int sb_seq);
	
	public int delsb(int sb_seq);
	
	public int updatesb(SilverBoard sb);
	
	public int delcom(int sbc_seq);
	
	public int updatecom(SilverBoardComent sbc);
	
	public SilverBoardComent selectonec(int sbc_seq);
}
 