package com.poorip.vo;

public class PostPicVo {
	private int postPicSeq;
	private String path;
	private String fileName;
	private int postSeq;
	private String crtDate;
	
	public int getPostPicSeq() {
		return postPicSeq;
	}
	public void setPostPicSeq(int postPicSeq) {
		this.postPicSeq = postPicSeq;
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
	@Override
	public String toString() {
		return "PostPicVo [postPicSeq=" + postPicSeq + ", path=" + path + ", fileName=" + fileName + ", postSeq="
				+ postSeq + ", crtDate=" + crtDate + "]";
	}
	
}
