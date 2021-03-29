package com.kh.project.mshipdata.vo;

public class Mshipdata {
	
	private int mship_seq;
	private String mship_start;
	private String mship_yn;
	private String mship_end; 
	private int mship_grade;
	private String ID;
	
	public int getMship_seq() {
		return mship_seq;
	}
	public void setMship_seq(int mship_seq) {
		this.mship_seq = mship_seq;
	}
	public String getMship_start() {
		return mship_start;
	}
	public void setMship_start(String mship_start) {
		this.mship_start = mship_start;
	}
	public String getMship_yn() {
		return mship_yn;
	}
	public void setMship_yn(String mship_yn) {
		this.mship_yn = mship_yn;
	}
	public String getMship_end() {
		return mship_end;
	}
	public void setMship_end(String mship_end) {
		this.mship_end = mship_end;
	}
	public int getMship_grade() {
		return mship_grade;
	}
	public void setMship_grade(int mship_grade) {
		this.mship_grade = mship_grade;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	
	@Override
	public String toString() {
		return "Mshipdata [mship_seq=" + mship_seq + ", mship_start=" + mship_start + ", mship_yn=" + mship_yn
				+ ", mship_end=" + mship_end + ", mship_grade=" + mship_grade + ", ID=" + ID + "]";
	}
	
	
	
	
}
