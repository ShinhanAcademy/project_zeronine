package com.zeronine.dto;

import lombok.Data;

@Data
public class BoardCartVO {
	private String customerId;
	private String boardId;
	private String productId;
	private Integer pickCount;
}
