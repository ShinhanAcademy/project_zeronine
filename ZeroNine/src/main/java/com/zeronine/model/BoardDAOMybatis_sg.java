package com.zeronine.model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDAO_sg")
public class BoardDAOMybatis_sg {
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(BoardDAOMybatis_sg.class);
	final static String NAMESPACE = "net.zeronine.board.";
	
	public int writeOBoard(String boardId, String authorId, String title, String content,
			String postingMinutes, String imgURL, String address, String addressDetail) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardId", boardId);
		map.put("authorId", authorId);
		map.put("title", title);
		map.put("content", content);
		map.put("postingMinutes", postingMinutes);
		map.put("imgURL", imgURL);
		map.put("address", address);
		map.put("addressDetail", addressDetail);
		map.put("is_write_success", 0); //false
		logger.info(map.toString());
		return sqlSession.insert(NAMESPACE + "insertOBoard", map);
	}

	public int writeFastBoard(String authorId, String title, String content, String postingMinutes, String productId,
			int pickCount) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authorId", authorId);
		map.put("title", title);
		map.put("content", content);
		map.put("postingMinutes", postingMinutes);
		map.put("productId", productId);
		map.put("pickCount", pickCount);
		map.put("is_write_success", 0);
		return sqlSession.insert(NAMESPACE + "insertFastBoard", map);
	}

	public int writeFreeBoard(String authorId, String title, String content, String postingMinutes,
			Map<String, Integer> productList) {
		Map<Object, Object> map = new HashMap<>();
		map.put("authorId", authorId);
		map.put("title", title);
		map.put("content", content);
		map.put("postingMinutes", postingMinutes);
		map.put("products", productList);
		map.put("is_write_success", 0);
		logger.info(map.toString());
		int ret = sqlSession.insert(NAMESPACE + "insertFreeBoard", map);
		logger.info("ret==>", ret);
		return ret;
	}
	
}

	

