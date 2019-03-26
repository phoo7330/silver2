package com.scit.silver.vo;


public class Member {
	
	private int code_seq;
	private int type;
	private	String userid;
	private String userpwd;
	private	String username;
	private	String birthday;
	private String gender;
	private	String address;
	private	String registration;
	private	String email;
	private	int warning;
	public Member(int code_seq, int type, String userid, String userpwd, String username, String birthday,
			String gender, String address, String registration, String email, int warning) {
		super();
		this.code_seq = code_seq;
		this.type = type;
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.birthday = birthday;
		this.gender = gender;
		this.address = address;
		this.registration = registration;
		this.email = email;
		this.warning = warning;
	}
	public Member() {
		super();
	}
	public int getCode_seq() {
		return code_seq;
	}
	public void setCode_seq(int code_seq) {
		this.code_seq = code_seq;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRegistration() {
		return registration;
	}
	public void setRegistration(String registration) {
		this.registration = registration;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getWarning() {
		return warning;
	}
	public void setWarning(int warning) {
		this.warning = warning;
	}
	@Override
	public String toString() {
		return "Member [code_seq=" + code_seq + ", type=" + type + ", userid=" + userid + ", userpwd=" + userpwd
				+ ", username=" + username + ", birthday=" + birthday + ", gender=" + gender + ", address=" + address
				+ ", registration=" + registration + ", email=" + email + ", warning=" + warning + "]";
	}
	 
	
}
