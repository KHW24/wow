package com.kh.project.message.vo;

import java.util.List;

public class MessagePage {
		
	private int messageCnt;
	private List<Message> list;
	
	public MessagePage(int messageCnt, List<Message> list) {
		this.messageCnt = messageCnt;
		this.list = list;	
	}

	public int getMessageCnt() {
		return messageCnt;
	}

	public void setMessageCnt(int messageCnt) {
		this.messageCnt = messageCnt;
	}

	public List<Message> getList() {
		return list;
	}

	public void setList(List<Message> list) {
		this.list = list;
	}
	
}
