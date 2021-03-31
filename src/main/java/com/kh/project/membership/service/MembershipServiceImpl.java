package com.kh.project.membership.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.membership.dao.MembershipDao;
import com.kh.project.membership.vo.Payment;
	
	@Service
	public class MembershipServiceImpl implements MembershipService {

		@Autowired
		MembershipDao membershipDao;
		
		@Override
		public Payment selectMemberShip(String id) throws Exception {
			Payment payment = membershipDao.selectMemberShip(id);
			return payment;
		}

}
