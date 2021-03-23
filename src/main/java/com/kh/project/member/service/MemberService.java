package com.kh.project.member.service;

import java.util.List;

import com.kh.project.member.vo.Member;

public interface MemberService {

	public int insertMember(Member member) throws Exception;
	
	// 아이디찾기
	public Member findId(Member member) throws Exception;

	public int checkIdDup(String id) throws Exception;
	
	public int checkNiDup(String nickname) throws Exception;
	
}
