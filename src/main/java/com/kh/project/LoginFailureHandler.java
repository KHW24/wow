package com.kh.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

public class LoginFailureHandler implements AuthenticationFailureHandler{

	private String loginId;
	private String loginPwd;
	private String errorMsg;
	private String defaultFailureUrl = "/login.do?error";
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String loginId = request.getParameter("loginId");
		String loginPwd = request.getParameter("loginPwd");
		String errorMsg = null;
		System.out.println("실패 핸들러옴");
		
		if(exception instanceof BadCredentialsException) {
			errorMsg = "아이디 또는 비밀번호가 맞지 않습니다.";
		}
			
		
		request.setAttribute("loginId", loginId);
		request.setAttribute("loginPwd", loginPwd);
		request.setAttribute("errorMsg", errorMsg);
		
		request.getRequestDispatcher("/login.do").forward(request, response);
		
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
	
	

}
