package com.java.kh.member.service;

import java.util.List;

import com.kh.project.member.vo.Member;

public interface MemberService {

	public int insertMember(Member member) throws Exception;
	
	public List<Member> selectMemberAll() throws Exception;
	
	public int updateMember(Member member) throws Exception;
	
	public int deleteMember(String userId) throws Exception;
	
}
