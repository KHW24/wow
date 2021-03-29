package com.kh.project.message.service;

import com.kh.project.message.vo.Message;

public interface MessageService {

	// 쪽지보내기 - insert
	public int messagepost(Message message) throws Exception;
	
	// 쪽지함 리스트 - select
	public Message messageList(String get_id) throws Exception;
	
}
