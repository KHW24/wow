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
	
}
