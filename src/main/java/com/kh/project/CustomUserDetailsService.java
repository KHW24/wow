package com.kh.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.project.member.dao.MemberDao;
import com.kh.project.member.vo.Member;

public class CustomUserDetailsService implements UserDetailsService{

	
	MemberMapper memberMapper;
	
	@Autowired
	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}


	@Override
	public Member loadUserByUsername(String id) throws UsernameNotFoundException {
//		Member member = null;
//		try {
//			member = memberDao.getMember(id);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		Member member = new Member();
//		
//		System.out.println("detailsservice옴");
//		try {
//			member = memberDao.getMember(username);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		Member member = memberMapper.readLogin(id);
		return member == null ? null : member;
	}

}
