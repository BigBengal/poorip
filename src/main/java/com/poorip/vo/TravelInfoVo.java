package com.poorip.vo;

public class TravelInfoVo {
	
	private int trvSeq;
	private String name;
	private String contents;
	private String hours;
	private String location;
	private String picture;
	private String price;
	private String crtDate;
	private int ctySeq;
	private int catSeq;
	private String mapURL;
	private String contact;
	private int hit;
	private int trvPicSeq;
	private String path;
	private String fileName;
	
	
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
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
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "TravelInfoVo [trvSeq=" + trvSeq + ", name=" + name + ", contents=" + contents + ", hours=" + hours
				+ ", location=" + location + ", picture=" + picture + ", price=" + price + ", crtDate=" + crtDate
				+ ", ctySeq=" + ctySeq + ", catSeq=" + catSeq + ", mapURL=" + mapURL + ", contact=" + contact + ", hit="
				+ hit + ", trvPicSeq=" + trvPicSeq + ", path=" + path + ", fileName=" + fileName + "]";
	}
	
	
}
