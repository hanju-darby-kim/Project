package com.fineapple.all.freeboard;

import java.util.ArrayList;

import com.fineapple.DTO.FBCategoryDTO;
import com.fineapple.DTO.FBFileDTO;
import com.fineapple.DTO.FreeBoardDTO;
import com.fineapple.DTO.VFreeBoardDTO;

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
			seq = dao.getMaxSeq();	//방금 입력한 글의 시퀀스 필요
			fbdto.setSeq(seq);			//넣어주기
			fileResult = dao.addFile(fbdto);
		}
		
		if ((addResult == 1) && (fileResult == 1)) return 1;
		else return 0;
		
	}

	public String getMaxSeq() {
		
		return dao.getMaxSeq();
	}

	public VFreeBoardDTO getView(String seq) {
		
		//글 얻어오기
		VFreeBoardDTO fbdto = new VFreeBoardDTO();
		fbdto = dao.getContent(seq);
		fbdto.setRegDate(fbdto.getRegDate().substring(0, 19));	//날짜 .0 자르기
		
		//첨부파일 얻어오기
		fbdto.setFileList(dao.getFiles(seq));
		
		//확장자명 잘라주기
		for (FBFileDTO dto : fbdto.getFileList()) {
			String fileName = dto.getFileName();
			dto.setExtension(fileName.substring(fileName.lastIndexOf("."), fileName.length()));
			//점을 뒤에서부터 찾아서 인덱스 구한 다음에 마지막까지 자름
		}

		//댓글 얻어오기
		
		return fbdto;
	}

	public ArrayList<VFreeBoardDTO> getList() {
		
		return null;
	}

}
