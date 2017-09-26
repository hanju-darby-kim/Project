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
	
	//업퍼헤더 출력
	public ArrayList<MsgSRDTO> upperlist(int num) {
		ArrayList<MsgSRDTO> upperlist = dao.upperlist(num);
		
		for(MsgSRDTO dto : upperlist){
			// 날짜 자르기
			dto.setSentDate(dto.getSentDate().substring(0, 10));
			// 제목 길면 짜르기
			String title = dto.getTitle();
			if (title.length() > 20) {
				title = title.substring(0, 20) + "...";
			}
			dto.setTitle(title);
			
			String content = dto.getContent();
			if (content.length() > 45) {
				content = content.substring(0, 45) + "...";
			}
			dto.setContent(content);
		}
		
		return upperlist;
	}
	
	public int sAdd(MsgSentDTO sdto) {
		return dao.sAdd(sdto);
	}

	public int rAdd(MsgReadDTO rdto) {
		return dao.rAdd(rdto);
	}
	
}

