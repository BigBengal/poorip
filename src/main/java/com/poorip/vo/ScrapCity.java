package com.poorip.vo;

public class ScrapCity {

	private int scpCitySeq;
	private String dateFrom;
	private String dateTo;
	private String crtDate;
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
		return "ScrapCity [scpCitySeq=" + scpCitySeq + ", dateFrom=" + dateFrom + ", dateTo=" + dateTo + ", crtDate="
				+ crtDate + "]";
	}
	
	
}
