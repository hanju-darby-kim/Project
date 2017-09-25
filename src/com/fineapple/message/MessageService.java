package com.fineapple.message;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.MsgReadDTO;
import com.fineapple.DTO.MsgSentDTO;

public class MessageService {

	private MessageDAO dao;
	private HttpSession session;	
	
	public MessageService() {
		this.dao = new MessageDAO();//미리 준비
	}
	
	public ArrayList<MsgSentDTO> list(int num) {
		ArrayList<MsgSentDTO> list = dao.list(num);
		return list;
	}

	public int sAdd(MsgSentDTO sdto) {
		return dao.sAdd(sdto);
	}

	public int rAdd(MsgReadDTO rdto) {
		return dao.rAdd(rdto);
	}
	
}

