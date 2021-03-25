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
	
	//이은지

	// 나의 회원정보
	public Member selectMember(String id) throws Exception {
		return memberDao.selectMember(id);
	}
	
	//회원 정보 수정
	public int updateMember(Member member) throws Exception{
		return memberDao.updateMember(member);
	}
	
	//회원정보 수정 -> 닉네임중복체크													
	public int nicknameCheck(String nickname) throws Exception{
		return memberDao.checkNickname(nickname);
	}
	
	// 회원탈퇴
	public int deleteMember(String id) throws Exception{
		return memberDao.deleteMember(id);
	}
}
