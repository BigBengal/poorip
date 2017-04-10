package com.poorip.vo;

public class PostVo {
	private int postSeq;
	private String title;
	private String contents;
	private String reviewPubYn;
	private String usrEmail;
	private int trvSeq;
	private String crtDate;
		
	@Override
	public String toString() {
		return "PostVo [postSeq=" + postSeq + ", title=" + title + ", contents=" + contents + ", reviewPubYn="
				+ reviewPubYn + ", usrEmail=" + usrEmail + ", trvSeq=" + trvSeq + ", crtDate=" + crtDate + "]";
	}
	public int getPostSeq() {
		return postSeq;
	}
	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
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
	public String getReviewPubYn() {
		return reviewPubYn;
	}
	public void setReviewPubYn(String reviewPubYn) {
		this.reviewPubYn = reviewPubYn;
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
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	
	
}
