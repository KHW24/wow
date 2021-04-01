package com.kh.project.membership.service;

import com.kh.project.membership.vo.Mshipdata;
import com.kh.project.membership.vo.Payment;

public interface MembershipService {
	
	public Payment selectMemberShip(String id) throws Exception;
	
	public int deleteMemberShip(String id) throws Exception;
}
