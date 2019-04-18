package com.scit.silver.vo;

public class message {
	private String ms_seq;
	private String userid;
	private String ms_title;
	private String ms_content;
	private String ms_Sender;
	private String ms_date;
	public message(String ms_seq, String userid, String ms_title, String ms_content, String ms_Sender, String ms_date) {
		super();
		this.ms_seq = ms_seq;
		this.userid = userid;
		this.ms_title = ms_title;
		this.ms_content = ms_content;
		this.ms_Sender = ms_Sender;
		this.ms_date = ms_date;
	}
	public message() {
		super();
	}
	public String getMs_seq() {
		return ms_seq;
	}
	public void setMs_seq(String ms_seq) {
		this.ms_seq = ms_seq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMs_title() {
		return ms_title;
	}
	public void setMs_title(String ms_title) {
		this.ms_title = ms_title;
	}
	public String getMs_content() {
		return ms_content;
	}
	public void setMs_content(String ms_content) {
		this.ms_content = ms_content;
	}
	public String getMs_Sender() {
		return ms_Sender;
	}
	public void setMs_Sender(String ms_Sender) {
		this.ms_Sender = ms_Sender;
	}
	public String getMs_date() {
		return ms_date;
	}
	public void setMs_date(String ms_date) {
		this.ms_date = ms_date;
	}
	@Override
	public String toString() {
		return "message [ms_seq=" + ms_seq + ", userid=" + userid + ", ms_title=" + ms_title + ", ms_content="
				+ ms_content + ", ms_Sender=" + ms_Sender + ", ms_date=" + ms_date + "]";
	}
}
