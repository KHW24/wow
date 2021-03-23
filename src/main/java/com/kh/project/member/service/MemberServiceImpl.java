package com.kh.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.member.dao.MemberDao;
import com.kh.project.member.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	// insert
	public int insertMember(Member member) throws Exception {
		int cnt = memberDao.insertMember(member);
		return cnt;
	}
	
	// 아이디 중복체크
	@Override
	public int checkIdDup(String id) throws Exception {
		int cnt= memberDao.checkIdDup(id);
		return cnt;
	}

	// 닉네임 중복체크
	@Override
	public int checkNiDup(String nickname) throws Exception {
		int cnt = memberDao.checkNiDup(nickname);
		return cnt;
	}
}
