package com.scit.silver.vo;

public class message {
	private int ms_seq;
	private String userid;
	private String ms_title;
	private String ms_content;
	private String ms_date;
	private String ms_Sender;
	private String ms_content2;
	private int ms_del1;
	private int ms_del2;
	private String ms_vdate;
	public message() {
		super();
	}
	public message(int ms_seq, String userid, String ms_title, String ms_content, String ms_date, String ms_Sender,
			String ms_content2, int ms_del1, int ms_del2, String ms_vdate) {
		super();
		this.ms_seq = ms_seq;
		this.userid = userid;
		this.ms_title = ms_title;
		this.ms_content = ms_content;
		this.ms_date = ms_date;
		this.ms_Sender = ms_Sender;
		this.ms_content2 = ms_content2;
		this.ms_del1 = ms_del1;
		this.ms_del2 = ms_del2;
		this.ms_vdate = ms_vdate;
	}
	public int getMs_seq() {
		return ms_seq;
	}
	public void setMs_seq(int ms_seq) {
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
	public String getMs_date() {
		return ms_date;
	}
	public void setMs_date(String ms_date) {
		this.ms_date = ms_date;
	}
	public String getMs_Sender() {
		return ms_Sender;
	}
	public void setMs_Sender(String ms_Sender) {
		this.ms_Sender = ms_Sender;
	}
	public String getMs_content2() {
		return ms_content2;
	}
	public void setMs_content2(String ms_content2) {
		this.ms_content2 = ms_content2;
	}
	public int getMs_del1() {
		return ms_del1;
	}
	public void setMs_del1(int ms_del1) {
		this.ms_del1 = ms_del1;
	}
	public int getMs_del2() {
		return ms_del2;
	}
	public void setMs_del2(int ms_del2) {
		this.ms_del2 = ms_del2;
	}
	public String getMs_vdate() {
		return ms_vdate;
	}
	public void setMs_vdate(String ms_vdate) {
		this.ms_vdate = ms_vdate;
	}
	@Override
	public String toString() {
		return "message [ms_seq=" + ms_seq + ", userid=" + userid + ", ms_title=" + ms_title + ", ms_content="
				+ ms_content + ", ms_date=" + ms_date + ", ms_Sender=" + ms_Sender + ", ms_content2=" + ms_content2
				+ ", ms_del1=" + ms_del1 + ", ms_del2=" + ms_del2 + ", ms_vdate=" + ms_vdate + "]";
	}
	
	
}
