package com.zeronine.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.LikedProductVO;

@Repository("LikedBoardDAO")
public class LikedBoardDAOMybatis {
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(LikedBoardDAOMybatis.class);
	String namespace = "net.zeronine.board.";

	
	
	public List<String> selectByBidlist(String custId) {
		List<String> clist = sqlSession.selectList(namespace + "selectByBidlist", custId);

		return clist;
	}

}
