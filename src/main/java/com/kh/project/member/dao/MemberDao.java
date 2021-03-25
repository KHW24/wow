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
	
	// select member
	public Member selectMember (String id) throws Exception {
		System.out.println("MemberDao- "+id);
		return sqlSession.selectOne("Member.selectMember", id);
	}
	
	// update member
	public int updateMember (Member member) throws Exception {
		return sqlSession.update("Member.updateMember", member);
	}
	
	// check nickname
	public int checkNickname(String nickname) throws Exception{
		return sqlSession.selectOne("Member.checkNickname",nickname);	
	}
	
	// delete member
	public int deleteMember (String id) throws Exception{
		return sqlSession.delete("Member.deleteMember",id);
	}
}
