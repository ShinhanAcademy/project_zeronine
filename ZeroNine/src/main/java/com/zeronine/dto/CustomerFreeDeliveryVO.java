package com.zeronine.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class CustomerFreeDeliveryVO {
	private String subscriptionId;
	private String customerId;
	private Timestamp startDateTime;
}
