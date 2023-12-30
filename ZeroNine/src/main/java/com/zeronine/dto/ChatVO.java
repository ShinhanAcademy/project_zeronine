package com.zeronine.dto;

import lombok.Data;

@Data
public class ChatVO {
	private String boardId;
	private String chatId;
	private String boardTitle;
	private String customerName;
	private String address;
	private String finishTime;
	private String day;
	private String sendTime;
	private String path;
	private String messageContent;
	private String customerId;
}
