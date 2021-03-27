package com.kh.project.member.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	// 비밀번호 암호화
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
		
	// 회원 가입 -> 이메일 인증
	@Autowired
	JavaMailSender mailSender;
		
	@RequestMapping(value="mailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) throws Exception{
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호 : "+ email);
			
		Random random = new Random();
		int cNum = random.nextInt(888888)+111111;
		System.out.println("인증번호 : "+cNum);
			
		// 메일 보내기
		String setFrom = "somssi2525@gmail.com";
		String toMail = email;
		String title = "회원가입 인증번호입니다.";
		String content = "인증번호는 "+ cNum +"입니다."+"<br>"+"해당 인증번호를 홈페이지에 입력해 주세요.";
			
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
		
			mailHelper.setFrom(setFrom);
			mailHelper.setTo(toMail);
			mailHelper.setSubject(title);
			mailHelper.setText(content,true);
			mailSender.send(mail);
		} catch (Exception e) {
			System.out.println("오류발생");
		}
			String num = Integer.toString(cNum);
			return num;
	}
		
	// 회원가입
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView insertMember(Member member, ModelAndView mv) throws Exception {
			
		String inputPw = member.getPassword();
		String pw = pwdEncoder.encode(inputPw);	
		member.setPassword(pw);
		
		int cnt = memberService.insertMember(member);
	
		mv.addObject("cnt", cnt);
		mv.setViewName("redirect:login.do");
		return mv;
	}
	
	// id 중복체크
	@ResponseBody
	@RequestMapping(value="checkIdDup.do", method=RequestMethod.POST)
	public String checkIdDup(String id) throws Exception {
			
		int cnt = memberService.checkIdDup(id);
			
		JSONObject obj = new JSONObject();
		obj.put("result", cnt);
			
		return obj.toJSONString();
	}
		
	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="checkNiDup.do", method=RequestMethod.POST)
	public String checkNiDup(String nickname) throws Exception {
				
		int cnt = memberService.checkNiDup(nickname);
				
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
	
	// 비밀번호 찾기 -> 아이디/이메일 인증
		@RequestMapping(value="pwFind.do", method=RequestMethod.POST)
		public ModelAndView findPw(@RequestParam("id") String id, ModelAndView mv) throws Exception {
			System.out.println("1번째 받아온 id 값" + id);
			Member member = memberService.getMember(id);
			System.out.println("1번째 $로 받아온 값 "+member.getId());
			mv.addObject("member", member);
	        mv.addObject("center", "../login/pwFindUpt.jsp");
	        mv.setViewName("template/index");
			return mv;
		}
		
		// 비밀번호 찾기 -> 비밀번호 변경
		@RequestMapping(value="updatePw.do", method=RequestMethod.POST)
		public ModelAndView updatePw(Member member, ModelAndView mv) throws Exception {
			
			String inputPw = member.getPassword();
			String pw = pwdEncoder.encode(inputPw);	
			member.setPassword(pw);
			
			int cnt = memberService.updatePw(member);
			mv.addObject("cnt", cnt);
	        mv.setViewName("template/index");
			return mv;
		}
	
		

}
