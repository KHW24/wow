package com.kh.project.member.controller;

import java.util.Random;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView insertMember(Member member, ModelAndView mv) throws Exception {
		
		int cnt = memberService.insertMember(member);
		
		mv.addObject("cnt", cnt);
		mv.setViewName("template/index");
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
	
	
	// 쪽지 팝업
	@RequestMapping(value="messagepopup.do", method=RequestMethod.GET)
	public ModelAndView messagePopup (Member member, ModelAndView mv) throws Exception {

		mv.setViewName("admin/messagepopup");
		return mv;
	}

	
	 // 아이디 찾기!!
	 @RequestMapping(value="findId.do", method=RequestMethod.POST)
	 public ModelAndView findId(@ModelAttribute Member member, ModelAndView mv) throws Exception {

	      try {   // 아이디 찾기 성공시(findIdMember 값이 있을때)
	         Member findIdMember = memberService.findId(member);
	         System.out.println("컨트롤러에서 id : "+findIdMember.getId());
	         mv.addObject("findIdMember", findIdMember); 
	         mv.addObject("center", "../login/idFindCon.jsp");
	         mv.setViewName("template/index");
	         mv.addObject("msg","아이디 찾기 성공");   // alert대신에 msg로 메세지 전달
	      } catch(NullPointerException e) {   // 아이디 찾기 실패시(findIdMember.getId()가 널 값일때 )
	         mv.addObject("msg","아이디 찾기 실패");   // alert대신에 msg로 메세지 전달
	         mv.addObject("center", "../login/idFind.jsp");
	         mv.setViewName("template/index");
	      }
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
