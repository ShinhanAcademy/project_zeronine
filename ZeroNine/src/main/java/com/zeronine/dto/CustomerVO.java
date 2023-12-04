package com.zeronine.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class CustomerVO {
	private String customerId;
	private String customerPassword;
	private String email;
	private String phoneNumber;
	private String customerName;
	private String address;
	private Integer point;
	private Timestamp birthday;

}
