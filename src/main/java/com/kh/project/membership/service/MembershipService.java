package com.kh.project.membership.service;

import com.kh.project.membership.vo.Payment;

public interface MembershipService {
	
	public Payment selectMemberShip(String id) throws Exception;
}

