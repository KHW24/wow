package com.kh.project.member.dao;

import java.util.List;

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
	
	// select
	public List<Member> selectMemberAll() throws Exception {
		List<Member> memberList =sqlSession.selectList("Member.selectMemberAll"); 
		return memberList;
	}
	
	// update
	public int updateMember(Member member) throws Exception{
		int cnt = sqlSession.update("Member.updateMember",member);
		return cnt;
	}
	
	//delete
	public int deleteMember(String userId) throws Exception{
		int cnt = sqlSession.delete("Member.deleteMember", userId);
		return cnt;
	}
}
