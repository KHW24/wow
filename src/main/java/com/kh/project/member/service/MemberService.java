package com.kh.project.member.service;

import java.util.List;

import com.kh.project.member.vo.Member;

public interface MemberService {

	public int insertMember(Member member) throws Exception;
	
	//이은지
	// 나의 회원정보
	public Member selectMember(String id) throws Exception;

	// 회원정보 수정
	public int updateMember(Member member) throws Exception;
	
	// 회원정보 수정 -> 닉네임중복체크													
	public int nicknameCheck(String nickname) throws Exception;
	
	
	
}
