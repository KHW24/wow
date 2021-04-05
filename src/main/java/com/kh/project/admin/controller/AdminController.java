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
import org.springframework.stereotype.Service;
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

import sun.print.resources.serviceui;

@Controller
	public class AdminController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	// 관리자페이지 - 멤버쉽 관리
	@RequestMapping(value="membership.do", method=RequestMethod.GET)
	public String AdminView(Locale locale, Model model) throws Exception{
		
        List<AdminMs> adminMsList = adminService.selectAdmin();
		
        model.addAttribute("adminMsList", adminMsList);
		model.addAttribute("center", "../admin/membership.jsp");
			
		return "template/index";
	}
	
//	// 멤버쉽 삭제
//	@RequestMapping(value="/update", method=RequestMethod.POST)
//	public String postdelete(AdminMs vo) throws Exception {
//		adminService.deleteAlert(vo);
//		return "redirect:list";
//	}
//	
	
	// 멤버쉽 선택 삭제
	@PostMapping(value="adminMsDelete.do")
	public String myReplyDeleteView(@RequestParam(value= "delNos") List<Integer> delNos) throws Exception{
		for(Integer delNo : delNos) adminService.deleteAdminMs(delNo);
		return "Membership.do";
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

  
