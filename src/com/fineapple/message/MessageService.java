package com.fineapple.message;

import java.util.ArrayList;

import com.fineapple.DTO.MsgReadDTO;
import com.fineapple.DTO.MsgSRDTO;
import com.fineapple.DTO.MsgSentDTO;

public class MessageService {

	private MessageDAO dao;
	
	public MessageService() {
		this.dao = new MessageDAO();//미리 준비
	}
	
	//받은쪽지함, Inbox.java
	public ArrayList<MsgSRDTO> list(int num) {
		ArrayList<MsgSRDTO> list = dao.list(num);
		return list;
	}

	//보낸쪽지함
	public ArrayList<MsgSentDTO> slist(int num) {
		ArrayList<MsgSentDTO> slist = dao.slist(num);
		return slist;
	}

	//보관쪽지함
	public ArrayList<MsgSRDTO> plist(int num) {
		ArrayList<MsgSRDTO> plist = dao.plist(num);
		return plist;
	}

	
	public int sAdd(MsgSentDTO sdto) {
		return dao.sAdd(sdto);
	}

	public int rAdd(MsgReadDTO rdto) {
		return dao.rAdd(rdto);
	}

}

