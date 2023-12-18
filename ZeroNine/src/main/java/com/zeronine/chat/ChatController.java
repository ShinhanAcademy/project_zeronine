package com.zeronine.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	@RequestMapping("/chat.do")
	public String main() {
		return "chat/chat";
	}
}
