package com.kh.project.message.vo;

import java.sql.Date;

public class Message {

	private int msg_seq;	// 쪽지번호
	private String id;	// 보낸 아이디
	private String msg_contents;	// 쪽지내용
	private Date msg_date;	// 쪽지 온 날짜
	private String get_id;	// 본인 아이디

	public int getMsg_seq() {
		return msg_seq;
	}

	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMsg_contents() {
		return msg_contents;
	}

	public void setMsg_contents(String msg_contents) {
		this.msg_contents = msg_contents;
	}

	public Date getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}

	public String getGet_id() {
		return get_id;
	}

	public void setGet_id(String get_id) {
		this.get_id = get_id;
	}
	
}
