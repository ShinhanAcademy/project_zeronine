package com.zeronine.model;

import java.util.List;
import java.util.Map;

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
	
	public List<Map<String,Object>> myWriteBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "myWriteBlist",customerId);
		return info;
	}

	public Map<String, Object> boardDetail(String boardId) {
		Map<String,Object> info = sqlSession.selectOne(NAMESPACE + "boardDetail",boardId);
		return info;
	}

	public int boardpCount(String boardId) {
		int count = sqlSession.selectOne(NAMESPACE + "boardpCount", boardId);
		return count;
	}

	public int numOfParticipant(String boardId) {
		int participant = sqlSession.selectOne(NAMESPACE + "numOfParticipant", boardId);
		return participant;
	}

	public List<Map<String, Object>> myWriteFreeBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "myWriteFreeBlist",customerId);
		return info;
	}

	public Map<String, Object> freeBoardDetail(String boardId) {
		Map<String,Object> info = sqlSession.selectOne(NAMESPACE + "freeBoardDetail",boardId);
		return info;
	}

	public int numOfFreeParticipant(String boardId) {
		int participant = sqlSession.selectOne(NAMESPACE + "numOfFreeParticipant", boardId);
		return participant;
	}

	public List<Map<String, Object>> myParticipatedBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "myParticipatedBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> myParticipatedFreeBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "myParticipatedFreeBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> likeBoardBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "likeBoardBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> likeBoardFreeBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "likeBoardFreeBlist",customerId);
		return info;
	}
	

}
