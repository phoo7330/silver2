package com.scit.silver.vo;


public class Details {
	private int detail_seq;
	private int seach_seq;
	private int detail_number;
	private String establishment;
	private String approval;
	private String address;
	private String house_number;
	private String parkinglot;
	
	
	public Details(int detail_seq, int seach_seq, int detail_number, String establishment, String approval,
			String address, String house_number, String parkinglot) {
		super();
		this.detail_seq = detail_seq;
		this.seach_seq = seach_seq;
		this.detail_number = detail_number;
		this.establishment = establishment;
		this.approval = approval;
		this.address = address;
		this.house_number = house_number;
		this.parkinglot = parkinglot;
	}

	public Details() {
		super();
	}

	public int getDetail_seq() {
		return detail_seq;
	}

	public void setDetail_seq(int detail_seq) {
		this.detail_seq = detail_seq;
	}

	public int getSeach_seq() {
		return seach_seq;
	}

	public void setSeach_seq(int seach_seq) {
		this.seach_seq = seach_seq;
	}

	public int getDetail_number() {
		return detail_number;
	}

	public void setDetail_number(int detail_number) {
		this.detail_number = detail_number;
	}

	public String getEstablishment() {
		return establishment;
	}

	public void setEstablishment(String establishment) {
		this.establishment = establishment;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHouse_number() {
		return house_number;
	}

	public void setHouse_number(String house_number) {
		this.house_number = house_number;
	}

	public String getParkinglot() {
		return parkinglot;
	}

	public void setParkinglot(String parkinglot) {
		this.parkinglot = parkinglot;
	}

	@Override
	public String toString() {
		return "Details [detail_seq=" + detail_seq + ", seach_seq=" + seach_seq + ", detail_number=" + detail_number
				+ ", establishment=" + establishment + ", approval=" + approval + ", address=" + address
				+ ", house_number=" + house_number + ", parkinglot=" + parkinglot + "]";
	}
	
	
	
}
