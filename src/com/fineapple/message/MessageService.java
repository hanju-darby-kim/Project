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
	
	//받은쪽지함
	public ArrayList<MsgSentDTO> list(int num) {
		ArrayList<MsgSentDTO> list = dao.list(num);
		return list;
	}

	//보낸쪽지함
	public ArrayList<MsgSentDTO> slist(int num) {
		ArrayList<MsgSentDTO> list = dao.slist(num);

		return list;
	}
	
	public int sAdd(MsgSentDTO sdto) {
		return dao.sAdd(sdto);
	}

	public int rAdd(MsgReadDTO rdto) {
		return dao.rAdd(rdto);
	}

	
}

