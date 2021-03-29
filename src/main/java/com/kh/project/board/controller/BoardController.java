package com.kh.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.Board;
import com.kh.project.member.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	//게시물 작성 페이지
	@RequestMapping(value="postWrite.do", method=RequestMethod.GET)
	public String postWriteView(Model model) throws Exception{
		model.addAttribute("center","../board/post/salesPost.jsp");
		return "template/index";
	}
	
	// 글등록
	@RequestMapping(value="postWrite.do", method=RequestMethod.POST)
	public ModelAndView insertMember(Board board, ModelAndView mv) throws Exception {
		
	boardService.insertBoard(board);
	System.out.println("카테고리"+board.getPost_code());
	
	mv.setViewName("redirect:boardList.do");
	return mv;
	}
	

}
