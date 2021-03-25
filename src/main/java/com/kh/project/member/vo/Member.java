package com.kh.project.member.vo;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Member implements UserDetails{

	private String id;
	private String nickname;
	private String password;
	private String email;
	private String postCode;
	private String roadAddress;
	private String detailAddress;
	private int alert_cnt;
	private int enabled;
	private List<MemberAuth> authList;
	
	public Member() {}
	
	public Member(String id, String nickname, String password, String email, String postCode, String roadAddress,
			String detailAddress, int alert_cnt, int enabled, List<MemberAuth> authList) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.postCode = postCode;
		this.roadAddress = roadAddress;
		this.detailAddress = detailAddress;
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
				+ ", postCode=" + postCode + ", roadAddress=" + roadAddress + ", detailAddress=" + detailAddress
				+ ", alert_cnt=" + alert_cnt + ", enabled=" + enabled + ", authList=" + authList + "]";
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
	
	
	

	
	
}
