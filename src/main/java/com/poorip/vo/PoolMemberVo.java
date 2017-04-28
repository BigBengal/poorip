package com.poorip.vo;

public class PoolMemberVo {
	private int poolMemSeq;
	private int poolSeq;
	private int usrSeq;
	private String approve;
	private String crtDate;
	private int aprvUsr;
	private String usrNick;
	private String profile;
	private String gender;
	private String poolPic;
	private String poolInfo;
	
	
	public String getUsrNick() {
		return usrNick;
	}
	public String getProfile() {
		return profile;
	}
	public String getGender() {
		return gender;
	}
	public void setUsrNick(String usrNick) {
		this.usrNick = usrNick;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getPoolMemSeq() {
		return poolMemSeq;
	}
	public void setPoolMemSeq(int poolMemSeq) {
		this.poolMemSeq = poolMemSeq;
	}
	public int getPoolSeq() {
		return poolSeq;
	}
	public void setPoolSeq(int poolSeq) {
		this.poolSeq = poolSeq;
	}
	public int getUsrSeq() {
		return usrSeq;
	}
	public void setUsrSeq(int usrSeq) {
		this.usrSeq = usrSeq;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public String getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(String crtDate) {
		this.crtDate = crtDate;
	}
	
	public int getAprvUsr() {
		return aprvUsr;
	}
	public void setAprvUsr(int aprvUsr) {
		this.aprvUsr = aprvUsr;
	}
	
	public String getPoolPic() {
		return poolPic;
	}
	public String getPoolInfo() {
		return poolInfo;
	}
	public void setPoolPic(String poolPic) {
		this.poolPic = poolPic;
	}
	public void setPoolInfo(String poolInfo) {
		this.poolInfo = poolInfo;
	}
	@Override
	public String toString() {
		return "PoolMemberVo [poolMemSeq=" + poolMemSeq + ", poolSeq=" + poolSeq + ", usrSeq=" + usrSeq + ", approve="
				+ approve + ", crtDate=" + crtDate + ", aprvUsr=" + aprvUsr + ", usrNick=" + usrNick + ", profile="
				+ profile + ", gender=" + gender + ", poolPic=" + poolPic + ", poolInfo=" + poolInfo + "]";
	}

	

}
