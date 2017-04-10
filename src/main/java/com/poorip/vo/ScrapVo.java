package com.poorip.vo;

public class ScrapVo {
	
	private int seq;
	private String usrEmail;
	private int trvSeq;
	private int scpCitySeq;
	private String crtDate;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUsrEmail() {
		return usrEmail;
	}
	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
	}
	public int getTrvSeq() {
		return trvSeq;
	}
	public void setTrvSeq(int trvSeq) {
		this.trvSeq = trvSeq;
	}
	public int getScpCitySeq() {
		return scpCitySeq;
	}
	public void setScpCitySeq(int scpCitySeq) {
		this.scpCitySeq = scpCitySeq;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	@Override
	public String toString() {
		return "ScrapVo [seq=" + seq + ", usrEmail=" + usrEmail + ", trvSeq=" + trvSeq + ", scpCitySeq=" + scpCitySeq
				+ ", crtDate=" + crtDate + "]";
	}
}
