package com.zeronine.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.BoardVO;

@Repository("boardDAO")
public class BoardDAOMybatis_yn {
	
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(BoardDAOMybatis_yn.class);
	final static String NAMESPACE = "net.zeronine.board.";
	
	public List<BoardVO> myWriteBlist(String customerId) {
		List<BoardVO> blist = sqlSession.selectList(NAMESPACE + "myWriteBlist",customerId);
		return blist;
	}

	public List<String> getRemainTime(String customerId) {
		List<String> remainTime = sqlSession.selectList(NAMESPACE + "getRemainTime",customerId);
		return remainTime;
	}

	

}
