package com.zeronine.dto;


public class ChatVO {
	private String chatId;
	private String oAuthorId;
	private String customerId;
	private String oBoardId;
	
	public String getChatId() {
		return chatId;
	}
	public void setChatId(String chatId) {
		this.chatId = chatId;
	}
	public String getoAuthorId() {
		return oAuthorId;
	}
	public void setoAuthorId(String oAuthorId) {
		this.oAuthorId = oAuthorId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getoBoardId() {
		return oBoardId;
	}
	public void setoBoardId(String oBoardId) {
		this.oBoardId = oBoardId;
	}
}
