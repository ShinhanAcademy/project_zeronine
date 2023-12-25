package com.zeronine.chat;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeronine.dto.ChatDtlVO;
import com.zeronine.dto.ChatMessage;
import com.zeronine.dto.ChatVO;
import com.zeronine.dto.CustomerVO;
import com.zeronine.dto.MessageVO;
import com.zeronine.model.ChatService;
import com.zeronine.model.CustomerService;

@Controller
public class ChatController {
	
	private static Logger log = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatService chatService;
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/chat.do")
	public String main(HttpServletRequest request, Model model) {
		HttpSession session  = request.getSession();
		String customerId = (String) session.getAttribute("customerId");
		log.info("customerId >>>> {}", customerId);
		
		List<ChatVO> chatList = chatService.selectChatList(customerId);
		log.info("chatList >>>> {}", chatList);
		
		model.addAttribute("chatList", chatList);
		return "chat/chat";
	}
	
	@ResponseBody
	@RequestMapping(value="/chatDtl.do", method=RequestMethod.POST)
	public Map<String, Object> chatDtl(HttpServletRequest request, @RequestParam String chatId) {
		log.info("chatId >>>> {}", chatId);
		
		List<ChatDtlVO> chatDtlList = chatService.selectChatDtlList(chatId);
		log.info("chatDtlList >>>> {}", chatDtlList);
		
		ChatDtlVO chatDtlVO = chatService.selectChatDtlInfo(chatId);
		log.info("chatDtlVO >>>> {}", chatDtlVO);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		HttpSession session  = request.getSession();
		String customerId = (String) session.getAttribute("customerId");
		
		String senderId = chatDtlVO.getSenderId();
		CustomerVO customerVO = customerService.selectById(senderId);
		String customerName = customerVO.getCustomerName();
		
		result.put("chatDtlList", chatDtlList);
		result.put("chatDtlVO", chatDtlVO);
		result.put("customerId", customerId);
		result.put("customerName", customerName);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteChatInfo.do", method=RequestMethod.POST)
	public int deleteChatInfo(HttpServletRequest request, @RequestParam String chatId) {
		log.info("chatId >>>> {}", chatId);
		return chatService.deleteChatInfo(chatId);
	}
	
	@MessageMapping("chat.sendMessage")
	@SendTo("/topic/publicChatRoom")
	public MessageVO sendMessage(@Payload ChatMessage chatMessage) {
		log.info("chatMessage >>>> {}", chatMessage);
		
		/**
		 * chat table insert
		
		ChatVO chatVO = new ChatVO();
		String boardId = chatMessage.getBoardId();
		
		BeanUtils.copyProperties(chatMessage, chatVO);
		chatVO.setCustomerId(customerId);
		chatVO.setBoardId(boardId);
		
		log.info("chatVO >>>> {}", chatVO);
		chatService.insertChatInfo(chatVO);
		 */
		
		/**
		 * message table insert
		 */
		MessageVO messageVO = new MessageVO();
		BeanUtils.copyProperties(chatMessage, messageVO);
		String uuid = UUID.randomUUID().toString();
		String customerId = chatMessage.getSender();
		messageVO.setMessageId(uuid);
		messageVO.setSenderId(customerId);
		
		// 현재 시간을 가져옴
        Date currentDate = new Date();
        // Date를 Timestamp로 변환
        Timestamp timestamp = new Timestamp(currentDate.getTime());
		
        messageVO.setSendTime(timestamp);
		
		log.info("messageVO >>>> {}", messageVO);
		chatService.insertMessageInfo(messageVO);
		
		return messageVO;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertChatInfo.do", method=RequestMethod.POST)
	public ChatVO insertChatInfo(HttpServletRequest request, @RequestParam String oBoardId) {
		log.info("oBoardId >>>> {}", oBoardId);
		
		HttpSession session = request.getSession();
		
		ChatVO chatVO = new ChatVO();
		String customerId = (String) session.getAttribute("customerId");
		String chatId = UUID.randomUUID().toString();
		
		chatVO.setChatId(chatId);
		chatVO.setBoardId(oBoardId);
		chatVO.setCustomerId(customerId);
		
		log.info("chatVO >>>> {}", chatVO);
		chatService.insertChatInfo(chatVO);
		
		return chatVO;
	}
	
	@MessageMapping("/chat.addUser")
	@SendTo("/topic/publicChatRoom")
	public ChatMessage addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
		headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
		return chatMessage;
	}
}
