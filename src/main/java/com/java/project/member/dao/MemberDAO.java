package com.java.project.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.project.member.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// insert
	public int insertMember(Member member) throws Exception {
		int cnt = sqlSession.insert("Member.insertMember", member);
		return cnt;
	}
	
	// select
	public List<Member> selectMemberAll() throws Exception {
		List<Member> memberList =sqlSession.selectList("Member.selectMemberAll"); 
		return memberList;
	}
	
	
	
}
