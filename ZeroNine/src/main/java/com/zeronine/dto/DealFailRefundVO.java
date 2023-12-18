package com.zeronine.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class DealFailRefundVO {
	private String dealFailRefundId;
	private String boardId;
	private String customerId;
	private String productId;
	private int pickCount;
	private int productCount;
	
}



