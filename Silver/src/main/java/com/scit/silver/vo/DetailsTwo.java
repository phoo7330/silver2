package com.scit.silver.vo;


public class DetailsTwo {
	//silverSearch 테이블 과 Deatils 테이블 검색을 위한 VO
	
	private int seach_seq;//시퀀스
	private int type;//회원종류
	private String areaa;//지역 ex(서울특별시)
	private String areab;//지역ex(강남구) 
	private String areac;//지역ex(청담동)
	private String silvername;//시설이름
	private String service;//시설이 뭘하나 결정하는 컬럼
	private String grade;//등급
	private String lauitude;//위도
	private String longitude;//경도
	
	private int detail_seq;//시퀀스
	private long detail_number;//기관일련번호
	private String establishment;//설립일
	private String approval;
	private String address;
	private String house_number;
	private String parkinglot;
	public DetailsTwo() {
		super();
	}
	public DetailsTwo(int seach_seq, int type, String areaa, String areab, String areac, String silvername,
			String service, String grade, String lauitude, String longitude, int detail_seq, long detail_number,
			String establishment, String approval, String address, String house_number, String parkinglot) {
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
		this.detail_seq = detail_seq;
		this.detail_number = detail_number;
		this.establishment = establishment;
		this.approval = approval;
		this.address = address;
		this.house_number = house_number;
		this.parkinglot = parkinglot;
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
	public int getDetail_seq() {
		return detail_seq;
	}
	public void setDetail_seq(int detail_seq) {
		this.detail_seq = detail_seq;
	}
	public long getDetail_number() {
		return detail_number;
	}
	public void setDetail_number(long detail_number) {
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
		return "DetailsTwo [seach_seq=" + seach_seq + ", type=" + type + ", areaa=" + areaa + ", areab=" + areab
				+ ", areac=" + areac + ", silvername=" + silvername + ", service=" + service + ", grade=" + grade
				+ ", lauitude=" + lauitude + ", longitude=" + longitude + ", detail_seq=" + detail_seq
				+ ", detail_number=" + detail_number + ", establishment=" + establishment + ", approval=" + approval
				+ ", address=" + address + ", house_number=" + house_number + ", parkinglot=" + parkinglot + "]";
	}
	
	
}
