package com.kh.project.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
	private JavaMailSender mailSender;
	
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
	
	
	// 쪽지 팝업
	@RequestMapping(value="messagepopup.do", method=RequestMethod.GET)
	public ModelAndView messagePopup (Member member, ModelAndView mv) throws Exception {

		mv.setViewName("admin/messagepopup");
		return mv;
	}
		
	// 이은지
	// 회원정보 수정
	
	// 나의 회원정보  (내정보 가져오기)
	@RequestMapping(value="myInfoUp.do", method=RequestMethod.GET)
	public String myInfoUpView(Model model) throws Exception{
		//아직 session정보가 없어서
		String id = "test01";
		
		Member member = memberService.selectMember(id);
		model.addAttribute("member", member);		
		model.addAttribute("center", "../mypage/myInfoUp.jsp");
		return "template/index";
	}
	
	// 회원정보 수정
	@RequestMapping(value="myInfoUp.do", method=RequestMethod.POST)
	public ModelAndView updateMember(Member member, ModelAndView mv)throws Exception{
		memberService.updateMember(member);
			
		mv.setViewName("template/index");
		return mv;
	}
	
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
	@ResponseBody //응답
	@RequestMapping(value="sendEmail.do", method=RequestMethod.POST)
	public String SendMail(String mail) {
		
		JSONObject js= new JSONObject();
		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mail); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
		
		key += numIndex;
		message.setSubject("인증번호 입력을 위한 메일 전송");
		message.setText("인증 번호 : " + key);
		mailSender.send(message);
		js.put("key", key);
		return js.toJSONString();
	}
	
	// 회원탈퇴 (로그인완성되면-> 세션도끊어주기)
	@ResponseBody
	@RequestMapping(value="secession.do", method=RequestMethod.POST)
	public String deleteMember(@RequestBody String paramData)throws Exception{
		String id = paramData.trim();
			
		int cnt = memberService.deleteMember(id);
		System.out.println(cnt);
		
		return cnt+"";
	}
	

}
