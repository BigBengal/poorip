package com.poorip.vo;

public class PoolLikeVo {
	private int poolLikeSeq;
	private int poolSeq;
	private int usrSeq;
	private String crtDate;
	public int getPoolLikeSeq() {
		return poolLikeSeq;
	}
	public void setPoolLikeSeq(int poolLikeSeq) {
		this.poolLikeSeq = poolLikeSeq;
	}
	public int getPoolSeq() {
		return poolSeq;
	}
	public void setPoolSeq(int poolSeq) {
		this.poolSeq = poolSeq;
	}
	public int getUsrSeq() {
		return usrSeq;
	}
	public void setUsrSeq(int usrSeq) {
		this.usrSeq = usrSeq;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	@Override
	public String toString() {
		return "PoolLikeVo [poolLikeSeq=" + poolLikeSeq + ", poolSeq=" + poolSeq + ", usrSeq=" + usrSeq + ", crtDate="
				+ crtDate + "]";
	}
	
}
