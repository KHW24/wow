package com.kh.project;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.kh.project.member.vo.Member;

@Repository
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

		Member member = sqlSession.selectOne("Member.readLogin",id);
		return member == null ? null : new CustomUser(member);
	}

	

	
	

}
