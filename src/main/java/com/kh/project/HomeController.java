package com.kh.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.Member;


@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
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
	
//	//관리자페이지 - 멤버쉽
//	@RequestMapping(value = "membership.do", method = RequestMethod.GET)
//	public String membership(Locale locale, Model model) {
//		model.addAttribute("center","../admin/membership.jsp");
//		return "template/index";
//	}
	
	//관리자페이지 - 신고회원관리
	@RequestMapping(value = "report.do", method = RequestMethod.GET)
	public String report(Locale locale, Model model) {
		model.addAttribute("center","../admin/report.jsp");
		return "template/index";
	}
	
	//관리자페이지 - 게시글 관리
	@RequestMapping(value = "postmanage.do", method = RequestMethod.GET)
	public String postmanage(Locale locale, Model model) {
		model.addAttribute("center","../admin/postmanage.jsp");
		return "template/index";
	}
	
	//구매자 버전 게시물 보기 
	@RequestMapping(value="postBuyerView.do", method=RequestMethod.GET)
	public String postBuyerView(Model model) throws Exception{
		model.addAttribute("center","../board/post/buyerPostView.jsp");
		return "template/index";
	}
	
	/*
	 * //판매자 버전 게시물 보기
	 * 
	 * @RequestMapping(value="postSellerView.do", method=RequestMethod.GET) public
	 * String postSellerView(Model model) throws Exception{
	 * model.addAttribute("center","../board/post/sellerPostView.jsp"); return
	 * "template/index"; }
	 */
		
	/*
	 * //게시물 작성 페이지
	 * 
	 * @RequestMapping(value="postWrite.do", method=RequestMethod.GET) public String
	 * postWriteView(Model model) throws Exception{
	 * model.addAttribute("center","../board/post/salesPost.jsp"); return
	 * "template/index"; }
	 */
	
	/*
	 * //게시물 수정 페이지
	 * 
	 * @RequestMapping(value="postUpdate.do", method=RequestMethod.GET) public
	 * String postUpdateView(Model model) throws Exception{
	 * model.addAttribute("center","../board/post/salesPostUpdate.jsp"); return
	 * "template/index"; }
	 */
	
	//관심품목 페이지
	@RequestMapping(value="wishList.do", method=RequestMethod.GET)
	public String wishListView(Model model) throws Exception{
		model.addAttribute("center","../mypage/wishList.jsp");
		return "template/index";
	}
	
	/*
	 * //게시물 리스트 페이지
	 * 
	 * @RequestMapping(value="boardList.do", method=RequestMethod.GET) public String
	 * boardListView(Model model) throws Exception{
	 * model.addAttribute("center","../board/boardList.jsp"); return
	 * "template/index"; }
	 */
	
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
	
//	//마이 멤버십
//	@RequestMapping(value="myMship.do", method=RequestMethod.GET)
//	public String myMshipView(Model model) throws Exception{
//		model.addAttribute("center","../membership/myMembership.jsp");
//		return "template/index";
//	}
	
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
	
	//비밀번호 찾기
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
	
//	// 쪽지함
//	@RequestMapping(value="message.do", method=RequestMethod.GET)
//	public String messageView(Model model) throws Exception{
//		model.addAttribute("center", "../mypage/message.jsp");
//		return "template/index";
//	}
	
	
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
