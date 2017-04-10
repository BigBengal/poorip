package com.poorip.vo;

public class CategoryVo {
	
	
	private int catSeq;
	private String catName;
	private String crtDate;
	
	public int getCatSeq() {
		return catSeq;
	}
	public void setCatSeq(int catSeq) {
		this.catSeq = catSeq;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	
	@Override
	public String toString() {
		return "CategoryVo [catSeq=" + catSeq + ", catName=" + catName + ", crtDate=" + crtDate + "]";
	}
	
}
