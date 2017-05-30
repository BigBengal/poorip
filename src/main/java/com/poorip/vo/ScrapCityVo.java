package com.poorip.vo;

public class ScrapCityVo {

	private int scpCitySeq;
	private String dateFrom;
	private String dateTo;
	private String crtDate;
	private int ctySeq;
	private int usrSeq;
	private int trvOrd;
	private String ctyName;
	private int dateDiff;
	private String ctrName;
	
	
	public String getCtrName() {
		return ctrName;
	}
	public void setCtrName(String ctrName) {
		this.ctrName = ctrName;
	}
	public int getTrvOrd() {
		return trvOrd;
	}
	public void setTrvOrd(int trvOrd) {
		this.trvOrd = trvOrd;
	}
	public int getDateDiff() {
		return dateDiff;
	}
	public void setDateDiff(int dateDiff) {
		this.dateDiff = dateDiff;
	}
	public int getCtySeq() {
		return ctySeq;
	}
	public int getUsrSeq() {
		return usrSeq;
	}
	public void setCtySeq(int ctySeq) {
		this.ctySeq = ctySeq;
	}
	public void setUsrSeq(int usrSeq) {
		this.usrSeq = usrSeq;
	}

	public String getCtyName() {
		return ctyName;
	}
	public void setCtyName(String ctyName) {
		this.ctyName = ctyName;
	}
	public int getScpCitySeq() {
		return scpCitySeq;
	}
	public void setScpCitySeq(int scpCitySeq) {
		this.scpCitySeq = scpCitySeq;
	}
	public String getDateFrom() {
		return dateFrom;
	}
	public void setDateFrom(String dateFrom) {
		this.dateFrom = dateFrom;
	}
	public String getDateTo() {
		return dateTo;
	}
	public void setDateTo(String dateTo) {
		this.dateTo = dateTo;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	@Override
	public String toString() {
		return "ScrapCityVo [scpCitySeq=" + scpCitySeq + ", dateFrom=" + dateFrom + ", dateTo=" + dateTo + ", crtDate="
				+ crtDate + ", ctySeq=" + ctySeq + ", usrSeq=" + usrSeq + ", trvOrd=" + trvOrd + ", ctyName=" + ctyName
				+ ", dateDiff=" + dateDiff + ", ctrName=" + ctrName + "]";
	}
		
}
