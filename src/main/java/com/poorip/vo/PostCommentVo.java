package com.poorip.vo;

public class PostCommentVo {
	private int postCmtSeq;
	private int postSeq;
	private String contents;
	private int usrSeq;
	private String usrName;
	private String usrImg;
	private String crtDate;
	
	public String getUsrName() {
		return usrName;
	}
	public void setUsrName(String usrName) {
		this.usrName = usrName;
	}
	public String getUsrImg() {
		return usrImg;
	}
	public void setUsrImg(String usrImg) {
		this.usrImg = usrImg;
	}
	
	public int getPostCmtSeq() {
		return postCmtSeq;
	}
	public int getPostSeq() {
		return postSeq;
	}
	public String getContents() {
		return contents;
	}
	public int getUsrSeq() {
		return usrSeq;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setPostCmtSeq(int postCmtSeq) {
		this.postCmtSeq = postCmtSeq;
	}
	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public void setUsrSeq(int usrSeq) {
		this.usrSeq = usrSeq;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}

	@Override
	public String toString() {
		return "PostCommentVo [postCmtSeq=" + postCmtSeq + ", postSeq=" + postSeq + ", contents=" + contents
				+ ", usrSeq=" + usrSeq + ", crtDate=" + crtDate + "]";
	}
	
}
