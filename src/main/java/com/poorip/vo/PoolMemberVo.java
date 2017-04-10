package com.poorip.vo;

public class PoolMemberVo {
	private int poolMemSeq;
	private int poolSeq;
	private String usrEmail;
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
	public String getUsrEmail() {
		return usrEmail;
	}
	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
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
		return "PoolMember [poolMemSeq=" + poolMemSeq + ", poolSeq=" + poolSeq + ", usrEmail=" + usrEmail + ", approve="
				+ approve + ", crtDate=" + crtDate + "]";
	}
}
