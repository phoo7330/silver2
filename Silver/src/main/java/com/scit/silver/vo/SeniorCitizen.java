package com.scit.silver.vo;

public class SeniorCitizen {
	
	private int sc_seq;
	private String userid;
	private String sc_birthday;
	private String sc_name;
	private String sc_addressa;
	private String sc_addressb;
	private String sc_addressc;
	private String sc_religion;
	private String sc_bloodtype;
	private String sc_housing;
	private String sc_supply;
	
	public SeniorCitizen(int sc_seq, String userid, String sc_birthday, String sc_name, String sc_addressa,
			String sc_addressb, String sc_addressc, String sc_religion, String sc_bloodtype, String sc_housing,
			String sc_supply) {
		super();
		this.sc_seq = sc_seq;
		this.userid = userid;
		this.sc_birthday = sc_birthday;
		this.sc_name = sc_name;
		this.sc_addressa = sc_addressa;
		this.sc_addressb = sc_addressb;
		this.sc_addressc = sc_addressc;
		this.sc_religion = sc_religion;
		this.sc_bloodtype = sc_bloodtype;
		this.sc_housing = sc_housing;
		this.sc_supply = sc_supply;
	}

	public SeniorCitizen() {
		super();
	}

	public int getSc_seq() {
		return sc_seq;
	}

	public void setSc_seq(int sc_seq) {
		this.sc_seq = sc_seq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSc_birthday() {
		return sc_birthday;
	}

	public void setSc_birthday(String sc_birthday) {
		this.sc_birthday = sc_birthday;
	}

	public String getSc_name() {
		return sc_name;
	}

	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}

	public String getSc_addressa() {
		return sc_addressa;
	}

	public void setSc_addressa(String sc_addressa) {
		this.sc_addressa = sc_addressa;
	}

	public String getSc_addressb() {
		return sc_addressb;
	}

	public void setSc_addressb(String sc_addressb) {
		this.sc_addressb = sc_addressb;
	}

	public String getSc_addressc() {
		return sc_addressc;
	}

	public void setSc_addressc(String sc_addressc) {
		this.sc_addressc = sc_addressc;
	}

	public String getSc_religion() {
		return sc_religion;
	}

	public void setSc_religion(String sc_religion) {
		this.sc_religion = sc_religion;
	}

	public String getSc_bloodtype() {
		return sc_bloodtype;
	}

	public void setSc_bloodtype(String sc_bloodtype) {
		this.sc_bloodtype = sc_bloodtype;
	}

	public String getSc_housing() {
		return sc_housing;
	}

	public void setSc_housing(String sc_housing) {
		this.sc_housing = sc_housing;
	}

	public String getSc_supply() {
		return sc_supply;
	}

	public void setSc_supply(String sc_supply) {
		this.sc_supply = sc_supply;
	}

	@Override
	public String toString() {
		return "SeniorCitizen [sc_seq=" + sc_seq + ", userid=" + userid + ", sc_birthday=" + sc_birthday + ", sc_name="
				+ sc_name + ", sc_addressa=" + sc_addressa + ", sc_addressb=" + sc_addressb + ", sc_addressc="
				+ sc_addressc + ", sc_religion=" + sc_religion + ", sc_bloodtype=" + sc_bloodtype + ", sc_housing="
				+ sc_housing + ", sc_supply=" + sc_supply + "]";
	}

	
	
}
