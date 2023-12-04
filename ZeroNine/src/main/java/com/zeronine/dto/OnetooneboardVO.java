package com.zeronine.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class OnetooneboardVO {
	private String oBoardId;
	private String oAuthorId;
	private String oTitle;
	private String oContent;
	private Timestamp oUploadTime;
	private Timestamp oUpdateTime;
	private Integer oPostingMinutes;
}
