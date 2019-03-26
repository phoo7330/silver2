package com.scit.silver.vo;


public class Information_Detail {

	private int information_seq;
	private int treatment;
	private int higher;
	private int general;
	
	
	public Information_Detail(int information_seq, int treatment, int higher, int general) {
		super();
		this.information_seq = information_seq;
		this.treatment = treatment;
		this.higher = higher;
		this.general = general;
	}

	public Information_Detail() {
		super();
	}

	public int getInformation_seq() {
		return information_seq;
	}

	public void setInformation_seq(int information_seq) {
		this.information_seq = information_seq;
	}

	public int getTreatment() {
		return treatment;
	}

	public void setTreatment(int treatment) {
		this.treatment = treatment;
	}

	public int getHigher() {
		return higher;
	}

	public void setHigher(int higher) {
		this.higher = higher;
	}

	public int getGeneral() {
		return general;
	}

	public void setGeneral(int general) {
		this.general = general;
	}

	@Override
	public String toString() {
		return "Information_Detail [information_seq=" + information_seq + ", treatment=" + treatment + ", higher="
				+ higher + ", general=" + general + "]";
	}
	
	
}
