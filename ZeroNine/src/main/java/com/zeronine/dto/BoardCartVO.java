package com.zeronine.dto;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class BoardCartVO {
	private String customerId;
	private String boardId;
	private String productId;
	private Integer pickCount;
}
