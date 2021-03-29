package com.kh.project.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.member.vo.Member;
import com.kh.project.message.service.MessageService;
import com.kh.project.message.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	// 쪽지 팝업!
	@RequestMapping(value="messagepopup.do", method=RequestMethod.GET)
	public ModelAndView messagePopup (Member member, ModelAndView mv) throws Exception {

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
	
	// 쪽지함 리스트 - select
	@RequestMapping(value="message.do", method=RequestMethod.GET)
	public ModelAndView messageList(@RequestParam("get_id") String get_id, ModelAndView mv) throws Exception {
		Message message = messageService.messageList(get_id);
		mv.addObject("message", message);
        mv.addObject("center", "../mypage/message.jsp");
        mv.setViewName("template/index");
        return mv;
	}

}