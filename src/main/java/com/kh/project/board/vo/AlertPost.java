package com.kh.project.board.vo;

import java.util.List;

import com.kh.project.member.vo.Member;

public class AlertPost {

	private int alertSeq;
	private String alertContents;
	private int postNo;
	private List<Board> post;
	private String id;
	
	public AlertPost() {}

	public int getAlertSeq() {
		return alertSeq;
	}

	public void setAlertSeq(int alertSeq) {
		this.alertSeq = alertSeq;
	}

	public String getAlertContents() {
		return alertContents;
	}

	public void setAlertContents(String alertContents) {
		this.alertContents = alertContents;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public List<Board> getPost() {
		return post;
	}

	public void setPost(List<Board> post) {
		this.post = post;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "AlertPost [alertSeq=" + alertSeq + ", alertContents=" + alertContents + ", postNo=" + postNo + ", post="
				+ post + ", id=" + id + "]";
	}

	
	
	
	
	
}
