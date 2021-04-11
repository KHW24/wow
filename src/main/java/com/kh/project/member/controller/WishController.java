package com.kh.project.member.controller;

import java.net.URLEncoder;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.Board;
import com.kh.project.member.service.WishService;
import com.kh.project.member.vo.Wish;

@Controller
public class WishController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	WishService wishS;
	
	// insert
	@ResponseBody
	@RequestMapping(value="wishInsert.do", method=RequestMethod.POST)
	public String wishInsert(Wish wish, Model m) throws Exception {
		m.addAttribute("success", wishS.wishInsert(wish));
		return "1";
	}
	
	// delete
	@ResponseBody
	@RequestMapping(value="wishDelete.do", method=RequestMethod.POST)
	public String wishDelete(int post_no) throws Exception {
		int data = wishS.wishDelete(post_no);
		return "1";
	}
	
	// wishList
	@ResponseBody
	@RequestMapping(value="wishList.do", method=RequestMethod.GET)
	public ModelAndView wishList(@RequestParam(value="category", defaultValue="") String category , 
			@RequestParam(value="onsale", defaultValue="") String onsale ,  
			@RequestParam(value="post_title", defaultValue="") String post_title , 
			@RequestParam(value="address", defaultValue="") String address
			,Principal principal, ModelAndView mv) throws Exception {
		
		String get_id= principal.getName();
		
		List<Board> boardList = boardService.selectList(category, onsale, post_title, address);
		List<Wish> wishList = wishS.wishList(get_id);
		
		mv.addObject("wishList", wishList);
		mv.addObject("boardList", boardList);
		mv.addObject("center","../mypage/wishList.jsp");
	    mv.setViewName("template/index");
		return mv;
	}
	
	//게시물 리스트 페이지 - ajax(post)
//	@ResponseBody
//	@RequestMapping(value="wishList.do", method=RequestMethod.POST)
//	public String wishListMore(Wish wish, Board board, Principal principal, String more, String get_id, Model model) throws Exception{
//	
//		Map<String, String> map = new HashMap<String, String>();
//
//		get_id= principal.getName();
//		map.put("more", more);
//		map.put("get_id", get_id);
//		List<Wish> wishListMore = wishS.wishListMore(map);
//		
//		int page = Integer.parseInt(more);
//		List<Board> boardListMore = boardService.selectListMore(page);
//		
//		JSONObject sendJson = new JSONObject();
//		JSONArray list = new JSONArray();
//		for (Board board1 : boardListMore) {
//			//board 정보 저장할 json객체 선언
//			JSONObject jboard = new JSONObject();
//			jboard.put("post_code",board1.getPost_code());
//			jboard.put("post_no",board1.getPost_no());
//			jboard.put("post_title", URLEncoder.encode(board1.getPost_title(),"UTF-8"));
//			jboard.put("post_address",URLEncoder.encode(board1.getPost_address(),"UTF-8"));
//			jboard.put("post_date",sf.format(board1.getPost_date()));
//			jboard.put("post_price",board1.getPost_price());
//			jboard.put("rename_filename",board1.getRename_filename());
//			list.add(jboard);
//		}
//		
//		sendJson.put("list", list);
//		return sendJson.toJSONString();
//	}
	
}
