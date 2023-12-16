package com.zeronine.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryVO {
	private String deliveryId;
	private String customerId;
	private Timestamp purchaseDateTime;
	private String address;
	private String deliveryStatus;
	private Timestamp deliveryTime;
	private boolean isRefundable;
}




