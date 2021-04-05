package com.kh.project.admin.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.admin.service. AdminService;
import com.kh.project.admin.vo.AdminMs;
import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.member.service.MemberService;

@Controller
	public class AdminController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	
	// 관리자페이지 - 멤버쉽 관리
	@RequestMapping(value="membership.do", method=RequestMethod.GET)
	public String AdminView(Locale locale, Model model) throws Exception{
		
        List<AdminMs> adminMsList = adminService.selectAdmin();
		
        model.addAttribute("adminMsList", adminMsList);
		model.addAttribute("center", "../admin/membership.jsp");
			
		return "template/index";
	}
	
	
	//관리자페이지 - 신고회원관리
	@RequestMapping(value = "report.do", method = RequestMethod.GET)
	public String report( Model model) throws Exception {
		
		model.addAttribute("center","../admin/report.jsp");
		return "template/index";
	}
	
	
	//관리자페이지 - 게시글 관리
	@RequestMapping(value = "postmanage.do", method = RequestMethod.GET)
	public String postmanage(@RequestParam(defaultValue="1", required=false) int page, Model model) throws Exception {
		int listCount = boardService.listCount();
		Criteria cri = new Criteria(page, 10);
		model.addAttribute("cri",cri);
		model.addAttribute("posts",adminService.selectPosts(cri));
		model.addAttribute("listCount", listCount);
		model.addAttribute("page", page);
		model.addAttribute("center","../admin/boardmanage.jsp");
		return "template/index";
	}
	
	//신고내역 다중 삭제
		@ResponseBody
		@PostMapping(value="alertDelete.do")
		public String alertDelete(@RequestParam("alertSeq") List<Integer> alertSeqs) throws Exception{
			for(Integer alertSeq : alertSeqs) adminService.deleteAlert(alertSeq);
			return "success";	
		}
		
	@RequestMapping(value="postAdminDelete.do", method=RequestMethod.POST)
	@ResponseBody
	public String deletePost(@RequestParam(value="postDel[]") List<Integer> postDels) throws Exception{
			
		for(Integer postNo : postDels) boardService.deleteBoard(postNo);
		return "success";
		
	} 
	
}

  
