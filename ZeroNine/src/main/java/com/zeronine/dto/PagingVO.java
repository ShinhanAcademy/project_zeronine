package com.zeronine.dto;


public class PagingVO {
	private int pageNumber; // 현재 페이지 
	private int maxPageNumber;// 페이지 끝번호 데이터를 얼마나 넣냐에따라 정해짐..
	private int startPageNumber; // 페이지의 시작번호 1,6,11,16
	private int endPageNumber;  // 페이지 끝번호 5,10,15,20
	
	
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getMaxPageNumber() {
		return maxPageNumber;
	}
	public void setMaxPageNumber(int maxPageNumber) {
		this.maxPageNumber = maxPageNumber;
	}
	public int getStartPageNumber() {
		return startPageNumber;
	}
	public void setStartPageNumber(int startPageNumber) {
		this.startPageNumber = startPageNumber;
	}
	public int getEndPageNumber() {
		return endPageNumber;
	}
	public void setEndPageNumber(int endPageNumber) {
		this.endPageNumber = endPageNumber;
	}
	@Override
	public String toString() {
		return "PagingVO [pageNumber=" + pageNumber + ", maxPageNumber=" + maxPageNumber + ", startPageNumber="
				+ startPageNumber + ", endPageNumber=" + endPageNumber + "]";
	}
	
	
	
 
	 
}
