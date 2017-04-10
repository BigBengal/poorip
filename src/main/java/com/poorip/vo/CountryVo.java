package com.poorip.vo;

public class CountryVo {
	
	private int ctrSeq;
	private String ctrName;
	private String crtDate;
	
	public int getCtrSeq() {
		return ctrSeq;
	}
	public void setCtrSeq(int ctrSeq) {
		this.ctrSeq = ctrSeq;
	}
	public String getCtrName() {
		return ctrName;
	}
	public void setCtrName(String ctrName) {
		this.ctrName = ctrName;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}

	@Override
	public String toString() {
		return "Country [ctrSeq=" + ctrSeq + ", ctrName=" + ctrName + ", crtDate=" + crtDate + "]";
	}

}
