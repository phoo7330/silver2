package com.scit.silver.vo;

public class Resume {
	private int re_seq;
	private String userid;
	private String re_type;
	private String re_detailType;
	private String re_job;
	private String re_content;
	private String re_date;
	private String re_areaa;
	private String re_arebb;
	public Resume() {
		super();
	}
	public Resume(int re_seq, String userid, String re_type, String re_detailType, String re_job, String re_content,
			String re_date, String re_areaa, String re_arebb) {
		super();
		this.re_seq = re_seq;
		this.userid = userid;
		this.re_type = re_type;
		this.re_detailType = re_detailType;
		this.re_job = re_job;
		this.re_content = re_content;
		this.re_date = re_date;
		this.re_areaa = re_areaa;
		this.re_arebb = re_arebb;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
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
	public String getRe_areaa() {
		return re_areaa;
	}
	public void setRe_areaa(String re_areaa) {
		this.re_areaa = re_areaa;
	}
	public String getRe_arebb() {
		return re_arebb;
	}
	public void setRe_arebb(String re_arebb) {
		this.re_arebb = re_arebb;
	}
	@Override
	public String toString() {
		return "Resume [re_seq=" + re_seq + ", userid=" + userid + ", re_type=" + re_type + ", re_detailType="
				+ re_detailType + ", re_job=" + re_job + ", re_content=" + re_content + ", re_date=" + re_date
				+ ", re_areaa=" + re_areaa + ", re_arebb=" + re_arebb + "]";
	}

	
}
