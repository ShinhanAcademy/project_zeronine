package com.zeronine.dto;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class CartVO {
	private String customerId;
	private String productId;
	private Integer productCount;
}
