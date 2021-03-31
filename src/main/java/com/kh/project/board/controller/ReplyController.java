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
import com.kh.project.board.vo.ReplyPage;

@RequestMapping("/reply/")
@RestController
public class ReplyController {

	@Autowired
	private BoardService bservice;
	
	//댓글 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String replyCreate(Reply rep) throws Exception {
		int cnt = bservice.insertReply(rep);
		return "success";
	}
	
	//댓글 목록 조회
	@RequestMapping(value = "/list")
	public ReplyPage replyList(@RequestParam(defaultValue="1", required=false) int page, @RequestParam int postNo) throws Exception {
		Criteria cri = new Criteria(page,10);
		return bservice.getRepliesList(cri, postNo);
	}
	
	//댓글 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String replyUpdate(Reply rep) throws Exception {
		int cnt = bservice.updateReply(rep);
		return "success";
	}
	
	//댓글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String replyDelete(int repSeq) throws Exception {
		int cnt = bservice.deleteReply(repSeq);
		return "success";
	}
	
	
		
		
		
	
	
	
	
}
