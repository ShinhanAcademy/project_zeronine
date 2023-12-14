package com.zeronine.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryProductVO {
	private String deliveryId;
	private String productId;
	private Integer pickCount;
	private String deliveryProductId;
	private Integer productCount;
}




