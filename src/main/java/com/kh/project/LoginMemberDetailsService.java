package com.kh.project;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.Member;

public class LoginMemberDetailsService implements UserDetailsService{

	private static final Logger logger = LoggerFactory.getLogger(LoginMemberDetailsService.class);
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		Member vo = new Member();
		try {
		 vo = memberService.getMember(id);
		 if(vo==null) {
			 throw new UsernameNotFoundException("사용자 정보가 없습니다.");
		 }
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo == null ? null : new LoginMember(vo);
	}

}
