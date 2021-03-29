package com.kh.project.membership.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.membership.vo.Payment;

@Repository
public class PaymentDao {
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 내 멤버십 보기
	public Payment selectMemberShip(String id) throws Exception{
		Payment payment = sqlSession.selectOne("Payment.selectMemberShip", id);
		return payment;
	}

}
