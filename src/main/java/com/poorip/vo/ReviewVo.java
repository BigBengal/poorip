package com.poorip.vo;

public class ReviewVo {
	private int postPicSeq;
	private String path;
	private String fileName;
	private int postSeq;
	private String crtDate;
	private String title;
	private String contents;
	private String reviewPubYn;
	private int usrSeq;
	private int trvSeq;
	private String name;
	private String hours;
	private String location;
	private String picture;
	private int ctySeq;
	private String ctyName;
	private int catSeq;
	private String mapURL;
	private String contact;
	private String reviewNum;
	private String hidden;
	private int likeCount;
	
	
	
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(String reviewNum) {
		this.reviewNum = reviewNum;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getCtySeq() {
		return ctySeq;
	}
	public void setCtySeq(int ctySeq) {
		this.ctySeq = ctySeq;
	}
	public int getCatSeq() {
		return catSeq;
	}
	public void setCatSeq(int catSeq) {
		this.catSeq = catSeq;
	}
	public String getMapURL() {
		return mapURL;
	}
	public void setMapURL(String mapURL) {
		this.mapURL = mapURL;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getHidden() {
		return hidden;
	}
	public void setHidden(String hidden) {
		this.hidden = hidden;
	}
	
	@Override
	public String toString() {
		return "ReviewVo [postPicSeq=" + postPicSeq + ", path=" + path + ", fileName=" + fileName + ", postSeq="
				+ postSeq + ", crtDate=" + crtDate + ", title=" + title + ", contents=" + contents + ", reviewPubYn="
				+ reviewPubYn + ", usrSeq=" + usrSeq + ", trvSeq=" + trvSeq + ", name=" + name + ", hours=" + hours
				+ ", location=" + location + ", picture=" + picture + ", ctySeq=" + ctySeq + ", ctyName=" + ctyName
				+ ", catSeq=" + catSeq + ", mapURL=" + mapURL + ", contact=" + contact + ", reviewNum=" + reviewNum
				+ ", hidden=" + hidden + ", likeCount=" + likeCount + "]";
	}
	public String getCtyName() {
		return ctyName;
	}
	public void setCtyName(String ctyName) {
		this.ctyName = ctyName;
	}
}
