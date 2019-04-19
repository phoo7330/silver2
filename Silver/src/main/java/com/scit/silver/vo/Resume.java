package com.scit.silver.vo;

public class Resume {
	private int rs_seq;
	private String userid;
	private String re_type;
	private String re_detailType;
	private String re_job;
	private String re_content;
	private String re_date;
	private String re_areaA;
	private String re_areaB;
	
	public Resume(int rs_seq, String userid, String re_type, String re_detailType, String re_job, String re_content,
			String re_date, String re_areaA, String re_areaB) {
		super();
		this.rs_seq = rs_seq;
		this.userid = userid;
		this.re_type = re_type;
		this.re_detailType = re_detailType;
		this.re_job = re_job;
		this.re_content = re_content;
		this.re_date = re_date;
		this.re_areaA = re_areaA;
		this.re_areaB = re_areaB;
	}

	public Resume() {
		super();
	}

	public int getRs_seq() {
		return rs_seq;
	}

	public void setRs_seq(int rs_seq) {
		this.rs_seq = rs_seq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRe_type() {
		return re_type;
	}

	public void setRe_type(String re_type) {
		this.re_type = re_type;
	}

	public String getRe_detailType() {
		return re_detailType;
	}

	public void setRe_detailType(String re_detailType) {
		this.re_detailType = re_detailType;
	}

	public String getRe_job() {
		return re_job;
	}

	public void setRe_job(String re_job) {
		this.re_job = re_job;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_date() {
		return re_date;
	}

	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}

	public String getRe_areaA() {
		return re_areaA;
	}

	public void setRe_areaA(String re_areaA) {
		this.re_areaA = re_areaA;
	}

	public String getRe_areaB() {
		return re_areaB;
	}

	public void setRe_areaB(String re_areaB) {
		this.re_areaB = re_areaB;
	}

	

}
