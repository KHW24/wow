package com.java.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.member.dao.MemberDAO;
import com.java.project.member.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	// insert
	public int insertMember(Member member) throws Exception {
		int cnt = memberDAO.insertMember(member);
		return cnt;
	}
	
}
