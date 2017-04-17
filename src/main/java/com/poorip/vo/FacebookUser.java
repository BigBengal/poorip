package com.poorip.vo;

public class FacebookUser {
	
	@Override
	public String toString() {
		return "FacebookUser [email=" + email + ", name=" + name + ", gender=" + gender + ", id=" + id + ", link="
				+ link + ", locale=" + locale + ", birthday=" + birthday + "]";
	}
	private String email;
	private String name;
	private String gender;
	private String id;
	private String link;
	private String locale;
	private String birthday;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	
	
}
