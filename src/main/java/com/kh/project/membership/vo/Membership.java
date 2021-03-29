package com.kh.project.membership.vo;

public class Membership {
	
	private int mship_grade;
	private String mship_date;
	private int mship_price;
	public int getMship_grade() {
		return mship_grade;
	}
	public void setMship_grade(int mship_grade) {
		this.mship_grade = mship_grade;
	}
	public String getMship_date() {
		return mship_date;
	}
	public void setMship_date(String mship_date) {
		this.mship_date = mship_date;
	}
	public int getMship_price() {
		return mship_price;
	}
	public void setMship_price(int mship_price) {
		this.mship_price = mship_price;
	}
	
	@Override
	public String toString() {
		return "Membership [mship_grade=" + mship_grade + ", mship_date=" + mship_date + ", mship_price=" + mship_price
				+ "]";
	}	

}
