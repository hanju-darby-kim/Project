package com.fineapple.club;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ClubDTO;



public class ClubService {

	private ClubDAO dao;
	private HttpSession session;
	
	public ClubService() {
		this.dao = new ClubDAO();//미리 준비
	}
	
	//스프링 -> 의존 주입(Dependency Injection)
	public ClubService(HttpSession session) {
		this.dao = new ClubDAO();//미리 준비
		this.session = session;
	}
	
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
