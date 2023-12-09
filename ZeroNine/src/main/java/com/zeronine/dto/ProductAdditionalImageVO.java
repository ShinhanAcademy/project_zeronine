package com.zeronine.dto;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class ProductAdditionalImageVO {
	private String productId;
	private Integer imageOrder;
	private String imagePath;
}
