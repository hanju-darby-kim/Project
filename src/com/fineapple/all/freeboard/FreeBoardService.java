package com.fineapple.all.freeboard;

import java.util.ArrayList;

import com.fineapple.DTO.FBCategoryDTO;

public class FreeBoardService {

	private FreeBoardDAO dao;
	
	public FreeBoardService() {
		dao = new FreeBoardDAO();
	}
	
	public ArrayList<FBCategoryDTO> getCategory() {
	
		return dao.getCategory();
	}

}
