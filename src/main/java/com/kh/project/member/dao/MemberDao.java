package com.kh.project.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.member.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// insert
	public int insertMember(Member member) throws Exception {
		int cnt = sqlSession.insert("Member.insertMember", member);
		return cnt;
	}
	
	// 아이디 찾기
	public Member findId(Member member) throws Exception {
		Member findIdMember = sqlSession.selectOne("Member.findId", member);
		return findIdMember;
	}
	
	// id 중복체크
	public int checkIdDup(String id) throws Exception {
		int cnt = sqlSession.selectOne("Member.checkIdDup", id);
		return cnt;
	}
	
	// 닉네임 중복체크
	public int checkNiDup(String nickname) throws Exception {
		int cnt = sqlSession.selectOne("Member.checkNiDup", nickname);
		return cnt;
	}
	
	// check nickname
	public int checkNickname(String nickname) throws Exception{
		return sqlSession.selectOne("Member.checkNickname",nickname);	
	}
}
