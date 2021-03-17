package com.java.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//시작페이지(메인 첫페이지)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
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
	
	@RequestMapping(value="wishList.do", method=RequestMethod.GET)
	public String wishListView(Model model) throws Exception{
		model.addAttribute("center","../mypage/wishList.jsp");
		return "template/index";
	}
	
	@RequestMapping(value="boardList.do", method=RequestMethod.GET)
	public String boardListView(Model model) throws Exception{
		model.addAttribute("center","../board/boardList.jsp");
		return "template/index";
	}
	
	@RequestMapping(value="otherList.do", method=RequestMethod.GET)
	public String otherListView(Model model) throws Exception{
		model.addAttribute("center","../board/otherList.jsp");
		return "template/index";
	}

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
	
	
	
}
