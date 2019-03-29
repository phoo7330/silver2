package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.SilverBoard;
import com.test.fileTest.util.PageNavigator2;


@Repository
public class BoardDAO {

	@Autowired
	SqlSession session;
	
	public int insertsb(SilverBoard sb) {
		int result = 0;
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		try {
			result = mapper.insertsb(sb);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		
		
		return result;
	}
	
	public SilverBoard selectsbone(int sb_seq) {
		SilverBoard result = null;
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		result = mapper.selectsbone(sb_seq);
		
		return result;
	}
	
	public ArrayList<SilverBoard> selectall(PageNavigator2 pn, int seach_seq){
		ArrayList<SilverBoard> result = null;
		
		RowBounds rb=new RowBounds(pn.getStartBoardCurrentPage(),pn.getBoardPerPage());//어디위치부터, 몇개까지
	      
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		System.out.println(rb);
		result = mapper.selectall(rb, seach_seq);
		
		return result;
	}
	
	public int countRecord(int seach_seq) {
		int result = 0;
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		result = mapper.countRecord(seach_seq);
		
		return result;
		
	}

}
