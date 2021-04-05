package com.kh.project.message.controller;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.member.vo.Member;
import com.kh.project.message.service.MessageService;
import com.kh.project.message.vo.Message;
import com.kh.project.message.vo.MessagePage;

@Controller
public class MessageController {
	
	@Autowired
	MessageService messageService;
	public static final int LIMIT = 10;
	
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
	public ModelAndView messageViewPopup (@RequestParam("msg_seq") String msg_seq, ModelAndView mv) throws Exception {

		Message message = messageService.messageView(msg_seq);
		mv.addObject("list", message);
		mv.setViewName("message/messageviewpopup");
		return mv;
	}
	
	// 쪽지 상세 view 팝업 보낸 쪽지
	@RequestMapping(value="messageviewpopupUp.do", method=RequestMethod.GET)
	public ModelAndView messageViewPopupUp (@RequestParam("msg_seq") String msg_seq, ModelAndView mv) throws Exception {

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
	
//	// 쪽지함 리스트 - selectList 받은 쪽지함
//		@RequestMapping(value="message.do", method=RequestMethod.GET)
//		public ModelAndView messageList(@RequestParam("get_id") String get_id, ModelAndView mv) throws Exception {
//
//			int listCount = messageService.ListCount(get_id);
//			List<Message> messagelist = messageService.messageList(get_id);
//			
//			mv.addObject("listCount", listCount);
//			mv.addObject("list", messagelist);
//		    mv.addObject("center", "../message/message.jsp");
//		    mv.setViewName("template/index");
//		    return mv;
//		}
	
//	// 쪽지함 리스트 - selectList 받은 쪽지함
//	@RequestMapping(value="message.do", method=RequestMethod.GET)
//	public ModelAndView messageList(@RequestParam("get_id") String get_id,
//			@RequestParam(name = "page", defaultValue = "1") int page, 
//			 ModelAndView mv) throws Exception {
//
////		int listCount = messageService.ListCount(get_id);
////		List<Message> messagelist = messageService.messageList(get_id, page, page);
//
//		try {
//			// 현재 페이지번호 받아옴
//			int currentPage = page;
//			// 한 페이지당 출력할 목록 갯수
//			int listCount = messageService.ListCount(get_id);
//			System.out.println("1");
//			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
//			System.out.println("2");
//						//messageService.messageList(get_id, currentPage, LIMIT));
//				mv.addObject("currentPage", currentPage);
//				System.out.println("4");
//				mv.addObject("maxPage", maxPage);
//				System.out.println("5");
//				mv.addObject("listCount", listCount);
//				System.out.println("6");
//				System.out.println("maxpage"+maxPage+"listcount"+listCount+"currentPage"+currentPage);
//				mv.addObject("list", messageService.messageList(get_id, currentPage, LIMIT));
//				System.out.println("3");
//			    mv.addObject("center", "../message/message.jsp");
//				System.out.println("7");
//			    mv.setViewName("template/index");
//				System.out.println("8");
//		} catch (Exception e) {
//				System.out.println("페이징 에러발생");
//		}
//		return mv;
		
//		mv.addObject("listCount", listCount);
//		mv.addObject("list", messagelist);
//	    mv.addObject("center", "../message/message.jsp");
//	    mv.setViewName("template/index");
	    
//	}
	
//	// 쪽지함 리스트 - selectList 받은 쪽지함
//	@RequestMapping(value="message.do", method=RequestMethod.GET)
//	public ModelAndView messageList(@RequestParam(defaultValue="1", required=false) int page, 
//			@RequestParam("get_id") String get_id, ModelAndView mv) throws Exception {
//		Criteria cri = new Criteria(page,10);
//		mv.addObject("ms", messageService.messageList(cri, get_id));	// ms에 다 있는 상태..
//		System.out.println("ms의 cnt"+messageService.messageList(cri, get_id).getMeCnt());
//		System.out.println("ms의 list"+messageService.messageList(cri, get_id).getList().get(1));
//	    mv.addObject("center", "../message/message.jsp");
//	    mv.setViewName("template/index");
//		return mv;
//	}
	
//	@RequestMapping(value="message.do", method=RequestMethod.GET)
//	public ModelAndView messageList(@RequestParam(name="page", defaultValue="1") int page, 
//			@RequestParam("get_id") String get_id, ModelAndView mv) throws Exception {
//		try {
//			 int currentPage = page;
//			 // 한 페이지당 출력할 목록 갯수
//			 int listCount = messageService.ListCount(get_id);
//			 int maxPage = (int) ((double) listCount / LIMIT + 0.9);
//				 mv.addObject("idlist", messageService.messageList(get_id));
//				 mv.addObject("list", messageService.selectList(currentPage, LIMIT));
//				 mv.addObject("currentPage", currentPage);
//				 mv.addObject("maxPage", maxPage);
//				 mv.addObject("listCount", listCount);
//				 mv.addObject("get_id", get_id);
//				    mv.addObject("center", "../message/message.jsp");
//				    mv.setViewName("template/index");
//				    System.out.println("컨트롤러 끝...");
//			} catch (Exception e) {
//				 mv.addObject("msg", e.getMessage());
//			}
//			 return mv;
//	}
	
//	@RequestMapping(value="message.do", method=RequestMethod.GET)
//	public ModelAndView messageList(MessagePage messagePage, @RequestParam(name="page", defaultValue="1") int page, 
//			@RequestParam("get_id") String get_id, @RequestParam(value="cntPerPage", required=false)int cntPerPage,
//			ModelAndView mv) throws Exception {
//
//		try {
//			 int currentPage = page;
//			 cntPerPage = 10;
//			 System.out.println("1");
//			 // 한 페이지당 출력할 목록 갯수
//			 int listCount = messageService.ListCount(get_id);
//			 System.out.println("2");
//			 int maxPage = (int) ((double) listCount / LIMIT + 0.9);
//				 mv.addObject("idlist", messageService.messageList(get_id));
//				 mv.addObject("list", messageService.selectList(currentPage, LIMIT));
//				 mv.addObject("currentPage", currentPage);
//				 mv.addObject("maxPage", maxPage);
//				 mv.addObject("listCount", listCount);
//				 mv.addObject("get_id", get_id);
//				    mv.addObject("center", "../message/message.jsp");
//				    mv.setViewName("template/index");
//			 	messagePage = new MessagePage(listCount, page, cntPerPage);
//				 System.out.println("3");
//				mv.addObject("paging", messagePage);
//				 System.out.println("4");
//				mv.addObject("viewAll", messageService.messageList(messagePage));
//				 System.out.println("5");
//				mv.addObject("get_id", get_id);
//				 System.out.println("6");
//				mv.addObject("listCount", listCount);
//				 System.out.println("7");
//				mv.addObject("currentPage", currentPage);
//			    mv.addObject("center", "../message/message.jsp");
//			    mv.setViewName("template/index");
//				 System.out.println("8");
//		} catch(Exception e) {
//			System.out.println("컨트롤러 오류발생...");
//		}
//			 return mv;
//	}
	
	// 쪽지함 리스트 - selectList 받은 쪽지함&페이징
	@RequestMapping(value="message.do", method=RequestMethod.GET)
	public ModelAndView messageList(@RequestParam(defaultValue="1", required=false) int page,
			@RequestParam("get_id") String get_id, ModelAndView mv) throws Exception {

		int listCount = messageService.ListCount(get_id);
		Criteria cri = new Criteria(page,10);
		List<Message> messageListt = messageService.messageListt(get_id);
		mv.addObject("cri", cri);
		mv.addObject("messageListt", messageListt);
		mv.addObject("list", messageService.messageList(cri, get_id));
		mv.addObject("listCount",listCount);
	    mv.addObject("get_id", get_id);
	    mv.addObject("page", page);
	    mv.addObject("center", "../message/message.jsp");
	    mv.setViewName("template/index");
		return mv;
	}
	
			
	
	// 쪽지함 리스트 - selectList 보낸 쪽지함&페이징
	@RequestMapping(value="messagepush.do", method=RequestMethod.GET)
	public ModelAndView messagepushList(@RequestParam(defaultValue="1", required=false) int page,
			@RequestParam("get_id") String get_id, ModelAndView mv) throws Exception {
		
		int listCount = messageService.ListCountpush(get_id);
		Criteria cri = new Criteria(page,10);
		mv.addObject("cri", cri);
		mv.addObject("list", messageService.messagepushList(cri, get_id));
		mv.addObject("listCount", listCount);
	    mv.addObject("get_id", get_id);
	    mv.addObject("page", page);
	    mv.addObject("center", "../message/messagepush.jsp");
	    mv.setViewName("template/index");
	    return mv;
	}
	
	// 쪽지 수정 - update
	@RequestMapping(value="messageviewpopupUp.do", method=RequestMethod.POST)
	public ModelAndView messageUpdate(Message message, ModelAndView mv) throws Exception {
		
		int cnt = messageService.messageUpdate(message);
		mv.addObject("cnt", cnt);
        mv.setViewName("message/messagepopupCon");
		return mv;
	}
	
//	// 쪽지 삭제 - delete 미완
//	@RequestMapping(value="messageDelete.do", method=RequestMethod.GET)
//	public String messageDelete(int msg_seq) throws Exception { 
//		messageService.messageDelete(msg_seq);
//		return "redirect:message.do";
//	}
	
	// 카트 삭제
//	@RequestMapping(value = "messageDelete.do", method = RequestMethod.POST)
//	public ModelAndView messageDelete(@ModelAttribute Message message, ModelAndView mv) throws Exception {
//
//	    JSONObject result = new JSONObject();
//	    messageService.messageDelete(message);
//	    mv.addObject("result", "success");
//	    mv.addObject("status", 1);
//	    return mv;
//	}
	
	// 쪽지 삭제 - delete 미완
//	@RequestMapping(value="messageDelete.do", method=RequestMethod.POST)
//	public String messageDelete( Message message) throws Exception { 
//		System.out.println("컨트롤러옴");
//		messageService.messageDelete(message);
//		return "redirect:message.do";
//	}
	
	// 쪽지 삭제 - 받은 쪽지함
	@ResponseBody
	@RequestMapping(value="messageDelete.do", method=RequestMethod.POST)
	public String messageDelete(HttpServletRequest request) throws Exception {

		String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	messageService.messageDelete(ajaxMsg[i]);
        }
		return "redirect:message.do"; 
	}
	
	// 쪽지 삭제 - 보낸 쪽지함
	@ResponseBody
	@RequestMapping(value="messagepushDelete.do", method=RequestMethod.POST)
	public String messagepushDelete(HttpServletRequest request) throws Exception {

		String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	messageService.messageDelete(ajaxMsg[i]);
        }
		return "redirect:messagepush.do"; 
	}

}