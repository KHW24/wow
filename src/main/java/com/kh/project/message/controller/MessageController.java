package com.kh.project.message.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	// 쪽지 팝업
	@RequestMapping(value="messagepopup.do", method=RequestMethod.GET)
	public ModelAndView messagePopup (@RequestParam("no") int no, ModelAndView mv) throws Exception {
		Board board= boardService.selectPage(no);
		
		mv.addObject("postNo", no);
		mv.addObject("list", board);
		mv.setViewName("message/messagepopup");
		return mv;
	}
	
	// 쪽지 상세 view 팝업 받은 쪽지
	@RequestMapping(value="messageviewpopup.do", method=RequestMethod.GET)
	public ModelAndView messageViewPopup (@RequestParam("msg_seq") int msg_seq, ModelAndView mv) throws Exception {

		Message message = messageService.messageView(msg_seq);
		mv.addObject("list", message);
		mv.setViewName("message/messageviewpopup");
		return mv;
	}
	
	// 쪽지 상세 view 팝업 보낸 쪽지
	@RequestMapping(value="messageviewpopupUp.do", method=RequestMethod.GET)
	public ModelAndView messageViewPopupUp (@RequestParam("msg_seq") int msg_seq, ModelAndView mv) throws Exception {

		Message message = messageService.messageView(msg_seq);
		mv.addObject("list", message);
		mv.setViewName("message/messageviewpopupUp");
		return mv;
	}
	
	// 쪽지보내기 - insert
	@RequestMapping(value="messagepost.do", method=RequestMethod.POST)
	public ModelAndView messagepost(Message message, ModelAndView mv) throws Exception {
		
		System.out.println("컨트롤러옴");
		int cnt = messageService.messagepost(message);
		System.out.println("컨트롤러에서 cnt"+cnt);
		mv.addObject("cnt", cnt);
        mv.setViewName("message/messagepopupCon");
		return mv;
	}
	
	// 쪽지함 리스트 - selectList 받은 쪽지함
	@RequestMapping(value="message.do", method=RequestMethod.GET)
	public ModelAndView messageList(@RequestParam("get_id") String get_id, ModelAndView mv) throws Exception {

		int listCount = messageService.ListCount(get_id);
		List<Message> messagelist = messageService.messageList(get_id);
		
		mv.addObject("listCount", listCount);
		mv.addObject("list", messagelist);
	    mv.addObject("center", "../message/message.jsp");
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
	    mv.addObject("center", "../message/messagepush.jsp");
	    mv.setViewName("template/index");
	    return mv;
	}
	
	// 쪽지 수정 - update
	@RequestMapping(value="messageviewpopupUp.do", method=RequestMethod.POST)
	public ModelAndView messageUpdate(Message message, ModelAndView mv) throws Exception {
		
		messageService.messageUpdate(message);
        mv.setViewName("template/index");
		return mv;
	}
	
	// 쪽지 삭제 - delete 
	@RequestMapping(value="messageDelete.do", method=RequestMethod.POST)
	public ModelAndView messageDelete(HttpServletRequest request, ModelAndView mv) throws Exception {
		 
		String[] ajaxMsg = request.getParameterValues("valueArr");
		System.out.println("컨트롤러 에서 valueArr값"+ajaxMsg);
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			messageService.messageDelete(ajaxMsg[i]);
		}
//		messageService.messageDelete(message);
//		mv.setViewName("redirect:message.do");
		return mv;
	}

}