package com.scit.silver.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.silver.vo.DetailsOne;
import com.scit.silver.vo.DetailsTwo;
import com.scit.silver.vo.SilverSearch;
import com.test.fileTest.util.PageNavigator;

@Repository
public class SearchDAO {

   @Autowired
   SqlSession session;

   public ArrayList<SilverSearch> selectmap(int type){
      ArrayList<SilverSearch> result = null;
      
      SearchMapper mapper = session.getMapper(SearchMapper.class);
      
      result = mapper.selectmap(type);
 
      return result;
   }
   public ArrayList<SilverSearch> selectmap(PageNavigator pn, int type){
      ArrayList<SilverSearch> result = null;
      
      RowBounds rb=new RowBounds(pn.getStartBoardCurrentPage(),pn.getBoardPerPage());//어디위치부터, 몇개까지
      
      SearchMapper mapper = session.getMapper(SearchMapper.class);
      
      //System.out.println(rb);
      result = mapper.selectmap(rb, type);

      return result;
   }
   
   public ArrayList<SilverSearch> selectmap2(PageNavigator pn, ArrayList<SilverSearch> SilverSearch){
      ArrayList<SilverSearch> result = null;
      
      RowBounds rb=new RowBounds(pn.getStartBoardCurrentPage(),pn.getBoardPerPage());//어디위치부터, 몇개까지
      
      
      SearchMapper mapper = session.getMapper(SearchMapper.class);
      
      result = mapper.selectmap2(rb, SilverSearch);

      return result;
      
      
   }

   
   public int countRecord(int type) {
      int result = 0;
      
      SearchMapper mapper = session.getMapper(SearchMapper.class);
      
      result = mapper.countRecord(type);
      
      return result;
      
   }
   
   public int countRecord2(ArrayList<SilverSearch> SilverSearch) {
         int result = 0;
      
      SearchMapper mapper = session.getMapper(SearchMapper.class);
      
      result = mapper.countRecord2(SilverSearch);
      
      return result;
   }
   
   public DetailsTwo selectmap3(int seach_seq){
		DetailsTwo result = null;
		
		SearchMapper mapper = session.getMapper(SearchMapper.class);
		
		result = mapper.selectmap3(seach_seq);

		return result;	
	}
   
   public DetailsOne selectmap4(int seach_seq){
		DetailsOne result = null; 
		
		SearchMapper mapper = session.getMapper(SearchMapper.class);
		
		result = mapper.selectmap4(seach_seq);

		return result;	
	}
   
   public int TypeSearch(int seach_seq) {
	   int result = 0;
	   
	   SearchMapper mapper = session.getMapper(SearchMapper.class);
		
	   result = mapper.TypeSearch(seach_seq);
	   
	   return result;
   }
   
   
}