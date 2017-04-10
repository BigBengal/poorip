package com.poorip.vo;

public class ScrapVo {
	
	private int scpSeq;
	private String usrEmail;
	private int trvSeq;
	private int scpCitySeq;
	private String crtDate;

	public int getScpSeq() {
		return scpSeq;
	}
	public void setScpSeq(int scpSeq) {
		this.scpSeq = scpSeq;
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
		return "ScrapVo [scpSeq=" + scpSeq + ", usrEmail=" + usrEmail + ", trvSeq=" + trvSeq + ", scpCitySeq="
				+ scpCitySeq + ", crtDate=" + crtDate + "]";
	}

}
