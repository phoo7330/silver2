package com.scit.silver.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.SilverBoard;


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
	
	public ArrayList<SilverBoard> selectall(int seach_seq){
		ArrayList<SilverBoard> result = null;
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		result = mapper.selectall(seach_seq);
		
		return result;
	}
}
