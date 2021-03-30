package com.kh.project.membership.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
}
