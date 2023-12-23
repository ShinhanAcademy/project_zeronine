package com.zeronine.dto;

import lombok.Data;

@Data
public class ChatMessage {
	private MessageType type;
	private String messageContent;
	private String sender;
	private String chatId;
	private String boardId;
}
