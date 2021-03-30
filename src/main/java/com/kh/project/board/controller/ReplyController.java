package com.kh.project.board.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.Criteria;
import com.kh.project.board.vo.Reply;

@RequestMapping("/reply/")
@RestController
public class ReplyController {

	@Autowired
	private BoardService bservice;
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String replyCreate(Reply rep, Model model) throws Exception {
		int cnt = bservice.insertReply(rep);
		return "success";
	}
	
	@RequestMapping(value = "/list.do")
	public List<Reply> replyList(int postNo) throws Exception {
		Criteria cri = new Criteria(1,10);
		return bservice.getRepliesList(cri, postNo);
	}
	
	
		
		
		
	
	
	
	
}
