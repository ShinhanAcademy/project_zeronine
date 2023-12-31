package com.zeronine.dto;

import lombok.Data;

@Data
public class ChatVO {
	private String chatId;
	private String chatCustId;
	private String authorCusId;
	private String chatCustName;
	private String authorCustName;
	private String boardId;
	private String boardTitle;
	private String address;
	private String addrDetail;
	private String finishTime;
	private String remainingDays;
	private String sendTime;
	private String productImagePath;
	private String messageContent;
	private String createTime;
}

