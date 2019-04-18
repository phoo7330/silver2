package com.scit.silver.vo;


public class SilverSearch {
	private int seach_seq;//시퀀스
	private int type;//회원종류
	private String areaa;
	private String areab;
	private String areac;
	private String silvername;
	private String service;
	private String grade;
	private String lauitude;
	private String longitude;
	private String orgname;
	private String name; 
	public SilverSearch(int seach_seq, int type, String areaa, String areab, String areac, String silvername,
			String service, String grade, String lauitude, String longitude, String orgname, String name) {
		super();
		this.seach_seq = seach_seq;
		this.type = type;
		this.areaa = areaa;
		this.areab = areab;
		this.areac = areac;
		this.silvername = silvername;
		this.service = service;
		this.grade = grade;
		this.lauitude = lauitude;
		this.longitude = longitude;
		this.orgname = orgname;
		this.name = name;
	}
	public SilverSearch() {
		super();
	}
	public int getSeach_seq() {
		return seach_seq;
	}
	public void setSeach_seq(int seach_seq) {
		this.seach_seq = seach_seq;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getAreaa() {
		return areaa;
	}
	public void setAreaa(String areaa) {
		this.areaa = areaa;
	}
	public String getAreab() {
		return areab;
	}
	public void setAreab(String areab) {
		this.areab = areab;
	}
	public String getAreac() {
		return areac;
	}
	public void setAreac(String areac) {
		this.areac = areac;
	}
	public String getSilvername() {
		return silvername;
	}
	public void setSilvername(String silvername) {
		this.silvername = silvername;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getLauitude() {
		return lauitude;
	}
	public void setLauitude(String lauitude) {
		this.lauitude = lauitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "SilverSearch [seach_seq=" + seach_seq + ", type=" + type + ", areaa=" + areaa + ", areab=" + areab
				+ ", areac=" + areac + ", silvername=" + silvername + ", service=" + service + ", grade=" + grade
				+ ", lauitude=" + lauitude + ", longitude=" + longitude + ", orgname=" + orgname + ", name=" + name
				+ "]";
	}
}
