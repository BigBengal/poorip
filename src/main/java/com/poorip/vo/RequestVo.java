package com.poorip.vo;

public class RequestVo {

	private int reqSeq;
	private String kind;
	private String title;
	private String contents;
	private int usrSeq;
	private String crtDate;

	public int getReqSeq() {
		return reqSeq;
	}

	public void setReqSeq(int reqSeq) {
		this.reqSeq = reqSeq;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getUsrSeq() {
		return usrSeq;
	}

	public void setUsrSeq(int usrSeq) {
		this.usrSeq = usrSeq;
	}

	public String getCrtDate() {
		return crtDate;
	}

	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}

	@Override
	public String toString() {
		return "RequestVo [reqSeq=" + reqSeq + ", kind=" + kind + ", title=" + title + ", contents=" + contents
				+ ", usrSeq=" + usrSeq + ", crtDate=" + crtDate + "]";
	}

}
