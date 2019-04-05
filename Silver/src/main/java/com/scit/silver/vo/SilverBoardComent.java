package com.scit.silver.vo;

public class SilverBoardComent {
	private int sbc_seq;
	private String userid;
	private int sb_seq;
	private String sbc_date;
	private String sbc_write;
	public SilverBoardComent() {
		super();
	}
	public SilverBoardComent(int sbc_seq, String userid, int sb_seq, String sbc_date, String sbc_write) {
		super();
		this.sbc_seq = sbc_seq;
		this.userid = userid;
		this.sb_seq = sb_seq;
		this.sbc_date = sbc_date;
		this.sbc_write = sbc_write;
	}
	public int getSbc_seq() {
		return sbc_seq;
	}
	public void setSbc_seq(int sbc_seq) {
		this.sbc_seq = sbc_seq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getSb_seq() {
		return sb_seq;
	}
	public void setSb_seq(int sb_seq) {
		this.sb_seq = sb_seq;
	}
	public String getSbc_date() {
		return sbc_date;
	}
	public void setSbc_date(String sbc_date) {
		this.sbc_date = sbc_date;
	}
	public String getSbc_write() {
		return sbc_write;
	}
	public void setSbc_write(String sbc_write) {
		this.sbc_write = sbc_write;
	}
	@Override
	public String toString() {
		return "SilverBoardComent [sbc_seq=" + sbc_seq + ", userid=" + userid + ", sb_seq=" + sb_seq + ", sbc_date="
				+ sbc_date + ", sbc_write=" + sbc_write + "]";
	}
	
	
}
