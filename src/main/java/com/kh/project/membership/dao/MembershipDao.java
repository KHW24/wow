package com.kh.project.membership.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.membership.vo.Mshipdata;
import com.kh.project.membership.vo.Payment;

@Repository
public class MembershipDao {
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 내 멤버십 보기
	public Payment selectMemberShip(String id) throws Exception{
		Payment payment = sqlSession.selectOne("Membership.selectMemberShip", id);
		return payment;
	}
	
	// 결제취소요청
	public int deleteMemberShip(String id) throws Exception{
		int cnt = sqlSession.delete("Membership.deleteMemberShip", id);
		return cnt;
		
	}
}