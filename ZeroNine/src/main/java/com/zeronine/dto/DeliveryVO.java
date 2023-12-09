package com.zeronine.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class DeliveryVO {
	private String deliveryId;
	private String customerId;
	private Timestamp purchaseDateTime;
	private String address;
	private String deliveryStatus;
	private Timestamp deliveryTime;
	private boolean isRefundable;
	private String productId;
	private Integer pickCount;
}




