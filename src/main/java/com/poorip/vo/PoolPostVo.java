package com.poorip.vo;

public class PoolPostVo {
	private int ppSeq;
	private int poolSeq;
	private int postSeq;
	private String crtDate;
	
	public int getPpSeq() {
		return ppSeq;
	}
	@Override
	public String toString() {
		return "PoolPostVo [ppSeq=" + ppSeq + ", poolSeq=" + poolSeq + ", postSeq=" + postSeq + ", crtDate=" + crtDate
				+ "]";
	}
	public void setPpSeq(int ppSeq) {
		this.ppSeq = ppSeq;
	}
	public int getPoolSeq() {
		return poolSeq;
	}
	public void setPoolSeq(int poolSeq) {
		this.poolSeq = poolSeq;
	}
	public int getPostSeq() {
		return postSeq;
	}
	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	
	
	
}
