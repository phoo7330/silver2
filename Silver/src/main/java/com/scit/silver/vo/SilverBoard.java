package com.scit.silver.vo;

import java.util.Date;

public class SilverBoard {

	private int sb_seq;
	private String userid;
	private int seach_seq;
	private String sbtitle;
	private String sbwrite;
	private String sbdate;
	public SilverBoard() {
		super();
	}
	public SilverBoard(int sb_seq, String userid, int seach_seq, String sbtitle, String sbwrite, String sbdate) {
		super();
		this.sb_seq = sb_seq;
		this.userid = userid;
		this.seach_seq = seach_seq;
		this.sbtitle = sbtitle;
		this.sbwrite = sbwrite;
		this.sbdate = sbdate;
	}
	public int getSb_seq() {
		return sb_seq;
	}
	public void setSb_seq(int sb_seq) {
		this.sb_seq = sb_seq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getSeach_seq() {
		return seach_seq;
	}
	public void setSeach_seq(int seach_seq) {
		this.seach_seq = seach_seq;
	}
	public String getSbtitle() {
		return sbtitle;
	}
	public void setSbtitle(String sbtitle) {
		this.sbtitle = sbtitle;
	}
	public String getSbwrite() {
		return sbwrite;
	}
	public void setSbwrite(String sbwrite) {
		this.sbwrite = sbwrite;
	}
	public String getSbdate() {
		return sbdate;
	}
	public void setSbdate(String sbdate) {
		this.sbdate = sbdate;
	}
	@Override
	public String toString() {
		return "SilverBoard [sb_seq=" + sb_seq + ", userid=" + userid + ", seach_seq=" + seach_seq + ", sbtitle="
				+ sbtitle + ", sbwrite=" + sbwrite + ", sbdate=" + sbdate + "]";
	}
	
	
}
