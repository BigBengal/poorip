package com.poorip.vo;

public class Request {

	private int reqSeq;
	private String kind;
	private String title;
	private String contents;
	private String usrEmail;
	private String crtDate;
	@Override
	public String toString() {
		return "Request [reqSeq=" + reqSeq + ", kind=" + kind + ", title=" + title + ", contents=" + contents
				+ ", usrEmail=" + usrEmail + ", crtDate=" + crtDate + "]";
	}
	
}
