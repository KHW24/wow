package com.kh.project;

import java.util.ArrayList;
import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.kh.project.member.dao.MemberDao;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.Member;
import com.kh.project.member.vo.MemberAuth;

@Service
public class CustomUserDetailsService implements UserDetailsService{

	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);
	
	@Autowired
	private MemberService memberService;
	
	
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		Member vo = new Member();
		try {
			System.out.println("userName: "+id);
			
		 vo = memberService.getMember(id);
//		 if(vo==null) {
//			 throw new UsernameNotFoundException("사용자 정보가 없습니다.");
//		 }
		 System.out.println("문제후");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
//		Collection<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
//		roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
//		vo.setPassword("$2a$10$NFTutDa0/1KC/9hDBZIXnusr03T1g4AW2vf1IH8zhIqRVWTyOD6pS");
//		vo.setId("admin");
//		MemberAuth auth = new MemberAuth();
//		auth.setAuth("ROLE_ADMIN");
//		ArrayList authList = new ArrayList();
//		authList.add(auth);
//		vo.setAuthList(authList);
		System.out.println("detailsservice옴"+vo);
		return vo == null ? null : new CustomUser(vo);
	}

}
