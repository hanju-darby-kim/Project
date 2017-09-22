package com.fineapple.all.freeboard;

import java.util.ArrayList;

import com.fineapple.DTO.FBCategoryDTO;
import com.fineapple.DTO.FreeBoardDTO;

public class FreeBoardService {

	private FreeBoardDAO dao;
	
	public FreeBoardService() {
		dao = new FreeBoardDAO();
	}
	
	//카테고리 얻어오기
	public ArrayList<FBCategoryDTO> getCategory() {
		return dao.getCategory();
	}

	//글 디비에 넣기
	public int add(FreeBoardDTO fbdto) {
		int fileResult = 0;
		String seq = "";
		//글내용 넣기
		int addResult = dao.addFreeBoard(fbdto);
		
		if(fbdto.getFileList().size() != 0) {
			//첨부파일이 있다면 첨부파일 넣기
			seq = dao.getMaxSeq(seq);
			fileResult = dao.addFile(fbdto);
		}
		
		if ((addResult == 1) && (fileResult == 1)) return 1;
		else return 0;
		
	}

	public void getMaxSeq(String seq) {
		seq = dao.getMaxSeq(seq);
	}

}
