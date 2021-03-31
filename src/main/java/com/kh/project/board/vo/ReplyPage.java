package com.kh.project.board.vo;

import java.util.List;

public class ReplyPage {

	private int replyCnt;
	private List<Reply> list;
	
	public ReplyPage(int replyCnt, List<Reply> list) {
		this.replyCnt = replyCnt;
		this.list = list;
	}
	
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public List<Reply> getList() {
		return list;
	}
	public void setList(List<Reply> list) {
		this.list = list;
	}
	
	
	
}
