package com.kh.project.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.project.LoginMember;
import com.kh.project.LoginMemberDetailsService;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.Member;
import com.kh.project.member.vo.NaverLogin;

@Controller
public class NaverLoginController {

private NaverLogin naverLogin;
	
	private String apiResult = null;
	
	@Autowired
	MemberService memberService;
	
	LoginMemberDetailsService loginMemberDService;
	
	@Autowired
	public void setLoginMemberDService(LoginMemberDetailsService loginMemberDService) {
		this.loginMemberDService = loginMemberDService;
	}

	@Autowired
	private void setNaverLogin(NaverLogin naverLogin) {
		this.naverLogin = naverLogin;
	}
	
	// 로그인 페이지
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String loginView(Model model, HttpSession session) throws Exception{
		
		String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		model.addAttribute("center","../login/login.jsp");
		return "template/index";
	}
	
	// 네이버 로그인 성공시 callback호출
	@RequestMapping(value="/logincallback", method= {RequestMethod.GET,RequestMethod.POST})
	public String callBack(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request) throws Exception{
		OAuth2AccessToken oauthToken;
		oauthToken = naverLogin.getAccessToken(session,code,state);
		
		//로그인 사용자 정보 읽어오기 
		// String형식의 json데이터
		apiResult = naverLogin.getUserProfile(oauthToken);
		
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		
		//2. String 형식인 apiResult를 json형태로 바꿈 
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject)obj;
		
		//3.데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");

		// 네이버에서 주는 고유 ID
		String naverId = (String) response_obj.get("id");
		// 네이버에서 설정된 사용자 이름
		String naverNickname = (String) response_obj.get("nickname");
		// 네이버에서 설정된 이메일
		String naverEmail = (String) response_obj.get("email");
		
		Member member = new Member();
		member.setId(naverId);
		member.setNickname(naverNickname);
		member.setEmail(naverEmail);
		
		//네이버 ID와 이웃의솜씨 저장된 ID 중복여부 체크
		int naverIdCheck = memberService.checkIdDup(naverId);
		
		
		
		// 중복되는 ID가 없을 경우 신규가입으로 아래 구문을 실행
		if (naverIdCheck == 0) {
				session.setAttribute("naverUser", member);
				model.addAttribute("center","../join/naverjoin.jsp");
				return "template/index";
		} else {
				LoginMember navervo = (LoginMember) loginMemberDService.loadUserByUsername(naverId);
				Authentication authentication = new UsernamePasswordAuthenticationToken(navervo, navervo.getPassword(),
						navervo.getAuthorities());
				SecurityContext securityContext = SecurityContextHolder.getContext();
				securityContext.setAuthentication(authentication);
				session = request.getSession(true);
				session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
				return "redirect:main.do";
		}
	}
}
