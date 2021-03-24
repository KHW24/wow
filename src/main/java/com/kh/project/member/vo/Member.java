package com.kh.project.member.vo;

public class Member {

	private String id;
	private String nickname;
	private String password;
	private String email;
	private String postCode;
	private String roadAddress;
	private String detailAddress;
	private int alert_cnt;
	private int isAdmin;
	
	public Member(String id, String nickname, String password, String email, String postCode, String roadAddress,
			String detailAddress, int alert_cnt, int isAdmin) {
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.postCode = postCode;
		this.roadAddress = roadAddress;
		this.detailAddress = detailAddress;
		this.alert_cnt = alert_cnt;
		this.isAdmin = isAdmin;
	}
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public int getAlert_cnt() {
		return alert_cnt;
	}
	public void setAlert_cnt(int alert_cnt) {
		this.alert_cnt = alert_cnt;
	}
	public  int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

}
