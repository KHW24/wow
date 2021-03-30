package com.kh.project.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.Board;
import com.kh.project.member.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	//게시물 리스트 페이지
	@RequestMapping(value="boardList.do", method=RequestMethod.GET)
	public String boardListView(Model model) throws Exception{
		
		List<Board> boardList = boardService.selectList(10);
		
		model.addAttribute("list", boardList);
		model.addAttribute("center","../board/boardList.jsp");
		return "template/index";
	}
	
	// 글등록- GET
	@RequestMapping(value="postWrite.do", method=RequestMethod.GET)
	public String postWriteView(Model model) throws Exception{
		model.addAttribute("center","../board/post/salesPost.jsp");
		return "template/index";
	}
	
	// 글등록- POST
	@RequestMapping(value="postWrite.do", method=RequestMethod.POST)
	public ModelAndView insertMember(Board board, ModelAndView mv) throws Exception {
		
	boardService.insertBoard(board);
	
	mv.setViewName("redirect:boardList.do");
	return mv;
	}
	
	// 자세한페이지(판매자)
	@RequestMapping(value="postSellerView.do", method=RequestMethod.GET)
	public String postSellerView(@RequestParam("no") int no, Model model) throws Exception{
		Board board= boardService.selectPage(no);
		
		model.addAttribute("postNo", no);
		model.addAttribute("list", board);
		model.addAttribute("center","../board/post/sellerPostView.jsp");
		return "template/index";
	}

}
