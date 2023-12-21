package com.zeronine.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class CustomerPickCouponVO {
	private String subscriptonId;
	private String customerId;
	private Timestamp startDateTime;
	private Integer remaininCoupons;
	private Boolean issubscription;
}
