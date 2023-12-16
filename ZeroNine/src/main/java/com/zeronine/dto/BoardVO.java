package com.zeronine.dto;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


public class BoardVO {
	private String boardId;
	private String authorId;
	private String bCategoryType;
	private String title;
	private String content;
	private Timestamp uploadTime;
	private Timestamp updateTime;
	private Integer postingMinutes;
	private Timestamp finishTime;
	
	public Timestamp getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Timestamp finishTime) {
		this.finishTime = finishTime;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getbCategoryType() {
		return bCategoryType;
	}
	public void setbCategoryType(String bCategoryType) {
		this.bCategoryType = bCategoryType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getPostingMinutes() {
		return postingMinutes;
	}
	public void setPostingMinutes(Integer postingMinutes) {
		this.postingMinutes = postingMinutes;
	}
	
	
}



