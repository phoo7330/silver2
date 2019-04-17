package com.scit.silver.vo;

public class Job {
	private int seach_seq;
	private int type;
	private String areaa;
	private String areab;
	private String areac;
	private String silvername;
	private String service;
	private String grade;
	private String lauitude;
	private String longitude;
	private int jo_seq;
	private String userid;
	private String jo_type;
	private String jo_detailtype;
	private String jo_job;
	private String jo_content;
	private String jo_date;
	private String jo_gender;
	private int jo_int;
	public Job() {
		super();
	}
	public Job(int seach_seq, int type, String areaa, String areab, String areac, String silvername, String service,
			String grade, String lauitude, String longitude, int jo_seq, String userid, String jo_type,
			String jo_detailtype, String jo_job, String jo_content, String jo_date, String jo_gender, int jo_int) {
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
		this.jo_seq = jo_seq;
		this.userid = userid;
		this.jo_type = jo_type;
		this.jo_detailtype = jo_detailtype;
		this.jo_job = jo_job;
		this.jo_content = jo_content;
		this.jo_date = jo_date;
		this.jo_gender = jo_gender;
		this.jo_int = jo_int;
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
	public int getJo_seq() {
		return jo_seq;
	}
	public void setJo_seq(int jo_seq) {
		this.jo_seq = jo_seq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getJo_type() {
		return jo_type;
	}
	public void setJo_type(String jo_type) {
		this.jo_type = jo_type;
	}
	public String getJo_detailtype() {
		return jo_detailtype;
	}
	public void setJo_detailtype(String jo_detailtype) {
		this.jo_detailtype = jo_detailtype;
	}
	public String getJo_job() {
		return jo_job;
	}
	public void setJo_job(String jo_job) {
		this.jo_job = jo_job;
	}
	public String getJo_content() {
		return jo_content;
	}
	public void setJo_content(String jo_content) {
		this.jo_content = jo_content;
	}
	public String getJo_date() {
		return jo_date;
	}
	public void setJo_date(String jo_date) {
		this.jo_date = jo_date;
	}
	public String getJo_gender() {
		return jo_gender;
	}
	public void setJo_gender(String jo_gender) {
		this.jo_gender = jo_gender;
	}
	public int getJo_int() {
		return jo_int;
	}
	public void setJo_int(int jo_int) {
		this.jo_int = jo_int;
	}
	@Override
	public String toString() {
		return "Job [seach_seq=" + seach_seq + ", type=" + type + ", areaa=" + areaa + ", areab=" + areab + ", areac="
				+ areac + ", silvername=" + silvername + ", service=" + service + ", grade=" + grade + ", lauitude="
				+ lauitude + ", longitude=" + longitude + ", jo_seq=" + jo_seq + ", userid=" + userid + ", jo_type="
				+ jo_type + ", jo_detailtype=" + jo_detailtype + ", jo_job=" + jo_job + ", jo_content=" + jo_content
				+ ", jo_date=" + jo_date + ", jo_gender=" + jo_gender + ", jo_int=" + jo_int + "]";
	}
	
	
}
