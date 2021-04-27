package com.kh.project.member.controller;

import java.security.Principal;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.board.service.BoardService;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.Member;


@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	private BoardService bservice;
	
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
		
	//닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="checkNiDup.do", method=RequestMethod.POST)
	public String checkNiDup(String nickname) throws Exception {
				
		int cnt = memberService.checkNiDup(nickname);
				
		JSONObject obj = new JSONObject();
		obj.put("result", cnt);
				
		return obj.toJSONString();
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
		
	//by은지, 본인 확인페이지
	@ResponseBody
	@RequestMapping(value="myInfoCon.do", method=RequestMethod.POST)
	public String myInfoConView(@RequestBody String paramData, Principal principal) throws Exception{
		
		//by은지, 입력한 비밀번호값 
		String inputPw = paramData.trim();
		
		//by은지, 디비에서 회원 비밀번호 가져오기
		String id = principal.getName(); //-> 로그인된사용자 id
		String encodedPw = memberService.pwMatch(id);
		
		//by은지, 입력한 비밀번와 일치하는지 match -> true또는 false로 결과값 return
		return String.valueOf(pwdEncoder.matches(inputPw,  encodedPw));
	}
	
	//내 댓글 보기 다중 삭제
	@PostMapping(value="myReplyDelete.do")
	public String myReplyDeleteView(@RequestParam(value= "delNos") List<Integer> delNos) throws Exception{
		
		for(Integer delNo : delNos) bservice.deleteReply(delNo);
		return "redirect:myComment.do";
		
	}
	
//	// 나의 회원정보  (내정보 가져오기)
//	@RequestMapping(value="myInfoUp.do", method=RequestMethod.GET)
//	public String myInfoUpView(Model model) throws Exception{
//		//아직 session정보가 없어서
//		String id = "test01";
//		
//		Member member = memberService.selectMember(id);
//		model.addAttribute("member", member);		
//		model.addAttribute("center", "../mypage/myInfoUp.jsp");
//		return "template/index";
//	}

	//by은지, 회원정보 수정
	@RequestMapping(value="myInfoUp.do", method=RequestMethod.POST)
	public ModelAndView updateMember(Member member, ModelAndView mv)throws Exception{
			String inputPw = member.getPassword();
			String pw = pwdEncoder.encode(inputPw);	
			member.setPassword(pw);
		
			memberService.updateMember(member);
			System.out.println("수정"+memberService.updateMember(member));
			mv.setViewName("template/index");
			return mv;
	}
	
	//by은지, 회원정보 수정 - >닉네임 중복체크 (본인제외)
	@ResponseBody //응답
	@RequestMapping(value="nickCheck.do", method=RequestMethod.POST)
	public String nickCheck(@RequestBody String paramData, Principal principal) throws Exception {
		
		//by은지, 입력한 nickname · 로그인한 id값 vo에 저장 
		Member member = new Member();
		
		member.setNickname(paramData.trim());
		member.setId(principal.getName());
		
		int cnt = memberService.nicknameCheck(member);		
		return cnt+"";
	}
	
	//by은지, 회원정보 수정-> 이메일인증
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
	
	//by은지, 회원탈퇴
	@ResponseBody
	@RequestMapping(value="secession.do", method=RequestMethod.POST)
	public String deleteMember(@RequestBody String paramData)throws Exception{
		String id = paramData.trim();
		int cnt = memberService.deleteMember(id);
		System.out.println("결과"+cnt);
		
		if(cnt == -1) {
			//by은지, ★ 스프링 시큐리티 탈퇴 시 로그아웃 처리가 됨
			SecurityContextHolder.clearContext();
		}
		else {
			}
	
		return cnt+"";
	}
	
	// 비밀번호 찾기 -> 아이디/이메일 인증후 변경페이지로
	@RequestMapping(value="pwFind.do", method=RequestMethod.POST)
	public ModelAndView findPw(@RequestParam("id") String id, ModelAndView mv) throws Exception {
		Member member = memberService.getMember(id);
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
