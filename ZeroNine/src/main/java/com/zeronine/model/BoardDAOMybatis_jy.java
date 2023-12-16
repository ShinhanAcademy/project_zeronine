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
	
	public List<Map<String, Object>> selectFastBoardList(){
		List<Map<String, Object>> infoFb =  sqlSession.selectList(namespace+"selectFastBoardList");
		System.out.println(infoFb);
		return infoFb;
	}
	
	public Map<String, Object> selectFastDetail(String boardId){
		Map<String, Object> detail = sqlSession.selectOne(namespace+"selectFastDetail", boardId);
		System.out.println(detail);
		return detail;
	}
	
	//oneBoard
	public List<Map<String, Object>> selecOneBoardList() {
		List<Map<String, Object>> infoOne = sqlSession.selectList(namespace+"selectOneBoardList");
		return infoOne;
	}
	
	
	public Map<String, Object> selectOneDetail(String boardId){
		Map<String, Object> detail = sqlSession.selectOne(namespace+"selectOneDetail", boardId);
		System.out.println(detail);
		return detail;
	}
		
		
}
