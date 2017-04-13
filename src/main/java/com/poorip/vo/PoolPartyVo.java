package com.poorip.vo;

public class PoolPartyVo {
	private int poolSeq;
	private String poolName;
	private String poolComment;
	private String poolPic;
	private int citySeq;
	private String managerEmail;
	private String poolPublicYn;
	private String crtDate;
	
	public int getPoolSeq() {
		return poolSeq;
	}
	public void setPoolSeq(int poolSeq) {
		this.poolSeq = poolSeq;
	}
	public String getPoolName() {
		return poolName;
	}
	public void setPoolName(String poolName) {
		this.poolName = poolName;
	}
	public String getPoolComment() {
		return poolComment;
	}
	public void setPoolComment(String poolComment) {
		this.poolComment = poolComment;
	}
	public String getPoolPic() {
		return poolPic;
	}
	public void setPoolPic(String poolPic) {
		this.poolPic = poolPic;
	}
	public int getCitySeq() {
		return citySeq;
	}
	public void setCitySeq(int citySeq) {
		this.citySeq = citySeq;
	}
	public String getManagerEmail() {
		return managerEmail;
	}
	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}
	public String getPoolPublicYn() {
		return poolPublicYn;
	}
	public void setPoolPublicYn(String poolPublicYn) {
		this.poolPublicYn = poolPublicYn;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	
	@Override
	public String toString() {
		return "PoolPartyVo [poolSeq=" + poolSeq + ", poolName=" + poolName + ", poolComment=" + poolComment
				+ ", poolPic=" + poolPic + ", citySeq=" + citySeq + ", managerEmail=" + managerEmail
				+ ", poolPublicYn=" + poolPublicYn + ", crtDate=" + crtDate + "]";
	}
	
	
}
