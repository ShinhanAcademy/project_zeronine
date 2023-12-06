package com.zeronine.dto;

import java.sql.Timestamp;

public class OnetooneboardVO {
	private String oBoardId;
	private String oAuthorId;
	private String oTitle;
	private String oContent;
	private Timestamp oUploadTime;
	private Timestamp oUpdateTime;
	private Integer oPostingMinutes;
	
	public String getoBoardId() {
		return oBoardId;
	}
	public void setoBoardId(String oBoardId) {
		this.oBoardId = oBoardId;
	}
	public String getoAuthorId() {
		return oAuthorId;
	}
	public void setoAuthorId(String oAuthorId) {
		this.oAuthorId = oAuthorId;
	}
	public String getoTitle() {
		return oTitle;
	}
	public void setoTitle(String oTitle) {
		this.oTitle = oTitle;
	}
	public String getoContent() {
		return oContent;
	}
	public void setoContent(String oContent) {
		this.oContent = oContent;
	}
	public Timestamp getoUploadTime() {
		return oUploadTime;
	}
	public void setoUploadTime(Timestamp oUploadTime) {
		this.oUploadTime = oUploadTime;
	}
	public Timestamp getoUpdateTime() {
		return oUpdateTime;
	}
	public void setoUpdateTime(Timestamp oUpdateTime) {
		this.oUpdateTime = oUpdateTime;
	}
	public Integer getoPostingMinutes() {
		return oPostingMinutes;
	}
	public void setoPostingMinutes(Integer oPostingMinutes) {
		this.oPostingMinutes = oPostingMinutes;
	}
}
