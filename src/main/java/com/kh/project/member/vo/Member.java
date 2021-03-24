package com.kh.project.member.vo;

import java.util.List;

public class Member {

	private String id;
	private String nickname;
	private String password;
	private String email;
	private String address;
	private int alert_cnt;
	private int enabled;
	private List<MemberAuth> authList;
	
	public Member(String id, String nickname, String password, String email, String address, int alert_cnt, int enabled,
			List<MemberAuth> authList) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.address = address;
		this.alert_cnt = alert_cnt;
		this.enabled = enabled;
		this.authList = authList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAlert_cnt() {
		return alert_cnt;
	}
	public void setAlert_cnt(int alert_cnt) {
		this.alert_cnt = alert_cnt;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public List<MemberAuth> getAuthList() {
		return authList;
	}
	public void setAuthList(List<MemberAuth> authList) {
		this.authList = authList;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", nickname=" + nickname + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", alert_cnt=" + alert_cnt + ", enabled=" + enabled + ", authList="
				+ authList + "]";
	}

	
	
}
