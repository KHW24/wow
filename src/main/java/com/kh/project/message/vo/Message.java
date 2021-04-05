package com.kh.project.message.vo;

import java.sql.Date;

public class Message {

	private String msg_seq;
	private String id;
	private String msg_contents;
	private Date msg_date;
	private String get_id;
	/**
	 * @return the msg_seq
	 */
	public String getMsg_seq() {
		return msg_seq;
	}
	/**
	 * @param msg_seq the msg_seq to set
	 */
	public void setMsg_seq(String msg_seq) {
		this.msg_seq = msg_seq;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the msg_contents
	 */
	public String getMsg_contents() {
		return msg_contents;
	}
	/**
	 * @param msg_contents the msg_contents to set
	 */
	public void setMsg_contents(String msg_contents) {
		this.msg_contents = msg_contents;
	}
	/**
	 * @return the msg_date
	 */
	public Date getMsg_date() {
		return msg_date;
	}
	/**
	 * @param msg_date the msg_date to set
	 */
	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}
	/**
	 * @return the get_id
	 */
	public String getGet_id() {
		return get_id;
	}
	/**
	 * @param get_id the get_id to set
	 */
	public void setGet_id(String get_id) {
		this.get_id = get_id;
	}
	
	
}
