package com.fineapple.club;

import java.util.ArrayList;

import com.fineapple.DTO.ClubDTO;

public class ClubService {

	public ArrayList<ClubDTO> list() {
		ClubDAO dao = new ClubDAO();
		ArrayList<ClubDTO> list = dao.list(); 
		
		for(ClubDTO dto : list) {
			dto.setOpenDate(dto.getOpenDate().substring(0,10));
			
			System.out.println(dto.toString());
		}
		return list;
	}

}
