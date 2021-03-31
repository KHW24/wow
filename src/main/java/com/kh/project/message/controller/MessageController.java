package com.kh.project.message.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.Board;
import com.kh.project.member.vo.Member;
import com.kh.project.message.service.MessageService;
import com.kh.project.message.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	@Autowired
	BoardService boardService;
	
	// 쪽지 팝업!
	@RequestMapping(value="messagepopup.do", method=RequestMethod.GET)
	public ModelAndView messagePopup (@RequestParam("no") int no, Member member, ModelAndView mv) throws Exception {
		Board board= boardService.selectPage(no);
		
		mv.addObject("postNo", no);
		mv.addObject("list", board);
		mv.setViewName("admin/messagepopup");
		return mv;
	}
	
	// 쪽지보내기 - insert
	@RequestMapping(value="messagepost.do", method=RequestMethod.POST)
	public ModelAndView messagepost(Message message, ModelAndView mv) throws Exception {
		int cnt = messageService.messagepost(message);
		mv.addObject("cnt", cnt);
        mv.setViewName("template/index");
		return mv;
	}
	
	// 쪽지함 리스트 - selectList 받은 쪽지함
	@RequestMapping(value="message.do", method=RequestMethod.GET)
	public ModelAndView messageList(@RequestParam("get_id") String get_id, ModelAndView mv) throws Exception {

		int listCount = messageService.ListCount(get_id);
		List<Message> messagelist = messageService.messageList(get_id);
		
		mv.addObject("listCount", listCount);
		mv.addObject("list", messagelist);
	    mv.addObject("center", "../mypage/message.jsp");
	    mv.setViewName("template/index");
	    return mv;
	}
	
	// 쪽지함 리스트 - selectList 보낸 쪽지함
	@RequestMapping(value="messagepush.do", method=RequestMethod.GET)
	public ModelAndView messagepushList(@RequestParam("get_id") String get_id, ModelAndView mv) throws Exception {
		
		int listCount = messageService.ListCountpush(get_id);
		List<Message> messagepushList = messageService.messagepushList(get_id);
		
		mv.addObject("listCount", listCount);
		mv.addObject("pushlist", messagepushList);
	    mv.addObject("center", "../mypage/messagepush.jsp");
	    mv.setViewName("template/index");
	    return mv;
	}

}