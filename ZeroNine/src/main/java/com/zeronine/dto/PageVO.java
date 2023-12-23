package com.zeronine.dto;

public class PageVO {

	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		if(page <=0) {
			this.page =1;
		}else {
			this.page = page;	
		
	}
		
	}


	public int getPerPageNum() {
		return perPageNum;
	}


	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}


	private int page;
	private int perPageNum;
	
	
	public int getPageStart() {
		
		return(this.page-1)*perPageNum;
	}
	
	
	public PageVO() {
		this.page =1;
		this.perPageNum= 16;
	}
	
	
}
