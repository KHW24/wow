package com.kh.project.mypage.controller;

import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.board.vo.Board;
import com.kh.project.mypage.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;
	
	//내가 쓴 글 리스트
	@RequestMapping(value="myList.do", method=RequestMethod.GET)
	public String myListView(Model model, Principal principal) throws Exception{
		
		String id= principal.getName();
		
		List<Board> myBoardList = mypageService.myBoardList(id);
		
		model.addAttribute("myBoardList", myBoardList);
		model.addAttribute("center","../mypage/myList.jsp");
		return "template/index";
	}
	
	// 내가 쓴 글 페이징
	@ResponseBody
	@RequestMapping(value="myList.do", method=RequestMethod.POST)
	public String myListView(Model model, Board board, Principal principal, String id, String more) throws Exception{
		
		Map<String, String> map = new HashMap<String, String>();
		String Pid= principal.getName();
//		int page = Integer.parseInt(more);
		map.put("more", more);
		System.out.println("나와라나와라 :"+ more);
		map.put("Pid", Pid);
		System.out.println("아이디야 들어가라 : "+Pid);
		List<Board> myBoardPage = mypageService.myBoardPage(map);
		System.out.println(myBoardPage);
		
		JSONObject sendJson = new JSONObject();
		JSONArray list = new JSONArray();
		for(Board board2 : myBoardPage) {
			JSONObject jboard = new JSONObject();
			jboard.put("post_code",board2.getPost_code());
			jboard.put("post_no",board2.getPost_no());
			jboard.put("post_title", URLEncoder.encode(board2.getPost_title(),"UTF-8"));
			jboard.put("post_address",URLEncoder.encode(board2.getPost_address(),"UTF-8"));
			jboard.put("post_price",board2.getPost_price());
			list.add(jboard);
		}
		sendJson.put("list", list);
		return sendJson.toJSONString();
	}
	
//	@ResponseBody
//	@RequestMapping(value="myList.do", method=RequestMethod.POST)
//	public String myListView(Model model, Board board, Principal principal, String id, String more) throws Exception{
//		
//		String Pid= principal.getName();
//		int page = Integer.parseInt(more);
//
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("more", more);
//		map.put("Pid", Pid);
//		List<Board> myBoardPage = mypageService.myBoardPage(map);
//	
//		JSONObject sendJson = new JSONObject();
//		JSONArray list = new JSONArray();
//		for(Board board2 : myBoardPage) {
//			JSONObject jboard = new JSONObject();
//			jboard.put("post_code",board2.getPost_code());
//			jboard.put("post_no",board2.getPost_no());
//			jboard.put("post_title", URLEncoder.encode(board2.getPost_title(),"UTF-8"));
//			jboard.put("post_address",URLEncoder.encode(board2.getPost_address(),"UTF-8"));
//			jboard.put("post_price",board2.getPost_price());
//			list.add(jboard);
//		}
//		sendJson.put("list", list);
//		return sendJson.toJSONString();
//	}
	
//	@ResponseBody
//	@RequestMapping(value="myList.do", method=RequestMethod.POST)
//	public String myBoardPage(Model model, Board board, Principal principal, String id, String more) throws Exception{
//		String Pid= principal.getName();
//		List<Board> myBoardPage = mypageService.myBoardPage(Pid, more);
//		int page = Integer.parseInt(more);
//
////		Map<String, String> map = new HashMap<String, String>();
////		map.put("more", more);
////		map.put("Pid", Pid);
//	
//		JSONObject sendJson = new JSONObject();
//		JSONArray list = new JSONArray();
//		for(Board board2 : myBoardPage) {
//			JSONObject jboard = new JSONObject();
//			jboard.put("post_code",board2.getPost_code());
//			jboard.put("post_no",board2.getPost_no());
//			jboard.put("post_title", URLEncoder.encode(board2.getPost_title(),"UTF-8"));
//			jboard.put("post_address",URLEncoder.encode(board2.getPost_address(),"UTF-8"));
//			jboard.put("post_price",board2.getPost_price());
//			list.add(jboard);
//		}
//		sendJson.put("list", list);
//		return sendJson.toJSONString();
//	}
}
