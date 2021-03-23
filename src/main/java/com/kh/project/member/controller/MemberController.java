package com.kh.project.member.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	// 쪽지 팝업
	@RequestMapping(value="messagepopup.do", method=RequestMethod.GET)
	public ModelAndView messagePopup (Member member, ModelAndView mv) throws Exception {

		mv.setViewName("admin/messagepopup");
		return mv;
	}
		
	// 이은지
	// 회원정보 수정
		
	// 회원정보 수정 - >닉네임 중복체크
	@ResponseBody //응답
	@RequestMapping(value="nickCheck.do", method=RequestMethod.POST)
	public String nickCheck(@RequestBody String paramData) throws Exception {
		String nickname = paramData.trim();
		System.out.println(nickname);
		
		int cnt = memberService.nicknameCheck(nickname);
		System.out.println(cnt);
		
		return cnt+"";
	}
	
	// 회원정보 수정-> 이메일인증
	
	
	
}
