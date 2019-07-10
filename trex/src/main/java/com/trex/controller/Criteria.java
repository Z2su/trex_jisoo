package com.trex.controller;

public class Criteria {

	private int page; // 현재 페이지 번호
	private int perPageNum; // 한페이지당 보여줄 행수
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public int getPageStartRowNum(){
		return (this.page-1)*perPageNum;
	}
	
	public int getPage() {
		return page;
	}

	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPage(int page) {
		if (page < 1) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		 this.perPageNum = perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}
