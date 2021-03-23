package com.kh.project.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SecurityController {

	@RequestMapping(value="/all",method=RequestMethod.GET)
	public String allView() {
		return "sample/all";
	}
	@RequestMapping(value="/sample/member",method=RequestMethod.GET)
	public String memberView() {
		return "sample/member";
	}
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String adminView() {
		return "sample/admin";
	}
}
