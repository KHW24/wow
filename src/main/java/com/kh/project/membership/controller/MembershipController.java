package com.kh.project.membership.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.membership.service.MembershipService;
import com.kh.project.membership.vo.Mshipdata;
import com.kh.project.membership.vo.Payment;

@Controller
	public class MembershipController {

	@Autowired
	MembershipService membershipService;
	
	//내 멤버십 보기
	@RequestMapping(value="myMship.do", method=RequestMethod.GET)
	public String myMshipView(Model model, Principal principal) throws Exception{
		String id = principal.getName();
		
		Payment payment = membershipService.selectMemberShip(id);
		model.addAttribute("payment", payment);
		model.addAttribute("center", "../membership/myMembership.jsp");
			
		return "template/index";
	}
	
	//멤버십 결제취소하기 위한 페이지 보기 controller
	@RequestMapping(value="payCancle.do", method=RequestMethod.GET)
	public String payCancleView(Model model, Principal principal ) throws Exception{
		String id = principal.getName();
		
		Payment payment = membershipService.selectMemberShip(id);
		model.addAttribute("payment", payment);
		model.addAttribute("center","../membership/membershipPayCancel.jsp");
		return "template/index";
	}
	
	//멤버십 결제취소요청  controller 및 결제확인 페이지
	@RequestMapping(value="payCancleSuccess.do", method=RequestMethod.GET)
	public String payCancleSuccessView(Model model, Principal principal, Payment payment, String cancel) throws Exception{
		String id = principal.getName();
		
		int cnt = membershipService.deleteMemberShip(id);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("payment", payment);
		model.addAttribute("cancel", cancel);
		
		System.out.println("삭제 여부 확인 : " +cnt);
	
		model.addAttribute("center","../membership/membershipPayCancelComplete.jsp");
		return "template/index";
	}
	
	//멤버십 결제완료
	//@ResponseBody
	@RequestMapping(value="paySuccess.do", method=RequestMethod.GET)
	public String paySuccessView(Model model, Principal principal, Mshipdata mshipdata, Payment payment) throws Exception{
		String id = principal.getName();
		
//		int mcnt = membershipService.insertMshipdata(mshipdata);
//		int pcnt = membershipService.insertPayment(payment);
//		
//		
//		model.addAttribute("mshipdata", mshipdata);
//		model.addAttribute("payment", payment);
//		
		model.addAttribute("center","../membership/membershipPayComplete.jsp");
		return "template/index";
	}
	
}
