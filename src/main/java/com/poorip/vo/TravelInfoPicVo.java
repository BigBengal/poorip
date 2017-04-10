package com.poorip.vo;

public class TravelInfoPicVo {
	
	private int trvPicSeq;
	private String path;
	private String fileName;
	private int trvSeq;
	private String crtDate;
	
	public int getTrvPicSeq() {
		return trvPicSeq;
	}
	public void setTrvPicSeq(int trvPicSeq) {
		this.trvPicSeq = trvPicSeq;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getTrvSeq() {
		return trvSeq;
	}
	public void setTrvSeq(int trvSeq) {
		this.trvSeq = trvSeq;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	
	@Override
	public String toString() {
		return "TravelInfoPic [trvPicSeq=" + trvPicSeq + ", path=" + path + ", fileName=" + fileName + ", trvSeq="
				+ trvSeq + ", crtDate=" + crtDate + "]";
	}
	
}
