package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.ChatDtlVO;
import com.zeronine.dto.ChatVO;
import com.zeronine.dto.MessageVO;


@Service("chatService")
public class ChatService {

	@Autowired
	ChatDAOMybatis chatDAO;

	public List<ChatVO> selectChatList(String customerId) {
		return chatDAO.selectChatList(customerId);
	}

	public List<ChatDtlVO> selectChatDtlList(String chatId) {
		return chatDAO.selectChatDtlList(chatId);
	}

	public void insertChatInfo(ChatVO chatVO) {
		chatDAO.insertChatInfo(chatVO);
	}

	public void insertMessageInfo(MessageVO messageVO) {
		chatDAO.insertMessageInfo(messageVO);
	}

	public ChatDtlVO selectChatDtlInfo(String chatId) {
		return chatDAO.selectChatDtlInfo(chatId);
	}

	public int deleteChatInfo(String chatId) {
		return chatDAO.deleteChatInfo(chatId);
	}

	public String findChatId(String oBoardId) {
		return chatDAO.findChatId(oBoardId);
	}
}