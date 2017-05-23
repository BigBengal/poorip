package com.poorip.vo;

public class UserVo {
	
	private int usrSeq;
	private String usrEmail;
	private String usrProfile;
	private String usrGender;
	private String usrLang;
	private String usrBd;
	private String usrNick;
	private String usrInfo;
	private String usrHashtag;
	private String usrPref1;
	private String usrPref2;
	private String usrPref3;
	private String usrPref4;
	private String usrPref5;
	private String usrNoti;
	private String usrJoinDate;
	private String usrLoginDate;
	private String usrBlackYN;
	private int foodHit;
	private int sightHit;
	private int activityHit;
	private int luxuryHit;
	private int useriSurveyScore;
	private int foodScore;
	private int sightScore;
	private int activityScore;
	private int luxuryScore;
	private int dateScore;
	private int matchingScore;
	
	public boolean equals(UserVo uservo) {		
		return this.usrSeq == uservo.getUsrSeq();
	}

	public int getUsrSeq() {
		return usrSeq;
	}


	public void setUsrSeq(int usrSeq) {
		this.usrSeq = usrSeq;
	}


	public String getUsrEmail() {
		return usrEmail;
	}


	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
	}


	public String getUsrProfile() {
		return usrProfile;
	}


	public void setUsrProfile(String usrProfile) {
		this.usrProfile = usrProfile;
	}


	public String getUsrGender() {
		return usrGender;
	}


	public void setUsrGender(String usrGender) {
		this.usrGender = usrGender;
	}


	public String getUsrLang() {
		return usrLang;
	}


	public void setUsrLang(String usrLang) {
		this.usrLang = usrLang;
	}


	public String getUsrBd() {
		return usrBd;
	}


	public void setUsrBd(String usrBd) {
		this.usrBd = usrBd;
	}


	public String getUsrNick() {
		return usrNick;
	}


	public void setUsrNick(String usrNick) {
		this.usrNick = usrNick;
	}


	public String getUsrInfo() {
		return usrInfo;
	}


	public void setUsrInfo(String usrInfo) {
		this.usrInfo = usrInfo;
	}


	public String getUsrHashtag() {
		return usrHashtag;
	}


	public void setUsrHashtag(String usrHashtag) {
		this.usrHashtag = usrHashtag;
	}


	public String getUsrPref1() {
		return usrPref1;
	}


	public void setUsrPref1(String usrPref1) {
		this.usrPref1 = usrPref1;
	}


	public String getUsrPref2() {
		return usrPref2;
	}


	public void setUsrPref2(String usrPref2) {
		this.usrPref2 = usrPref2;
	}


	public String getUsrPref3() {
		return usrPref3;
	}


	public void setUsrPref3(String usrPref3) {
		this.usrPref3 = usrPref3;
	}


	public String getUsrPref4() {
		return usrPref4;
	}


	public void setUsrPref4(String usrPref4) {
		this.usrPref4 = usrPref4;
	}


	public String getUsrPref5() {
		return usrPref5;
	}


	public void setUsrPref5(String usrPref5) {
		this.usrPref5 = usrPref5;
	}


	public String getUsrNoti() {
		return usrNoti;
	}


	public void setUsrNoti(String usrNoti) {
		this.usrNoti = usrNoti;
	}


	public String getUsrJoinDate() {
		return usrJoinDate;
	}


	public void setUsrJoinDate(String usrJoinDate) {
		this.usrJoinDate = usrJoinDate;
	}


	public String getUsrLoginDate() {
		return usrLoginDate;
	}


	public void setUsrLoginDate(String usrLoginDate) {
		this.usrLoginDate = usrLoginDate;
	}


	public String getUsrBlackYN() {
		return usrBlackYN;
	}


	public void setUsrBlackYN(String usrBlackYN) {
		this.usrBlackYN = usrBlackYN;
	}

	public int getFoodHit() {
		return foodHit;
	}


	public void setFoodHit(int foodHit) {
		this.foodHit = foodHit;
	}


	public int getSightHit() {
		return sightHit;
	}


	public void setSightHit(int sightHit) {
		this.sightHit = sightHit;
	}


	public int getActivityHit() {
		return activityHit;
	}


	public void setActivityHit(int activityHit) {
		this.activityHit = activityHit;
	}


	public int getLuxuryHit() {
		return luxuryHit;
	}


	public void setLuxuryHit(int luxuryHit) {
		this.luxuryHit = luxuryHit;
	}
	
	public int getUseriSurveyScore() {
		return useriSurveyScore;
	}


	public void setUseriSurveyScore(int useriSurveyScore) {
		this.useriSurveyScore = useriSurveyScore;
	}

	public int getFoodScore() {
		return foodScore;
	}


	public void setFoodScore(int foodScore) {
		this.foodScore = foodScore;
	}


	public int getSightScore() {
		return sightScore;
	}


	public void setSightScore(int sightScore) {
		this.sightScore = sightScore;
	}


	public int getActivityScore() {
		return activityScore;
	}


	public void setActivityScore(int activityScore) {
		this.activityScore = activityScore;
	}


	public int getLuxuryScore() {
		return luxuryScore;
	}


	public void setLuxuryScore(int luxuryScore) {
		this.luxuryScore = luxuryScore;
	}


	public int getDateScore() {
		return dateScore;
	}


	public void setDateScore(int dateScore) {
		this.dateScore = dateScore;
	}


	public int getMatchingScore() {
		return matchingScore;
	}


	public void setMatchingScore(int matchingScore) {
		this.matchingScore = matchingScore;
	}


	@Override
	public String toString() {
		return "UserVo [usrSeq=" + usrSeq + ", usrEmail=" + usrEmail + ", usrProfile=" + usrProfile + ", usrGender="
				+ usrGender + ", usrLang=" + usrLang + ", usrBd=" + usrBd + ", usrNick=" + usrNick + ", usrInfo="
				+ usrInfo + ", usrHashtag=" + usrHashtag + ", usrPref1=" + usrPref1 + ", usrPref2=" + usrPref2
				+ ", usrPref3=" + usrPref3 + ", usrPref4=" + usrPref4 + ", usrPref5=" + usrPref5 + ", usrNoti="
				+ usrNoti + ", usrJoinDate=" + usrJoinDate + ", usrLoginDate=" + usrLoginDate + ", usrBlackYN="
				+ usrBlackYN + ", foodHit=" + foodHit + ", sightHit=" + sightHit + ", activityHit=" + activityHit
				+ ", luxuryHit=" + luxuryHit + ", useriSurveyScore=" + useriSurveyScore + ", foodScore=" + foodScore
				+ ", sightScore=" + sightScore + ", activityScore=" + activityScore + ", luxuryScore=" + luxuryScore
				+ ", dateScore=" + dateScore + ", matchingScore=" + matchingScore + "]";
	}

}
