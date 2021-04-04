package com.kh.project.admin.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.admin.service. AdminService;
import com.kh.project.admin.vo.AdminMs;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.member.service.MemberService;

@Controller
	public class AdminController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="membership.do", method=RequestMethod.GET)
	public String AdminView(Locale locale, Model model) throws Exception{

//		Date date = new Date();
//        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//         
//        String formattedDate = dateFormat.format(date);
		
        List<AdminMs> adminMsList = adminService.selectAdmin();
		
        model.addAttribute("adminMsList", adminMsList);
		model.addAttribute("center", "../admin/membership.jsp");
			
		return "template/index";
	}
	
	//관리자페이지 - 신고회원관리
	@RequestMapping(value = "report.do", method = RequestMethod.GET)
	public String report(Model model) throws Exception {
		List<AlertPost> alert = adminService.selectAlert();
		model.addAttribute("alert",alert);
		model.addAttribute("center","../admin/report.jsp");
		return "template/index";
	}
	
	//신고내역 다중 삭제
		@ResponseBody
		@PostMapping(value="alertDelete.do")
		public String alertDelete(@RequestParam("alertSeq") List<Integer> alertSeqs) throws Exception{
			for(Integer alertSeq : alertSeqs) adminService.deleteAlert(alertSeq);
			return "success";
			
		}
	
}

  
