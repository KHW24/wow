package com.kh.project.member.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView insertMember(Member member, ModelAndView mv) throws Exception {
			
		int cnt = memberService.insertMember(member);
			
		mv.addObject("cnt", cnt);
		mv.setViewName("redirect:login.do");
		return mv;
	}
	
	// id 중복체크
	@ResponseBody
	@RequestMapping(value="checkIdDup.do", method=RequestMethod.POST)
	public String checkIdDup(String id) throws Exception {
			
		System.out.println(id);
		int cnt = memberService.checkIdDup(id);
		System.out.println(cnt);
			
		JSONObject obj = new JSONObject();
		obj.put("result", cnt);
			
		return obj.toJSONString();
	}
		
		// 닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="checkNiDup.do", method=RequestMethod.POST)
	public String checkNiDup(String nickname) throws Exception {
				
		System.out.println(nickname);
		int cnt = memberService.checkNiDup(nickname);
		System.out.println(cnt);
				
		JSONObject obj = new JSONObject();
		obj.put("result", cnt);
				
		return obj.toJSONString();
	}

	// 회원정보 수정
	
	// 쪽지 팝업
		@RequestMapping(value="messagepopup.do", method=RequestMethod.GET)
		public ModelAndView messagePopup (Member member, ModelAndView mv) throws Exception {

			mv.setViewName("admin/messagepopup");
			return mv;
	}
}
