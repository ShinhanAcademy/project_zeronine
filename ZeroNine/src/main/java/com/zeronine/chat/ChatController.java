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
import com.zeronine.dto.ChatMessageVO;
import com.zeronine.dto.ChatVO;
import com.zeronine.dto.MessageVO;
import com.zeronine.model.ChatService;

@Controller
public class ChatController {
	
	private static Logger log = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chat.do")
	public String main(HttpServletRequest request, Model model, @RequestParam(required = false) String chatId) {
		log.info("/chat.do chatId >>>> {}", chatId);
		
		HttpSession session  = request.getSession();
		String customerId = (String) session.getAttribute("customerId");
		log.info("customerId >>>> {}", customerId);
		
		List<ChatVO> chatList = chatService.selectChatList(customerId);
		log.info("chatList >>>> {}", chatList);
		
		model.addAttribute("chatList", chatList);
		model.addAttribute("chatId", chatId);
		return "chat/chat";
	}
	
	@ResponseBody
	@RequestMapping(value="/chatDtl.do", method=RequestMethod.POST)
	public Map<String, Object> chatDtl(HttpServletRequest request, @RequestParam String chatId) {
		
		HttpSession session  = request.getSession();
		String customerId = (String) session.getAttribute("customerId");

		Map<String,Object> mapData = new HashMap<>();
		mapData.put("chatId",chatId);
		mapData.put("customerId", customerId);
		
		log.info("chatId >>>> {}", chatId);
		
		List<ChatDtlVO> chatDtlList = chatService.selectChatDtlList(chatId);
		log.info("chatDtlList >>>> {}", chatDtlList);
		
		ChatDtlVO chatDtlVO = chatService.selectChatDtlInfo(mapData);
		log.info("chatDtlVO >>>> {}", chatDtlVO);
		
		chatDtlVO.setMyCustomerId(customerId);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("chatDtlList", chatDtlList);
		result.put("chatDtlVO", chatDtlVO);
		/* result.put("customerName", customerName); */
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
	public MessageVO sendMessage(@Payload ChatMessageVO chatMessage) {
		log.info("chatMessage >>>> {}", chatMessage);
		
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
		String customerId = (String) session.getAttribute("customerId");
		String oAuthorId = chatService.findOAuthorId(oBoardId);
		if(customerId.equals(oAuthorId)) { // 내가 만든 게시글에 내가 참여하는 경우는 못하게 처리
			ChatVO chatVO = new ChatVO();
			return chatVO;
		}
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("customerId", customerId);
		params.put("oBoardId", oBoardId);
		
		String chatId = chatService.findChatId(params);
		if(chatId != null && !chatId.equals("")) {
			ChatVO chatVO = new ChatVO();
			chatVO.setChatId(chatId);
			return chatVO;
		}
		
		ChatVO chatVO = new ChatVO();
		chatId = UUID.randomUUID().toString();
		
		chatVO.setChatId(chatId);
		chatVO.setBoardId(oBoardId);
		chatVO.setChatCustId(customerId);
		
		log.info("chatVO >>>> {}", chatVO);
		chatService.insertChatInfo(chatVO);
		
		return chatVO;
	}
	
	@MessageMapping("/chat.addUser")
	@SendTo("/topic/publicChatRoom")
	public ChatMessageVO addUser(@Payload ChatMessageVO chatMessage, SimpMessageHeaderAccessor headerAccessor) {
		headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
		return chatMessage;
	}
}
