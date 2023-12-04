package com.zeronine.dto;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class SelectProductVO {
	private String customerId;
	private String boardId;
	private String productId;
	private Integer pickCount;
}
