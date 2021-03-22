package com.java.kh.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.kh.member.service.MemberService;
import com.kh.project.member.vo.Member;

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
	
	// update
	@RequestMapping(value="memberUpt.do", method=RequestMethod.GET)
	public ModelAndView updateMember(@RequestParam("id") String id, ModelAndView mv)  throws Exception{

		mv.addObject("id", id);
		mv.setViewName("testUpt");
		return mv;		
	}

	@RequestMapping(value="memberUpt.do", method=RequestMethod.POST)
	public ModelAndView updateMember(Member member, ModelAndView modelAndView)  throws Exception{
		
		memberService.updateMember(member);
		
		modelAndView.setViewName("redirect:memberView.do?id="+member.getId());
		return modelAndView;
	}

}
