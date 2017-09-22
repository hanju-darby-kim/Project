package com.fineapple.all.freeboard;

import java.util.ArrayList;

import com.fineapple.DTO.FBCategoryDTO;
import com.fineapple.DTO.FreeBoardDTO;

public class FreeBoardService {

	private FreeBoardDAO dao;
	
	public FreeBoardService() {
		dao = new FreeBoardDAO();
	}
	
	public ArrayList<FBCategoryDTO> getCategory() {
	
		return dao.getCategory();
	}

	public int add(FreeBoardDTO fbdto) {
		
		//글내용 넣기
		int addResult = dao.addFreeBoard(fbdto);
		
		//첨부파일 넣기
		int fileResult = dao.addFile(fbdto);
		
		return 0;
	}

}
