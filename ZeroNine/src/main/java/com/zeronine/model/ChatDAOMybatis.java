package com.zeronine.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.ChatDtlVO;
import com.zeronine.dto.ChatVO;
import com.zeronine.dto.MessageVO;

@Repository("chatDAO")
public class ChatDAOMybatis {

	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(ChatDAOMybatis.class);
	final static String NAMESPACE = "net.zeronine.chat.";
	
	public List<ChatVO> selectChatList(String customerId) {
		return sqlSession.selectList(NAMESPACE + "selectChatList", customerId);
	}

	public List<ChatDtlVO> selectChatDtlList(String chatId) {
		return sqlSession.selectList(NAMESPACE + "selectChatDtlList", chatId);
	}

	public void insertChatInfo(ChatVO chatVO) {
		sqlSession.insert(NAMESPACE + "insertChatInfo", chatVO);
	}

	public void insertMessageInfo(MessageVO messageVO) {
		sqlSession.insert(NAMESPACE + "insertMessageInfo", messageVO);
	}

	public ChatDtlVO selectChatDtlInfo(String chatId) {
		return sqlSession.selectOne(NAMESPACE + "selectChatDtlInfo", chatId);
	}

	public int deleteChatInfo(String chatId) {
		return sqlSession.delete(NAMESPACE + "deleteChatInfo", chatId);
	}
}