package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDAO_jy")
public class BoardDAOMybatis_jy {

	@Autowired
	SqlSession sqlSession;
	Logger logger= LoggerFactory.getLogger(BoardDAOMybatis_jy.class);
	final static String namespace = "net.zeronine.board.";
	
	public List<Map<String, Object>> selectfastBoardList(){
		List<Map<String, Object>> info =  sqlSession.selectList(namespace+"selectfastBoardList");
		System.out.println(info);
		return info;
	}
	
	public Map<String, Object> selectDetailView(String boardId){
		Map<String, Object> detail = sqlSession.selectOne(namespace+"selectDetailView", boardId);
		System.out.println(detail);
		return detail;
	}
	
	
}
