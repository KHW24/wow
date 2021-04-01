package com.kh.project.admin.vo;

import java.util.Date;
import java.util.List;

public class Admin {
	
	private int mshipSeq;
	private Date mshipStart;
	private Date mshipEnd;
	private char mshipYn;
	private int mshipGrade;
	private String id;
	
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
	public Date getMshipEnd() {
		return mshipEnd;
	}
	public void setMshipEnd(Date mshipEnd) {
		this.mshipEnd = mshipEnd;
	}
	public char getMshipYn() {
		return mshipYn;
	}
	public void setMshipYn(char mshipYn) {
		this.mshipYn = mshipYn;
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
	
	@Override
	public String toString() {
		return "Admin [mshipSeq=" + mshipSeq + ", mshipStart=" + mshipStart + ", mshipEnd=" + mshipEnd + ", mshipYn="
				+ mshipYn + ", mshipGrade=" + mshipGrade + ", id=" + id + "]";
	}
	
}