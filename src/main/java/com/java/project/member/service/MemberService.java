package com.java.project.member.service;

import java.util.List;

import com.java.project.member.vo.Member;

public interface MemberService {

	public int insertMember(Member member) throws Exception;
	
	public List<Member> selectMemberAll() throws Exception;
	
	public int updateMember(Member member) throws Exception;
	
}
