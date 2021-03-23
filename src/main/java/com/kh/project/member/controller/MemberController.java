package com.kh.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	// 회원가입
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView insertMember(Member member, ModelAndView mv) throws Exception {
		
		int cnt = memberService.insertMember(member);
		
		mv.addObject("cnt", cnt);
		mv.setViewName("template/index");
		return mv;
	}
	
	// 회원정보 수정
	
	// 쪽지 팝업
		@RequestMapping(value="messagepopup.do", method=RequestMethod.GET)
		public ModelAndView messagePopup (Member member, ModelAndView mv) throws Exception {

			mv.setViewName("admin/messagepopup");
			return mv;
	}
		
	// 아이디 찾기
	@RequestMapping(value="findId.do", method=RequestMethod.POST)
	public ModelAndView findId(@ModelAttribute Member member, ModelAndView mv) throws Exception {

		try {	// 아이디 찾기 성공시(findIdMember 값이 있을때)
			Member findIdMember = memberService.findId(member);
			System.out.println("컨트롤러에서 id : "+findIdMember.getId());
			mv.addObject("findIdMember", findIdMember); 
			mv.addObject("center", "../login/idFindCon.jsp");
			mv.setViewName("template/index");
			mv.addObject("msg","아이디 찾기 성공");	// alert대신에 msg로 메세지 전달
		} catch(NullPointerException e) {	// 아이디 찾기 실패시(findIdMember.getId()가 널 값일때 )
			mv.addObject("msg","아이디 찾기 실패");	// alert대신에 msg로 메세지 전달
			mv.addObject("center", "../login/idFind.jsp");
			mv.setViewName("template/index");
		}
		return mv; 	
	}
	
}
