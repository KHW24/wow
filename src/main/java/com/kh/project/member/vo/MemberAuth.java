package com.kh.project.member.vo;


public class MemberAuth {
	
	private String id;
	private String auth;
	
	public MemberAuth() {}
	
	public MemberAuth(String id, String auth) {
		super();
		this.id = id;
		this.auth = auth;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberAuth [id=" + id + ", auth=" + auth + "]";
	}
	
	
}
