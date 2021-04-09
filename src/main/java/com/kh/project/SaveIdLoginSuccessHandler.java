package com.kh.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class SaveIdLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	static final String REQUEST_PARAM_NAME = "remember_id";
	static final String COOKIE_NAME = "saved_id";
	static final int DEFAULT_MAX_AGE= 60*60*24*7; //초단위
	
	private int maxAge = DEFAULT_MAX_AGE;
	
	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException{
		
		System.out.println("로그인하고 여기 옴.");
		String remember = request.getParameter(REQUEST_PARAM_NAME);
		if(remember!=null) {
			String id = ((UserDetails)authentication.getPrincipal()).getUsername();
			System.out.println(id);
			Cookie cookie = new Cookie(COOKIE_NAME, id);
			cookie.setMaxAge(maxAge);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie(COOKIE_NAME,"");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		super.onAuthenticationSuccess(request, response, authentication);
		
	}
}