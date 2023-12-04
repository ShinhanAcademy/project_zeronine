package com.zeronine.dto;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class ProductVO {
	private String productId;
	private Integer pCategoryId;
	private String pName;
	private String brand;
	private Integer price;
	private Integer pCount;
	private Integer pStock;
}
