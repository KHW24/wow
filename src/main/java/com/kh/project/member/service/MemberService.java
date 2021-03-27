package com.kh.project.member.service;

import java.util.List;

import com.kh.project.member.vo.Member;

public interface MemberService {

	public int insertMember(Member member) throws Exception;
	
	// 아이디찾기
	public Member findId(Member member) throws Exception;

	public int checkIdDup(String id) throws Exception;
	
	public int checkNiDup(String nickname) throws Exception;
	
	//이은지
	
	// 본인확인 -> 이메일 일치확인
	public String pwMatch(String id) throws Exception;
	
	// 회원정보 수정 ->닉네임중복체크													
	public int nicknameCheck(String nickname) throws Exception;
	
	//login
	public Member getMember(String id) throws Exception; 
	
	// 비밀번호 변경
 	public int updatePw(Member member) throws Exception;
	
}
