package com.zeronine.dto;


public class ProductVO {
	private String productId;
	private Integer pCategoryId;
	private String pName;
	private String brand;
	private Integer price;
	private Integer pCount;
	private Integer pStock;
	private Integer totalPickCount;
	private String imagePath;

	public Integer getTotalPickCount() {
		return totalPickCount;
	}
	public void setTotalPickCount(Integer totalPickCount) {
		this.totalPickCount = totalPickCount;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public Integer getpCategoryId() {
		return pCategoryId;
	}
	public void setpCategoryId(Integer pCategoryId) {
		this.pCategoryId = pCategoryId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getpCount() {
		return pCount;
	}
	public void setpCount(Integer pCount) {
		this.pCount = pCount;
	}
	public Integer getpStock() {
		return pStock;
	}
	public void setpStock(Integer pStock) {
		this.pStock = pStock;
	}
	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", pCategoryId=" + pCategoryId + ", pName=" + pName + ", brand="
				+ brand + ", price=" + price + ", pCount=" + pCount + ", pStock=" + pStock + "]";
	}
	
	
	
}
