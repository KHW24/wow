package com.kh.project.membership.vo;

import java.sql.Date;
import java.util.List;

public class Mshipdata {
	
	private int mshipSeq;
	private Date mshipStart;
	private String mshipYn;
	private Date mshipEnd; 
	private int mshipGrade;
	private String id;
	private List<Payment> payment;
	
	public int getMshipSeq() {
		return mshipSeq;
	}
	public void setMshipSeq(int mshipSeq) {
		this.mshipSeq = mshipSeq;
	}
	public Date getMshipStart() {
		return mshipStart;
	}
	public void setMshipStart(Date mshipStart) {
		this.mshipStart = mshipStart;
	}
	public String getMshipYn() {
		return mshipYn;
	}
	public void setMshipYn(String mshipYn) {
		this.mshipYn = mshipYn;
	}
	public Date getMshipEnd() {
		return mshipEnd;
	}
	public void setMshipEnd(Date mshipEnd) {
		this.mshipEnd = mshipEnd;
	}
	public int getMshipGrade() {
		return mshipGrade;
	}
	public void setMshipGrade(int mshipGrade) {
		this.mshipGrade = mshipGrade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	// 추가된 내용
	public void setMshipDate(Object mshipDate) {
		// TODO Auto-generated method stub
		
	}
	public void setMshipPrice(Object mshipPrice) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
