package com.kh.project.admin.vo;

import java.util.Date;

public class AdminBm {
	

	private char post_title;
	private int post_price;
	private char post_contents;
	private char post_address;
	private char post_yn;
	private Date post_date;
	private char post_tags;
	private char id;
	private int hit;
	private char post_code;

	public char getPost_title() {
		return post_title;
	}
	public void setPost_title(char post_title) {
		this.post_title = post_title;
	}
	public int getPost_price() {
		return post_price;
	}
	public void setPost_price(int post_price) {
		this.post_price = post_price;
	}
	public char getPost_contents() {
		return post_contents;
	}
	public void setPost_contents(char post_contents) {
		this.post_contents = post_contents;
	}
	public char getPost_address() {
		return post_address;
	}
	public void setPost_address(char post_address) {
		this.post_address = post_address;
	}
	public char getPost_yn() {
		return post_yn;
	}
	public void setPost_yn(char post_yn) {
		this.post_yn = post_yn;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public char getPost_tags() {
		return post_tags;
	}
	public void setPost_tags(char post_tags) {
		this.post_tags = post_tags;
	}
	public char getId() {
		return id;
	}
	public void setId(char id) {
		this.id = id;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public char getPost_code() {
		return post_code;
	}
	public void setPost_code(char post_code) {
		this.post_code = post_code;
	}
	@Override
	public String toString() {
		return "AdminBm [post_title=" + post_title + ", post_price=" + post_price + ", post_contents=" + post_contents
				+ ", post_address=" + post_address + ", post_yn=" + post_yn + ", post_date=" + post_date
				+ ", post_tags=" + post_tags + ", id=" + id + ", hit=" + hit + ", post_code=" + post_code + "]";
	}

	
	
	
	
	
}