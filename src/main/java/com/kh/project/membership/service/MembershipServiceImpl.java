package com.kh.project.membership.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.membership.dao.MembershipDao;
import com.kh.project.membership.vo.Mshipdata;
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

		// 결제취소요청
		@Override
		public int deleteMemberShip(String id) throws Exception {
			int cnt = membershipDao.deleteMemberShip(id);
			return cnt;
		}

		// 결제정보넣기 -1
		@Override
		public int insertMshipdata(Mshipdata mshipdata) throws Exception {
			int cnt = membershipDao.insertMshipdata(mshipdata);
			return cnt;
		}

		// 결제정보넣기 -2
		@Override
		public int insertPayment(Payment payment) throws Exception {
			int cnt = membershipDao.insertPayment(payment);
			return cnt;
		}

}
