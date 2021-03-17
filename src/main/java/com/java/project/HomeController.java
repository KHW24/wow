package com.java.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="postView.do", method=RequestMethod.GET)
	public String postView(Model model) throws Exception{
		model.addAttribute("center","../board/post/buyerPostView.jsp");
		return "template/index";
	}
	
	@RequestMapping(value="postWrite.do", method=RequestMethod.GET)
	public String postWriteView(Model model) throws Exception{
		model.addAttribute("center","../board/post/salesPost.jsp");
		return "template/index";
	}
	@RequestMapping(value="wishList.do", method=RequestMethod.GET)
	public String wishListView(Model model) throws Exception{
		model.addAttribute("center","../mypage/wishList.jsp");
		return "template/index";
	}
	
	@RequestMapping(value="boardList.do", method=RequestMethod.GET)
	public String boardListView(Model model) throws Exception{
		model.addAttribute("center","../board/boardList.jsp");
		return "template/index";
	}
	
	@RequestMapping(value="otherList.do", method=RequestMethod.GET)
	public String otherListView(Model model) throws Exception{
		model.addAttribute("center","../board/otherList.jsp");
		return "template/index";
	}

	@RequestMapping(value="myList.do", method=RequestMethod.GET)
	public String myListView(Model model) throws Exception{
		model.addAttribute("center","../mypage/myList.jsp");
		return "template/index";
	}
	
	
	
}
