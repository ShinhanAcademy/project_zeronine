package com.zeronine.dto;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class PickupVO {
	private String pickUpId;
	private String customerId;
	private String pickUpStatus;
	private String pickUpRequestTime;
	private String pickUpImagePath;
	private String message;
	private String isFoodWaste;
}
