package com.poorip.vo;

/**
 * @author BIT
 *
 */
/**
 * @author BIT
 *
 */
public class PoolPartyVo {
	private int poolSeq;
	private String poolName;
	private String poolComment;
	private String poolPic;
	private int ctySeq;
	private int managerUsrSeq;
	private String poolPublicYn;
	private String crtDate;
	private String fromDate;
	private String toDate;
	private int hit;
	private String ctyName;
	private String managerUsrNick;
	private String managerProfile;
	private String managerGender;
	
	public String getManagerUsrNick() {
		return managerUsrNick;
	}
	public String getManagerProfile() {
		return managerProfile;
	}
	public String getManagerGender() {
		return managerGender;
	}
	public void setManagerUsrNick(String managerUsrNick) {
		this.managerUsrNick = managerUsrNick;
	}
	public void setManagerProfile(String managerProfile) {
		this.managerProfile = managerProfile;
	}
	public void setManagerGender(String managerGender) {
		this.managerGender = managerGender;
	}
	public String getCtyName() {
		return ctyName;
	}
	public void setCtyName(String ctyName) {
		this.ctyName = ctyName;
	}
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
	public int getCtySeq() {
		return ctySeq;
	}
	public void setCtySeq(int citySeq) {
		this.ctySeq = citySeq;
	}
	public int getManagerUsrSeq() {
		return managerUsrSeq;
	}
	public void setManagerUsrSeq(int managerUsrSeq) {
		this.managerUsrSeq = managerUsrSeq;
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
	
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "PoolPartyVo [poolSeq=" + poolSeq + ", poolName=" + poolName + ", poolComment=" + poolComment
				+ ", poolPic=" + poolPic + ", ctySeq=" + ctySeq + ", managerUsrSeq=" + managerUsrSeq + ", poolPublicYn="
				+ poolPublicYn + ", crtDate=" + crtDate + ", fromDate=" + fromDate + ", toDate=" + toDate + ", hit="
				+ hit + ", ctyName=" + ctyName + ", managerUsrNick=" + managerUsrNick + ", managerProfile="
				+ managerProfile + ", managerGender=" + managerGender + "]";
	}
}
