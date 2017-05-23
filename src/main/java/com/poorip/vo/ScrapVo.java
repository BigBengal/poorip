package com.poorip.vo;

public class ScrapVo {
	
	private int scpSeq;
	private int usrSeq;
	private int trvSeq;
	private int scpCitySeq;
	private String crtDate;
	private int trvOrd;

	public int getTrvOrd() {
		return trvOrd;
	}
	public void setTrvOrd(int trvOrd) {
		this.trvOrd = trvOrd;
	}
	public int getScpSeq() {
		return scpSeq;
	}
	public void setScpSeq(int scpSeq) {
		this.scpSeq = scpSeq;
	}
	public int getUsrSeq() {
		return usrSeq;
	}
	public void setUsrSeq(int usrSeq) {
		this.usrSeq = usrSeq;
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
		return "ScrapVo [scpSeq=" + scpSeq + ", usrSeq=" + usrSeq + ", trvSeq=" + trvSeq + ", scpCitySeq=" + scpCitySeq
				+ ", crtDate=" + crtDate + ", trvOrd=" + trvOrd + "]";
	}

}
