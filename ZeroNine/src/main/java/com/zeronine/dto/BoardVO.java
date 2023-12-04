package com.zeronine.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class BoardVO {
	private String boardId;
	private String authorId;
	private String bCategoryType;
	private String title;
	private String content;
	private Timestamp uploadTime;
	private Timestamp updateTime;
	private Integer postingMinutes;
}



