package com.zeronine.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class MessageVO {
	private String messageId;
	private String chatId;
	private String senderId;
	private Timestamp sendTime;
	private String messageContent;
}
