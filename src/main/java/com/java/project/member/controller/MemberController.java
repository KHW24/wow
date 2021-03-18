package com.java.project.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.project.member.service.MemberService;
import com.java.project.member.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	// 회원 생성(insert) post방식 , get은 HomeController에~~
	@RequestMapping(value="joinCon.do", method=RequestMethod.POST)
	public ModelAndView insertMember(Member member, ModelAndView mv) throws Exception {
		
		int cnt = memberService.insertMember(member);
		
		mv.addObject("cnt", cnt);
		mv.setViewName("template/index");
		return mv;
	}
	
	// select
	@RequestMapping(value="/memberList.do", method=RequestMethod.GET)
	   public ModelAndView memberList(ModelAndView modelAndView) throws Exception{
	      
	      List<Member>memberList = memberService.selectMemberAll();
	      
	      modelAndView.addObject("MemberList", memberList);
	      modelAndView.setViewName("test");
	      return modelAndView;   
	   }

}
