package com.poorip.vo;

public class PoolMemberVo {
	private int poolMemSeq;
	private int poolSeq;
	private int usrSeq;
	private String approve;
	private String crtDate;
	
	public int getPoolMemSeq() {
		return poolMemSeq;
	}
	public void setPoolMemSeq(int poolMemSeq) {
		this.poolMemSeq = poolMemSeq;
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
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	@Override
	public String toString() {
		return "PoolMemberVo [poolMemSeq=" + poolMemSeq + ", poolSeq=" + poolSeq + ", usrSeq=" + usrSeq + ", approve="
				+ approve + ", crtDate=" + crtDate + "]";
	}
}
