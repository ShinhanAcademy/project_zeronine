package com.zeronine.dto;

import lombok.Data;

@Data
public class ChatDtlVO {
	private String chatId;
	private String senderId;
	private String messageContent;
	private String sendTime;
	private String customerName;
	private String address;
	private String title;
	private String productImagePath;
	private String chatCustId;
	private String authorCustId;
	private String chatCustName;
	private String authorCustName;
	private String lastTalkerId;
	private String myCustomerId;
}