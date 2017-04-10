package com.poorip.vo;

public class CityVo {
	
	private int ctySeq;
	private String ctyName;
	private String crtDate;
	private int ctrSeq;
	
	public int getCtySeq() {
		return ctySeq;
	}
	public void setCtySeq(int ctySeq) {
		this.ctySeq = ctySeq;
	}
	public String getCtyName() {
		return ctyName;
	}
	public void setCtyName(String ctyName) {
		this.ctyName = ctyName;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	public int getCtrSeq() {
		return ctrSeq;
	}
	public void setCtrSeq(int ctrSeq) {
		this.ctrSeq = ctrSeq;
	}
	
	@Override
	public String toString() {
		return "CityVo [ctySeq=" + ctySeq + ", ctyName=" + ctyName + ", crtDate=" + crtDate + ", ctrSeq=" + ctrSeq
				+ "]";
	}
	
}
