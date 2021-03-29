package com.kh.project;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.Member;
import com.kh.project.member.vo.NaverLogin;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

@Controller
public class HomeController {
	
	
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
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//시작페이지(메인 첫페이지)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("main","main-request");
		return "template/index";
	}
	
	//메인페이지
		@RequestMapping(value = "main.do", method = RequestMethod.GET)
		public String main(Locale locale, Model model) {
			model.addAttribute("main","main-request");
			return "template/index";
		}

	//관리자페이지
	@RequestMapping(value = "report.do", method = RequestMethod.GET)
	public String report(Locale locale, Model model) {
		model.addAttribute("center","../admin/report.jsp");
		return "template/index";
	}
	
	//구매자 버전 게시물 보기 
	@RequestMapping(value="postBuyerView.do", method=RequestMethod.GET)
	public String postBuyerView(Model model) throws Exception{
		model.addAttribute("center","../board/post/buyerPostView.jsp");
		return "template/index";
	}
	
	//판매자 버전 게시물 보기 
		@RequestMapping(value="postSellerView.do", method=RequestMethod.GET)
		public String postSellerView(Model model) throws Exception{
			model.addAttribute("center","../board/post/sellerPostView.jsp");
			return "template/index";
		}
		
	//게시물 작성 페이지
	@RequestMapping(value="postWrite.do", method=RequestMethod.GET)
	public String postWriteView(Model model) throws Exception{
		model.addAttribute("center","../board/post/salesPost.jsp");
		return "template/index";
	}
	
	//게시물 수정 페이지
	@RequestMapping(value="postUpdate.do", method=RequestMethod.GET)
	public String postUpdateView(Model model) throws Exception{
		model.addAttribute("center","../board/post/salesPostUpdate.jsp");
		return "template/index";
	}
	
	
	//관심품목 페이지
	@RequestMapping(value="wishList.do", method=RequestMethod.GET)
	public String wishListView(Model model) throws Exception{
		model.addAttribute("center","../mypage/wishList.jsp");
		return "template/index";
	}
	
	//게시물 리스트 페이지
	@RequestMapping(value="boardList.do", method=RequestMethod.GET)
	public String boardListView(Model model) throws Exception{
		model.addAttribute("center","../board/boardList.jsp");
		return "template/index";
	}
	
	//판매자별 게시물 리스트 페이지
	@RequestMapping(value="otherList.do", method=RequestMethod.GET)
	public String otherListView(Model model) throws Exception{
		model.addAttribute("center","../board/otherList.jsp");
		return "template/index";
	}

	//내가 쓴 글 리스트
	@RequestMapping(value="myList.do", method=RequestMethod.GET)
	public String myListView(Model model) throws Exception{
		model.addAttribute("center","../mypage/myList.jsp");
		return "template/index";
	}
	
		//마이 페이지
		@RequestMapping(value="mypage.do", method=RequestMethod.GET)
		public String myPageView(Model model) throws Exception{
			model.addAttribute("center","../mypage/mypage.jsp");
			return "template/index";
		}
		
		//마이 멤버십
		@RequestMapping(value="myMship.do", method=RequestMethod.GET)
		public String myMshipView(Model model) throws Exception{
			model.addAttribute("center","../membership/myMembership.jsp");
			return "template/index";
		}
		
		//멤버십 결제 페이지
		@RequestMapping(value="mshippay.do", method=RequestMethod.GET)
		public String mshipPayView(Model model) throws Exception{
			model.addAttribute("center","../membership/membershipPay.jsp");
			return "template/index";
		}

		//멤버십 결제 선택
		@RequestMapping(value="mshipSelect.do", method=RequestMethod.GET)
		public String mshipSelectView(Model model) throws Exception{
			model.addAttribute("center","../membership/membershipSelect.jsp");
			return "template/index";
		}
				
		//멤버십 결제완료
		@RequestMapping(value="paySuccess.do", method=RequestMethod.GET)
		public String paySuccessView(Model model) throws Exception{
			model.addAttribute("center","../membership/membershipPayComplete.jsp");
			return "template/index";
		}
		
		//멤버십 결제취소
		@RequestMapping(value="payCancle.do", method=RequestMethod.GET)
		public String payCancleView(Model model) throws Exception{
			model.addAttribute("center","../membership/membershipPayCancel.jsp");
			return "template/index";
		}
		
		//멤버십 결제취소완료
		@RequestMapping(value="payCancleSuccess.do", method=RequestMethod.GET)
		public String payCancleSuccessView(Model model) throws Exception{
			model.addAttribute("center","../membership/membershipPayCancelComplete.jsp");
			return "template/index";
		}
		
		//비민번호 찾기
		@RequestMapping(value="pwFind.do", method=RequestMethod.GET)
		public String pwFindView(Model model) throws Exception{
			model.addAttribute("center","../login/pwFind.jsp");
			return "template/index";
		}
		
		//비밀번호 변경
		@RequestMapping(value="pwUpt.do", method=RequestMethod.GET)
		public String pwUptView(Model model) throws Exception{
			model.addAttribute("center","../login/pwFindUpt.jsp");
			return "template/index";
		}
		
		// 로그인 페이지
		@RequestMapping(value="login.do", method=RequestMethod.GET)
		public String loginView(Model model, HttpSession session) throws Exception{
			
			String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
			logger.info("네이버 : " + naverAuthUrl);
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
			
			//중복 아이디 존재시
			Map<String, Object> memberMap = new HashMap<>();
			memberMap.put("id", naverId);
			memberMap.put("nickname", naverNickname);
			memberMap.put("email", naverEmail);
			memberMap = response_obj;
			
			System.out.println("멤버맵 출력" + memberMap);
			
			String userId = (String) memberMap.get("id");
			
			// 중복되는 ID가 없을 경우 신규가입으로 아래 구문을 실행
			if (naverIdCheck == 0) {
					session.setAttribute("naverUser", member);
					model.addAttribute("center","../join/join.jsp");
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
		
		// 아이디 찾기
		@RequestMapping(value="idFind.do", method=RequestMethod.GET)
		public String idFindView(Model model) throws Exception{
			model.addAttribute("center","../login/idFind.jsp");
			return "template/index";
		}
	
		// 회원가입
		@RequestMapping(value="join.do", method=RequestMethod.GET)
		public String joinView(Model model) throws Exception{
			model.addAttribute("center","../join/join.jsp");
			return "template/index";
		}
		
		// 내 정보 수정
		@RequestMapping(value="myInfoUp.do", method=RequestMethod.GET)
		public String myInfoUpView(Model model) throws Exception{
			model.addAttribute("center", "../mypage/myInfoUp.jsp");
			return "template/index";
		}
		
		// 본인 확인
		@RequestMapping(value="myInfoCon.do", method=RequestMethod.GET)
		public String myInfoConView(Model model) throws Exception{
			model.addAttribute("center", "../mypage/myinfoCon.jsp");
			return "template/index";
		}
		
		// 내 댓글 보기
		@RequestMapping(value="myComment.do", method=RequestMethod.GET)
		public String myCommentView(Model model) throws Exception{
			model.addAttribute("center", "../mypage/myComment.jsp");
			return "template/index";
		}
		
		// 쪽지함
		@RequestMapping(value="message.do", method=RequestMethod.GET)
		public String messageView(Model model) throws Exception{
			model.addAttribute("center", "../mypage/message.jsp");
			return "template/index";
		}
		
		// 관리자페이지-멤버십관리
		@RequestMapping(value="admembership.do", method=RequestMethod.GET)
		public String admembership(Model model) throws Exception{
			model.addAttribute("center", "../admin/membership.jsp");
			return "template/index";
		}
		
		// 아이디 확인 
		@RequestMapping(value="idFindCon.do", method=RequestMethod.GET)
		public String idFindConView(Model model) throws Exception{
			model.addAttribute("center", "../login/idFindCon.jsp");
			return "template/index";
		}
		
		// 에러페이지
		@RequestMapping(value="accessError", method=RequestMethod.GET)
		public String errorPageView(Authentication auth) throws Exception{
			logger.info("access Denied : "+auth);
			return "accessError";
		}
				
}
