package com.scit.silver.vo;

import java.util.Date;

public class SilverBoard {

	private int sb_seq;
	private int code_seq;
	private int seach_seq;
	private String sbtitle;
	private String sbwrite;
	private Date sbdate;
	public SilverBoard() {
		super();
	}
	public SilverBoard(int sb_seq, int code_seq, int seach_seq, String sbtitle, String sbwrite, Date sbdate) {
		super();
		this.sb_seq = sb_seq;
		this.code_seq = code_seq;
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
	public int getCode_seq() {
		return code_seq;
	}
	public void setCode_seq(int code_seq) {
		this.code_seq = code_seq;
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
	public Date getSbdate() {
		return sbdate;
	}
	public void setSbdate(Date sbdate) {
		this.sbdate = sbdate;
	}
	@Override
	public String toString() {
		return "SilverBoard [sb_seq=" + sb_seq + ", code_seq=" + code_seq + ", seach_seq=" + seach_seq + ", sbtitle="
				+ sbtitle + ", sbwrite=" + sbwrite + ", sbdate=" + sbdate + "]";
	}
	
	
	
}
