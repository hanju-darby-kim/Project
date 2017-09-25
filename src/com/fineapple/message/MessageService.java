package com.fineapple.message;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.MsgSentDTO;

public class MessageService {

	private MessageDAO dao;
	private HttpSession session;
	
	public MessageService() {
		this.dao = new MessageDAO();//미리 준비
	}
	
	public int add(MsgSentDTO dto) {
		
		return dao.add(dto);
	}
	
}

