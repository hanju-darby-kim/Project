package com.fineapple.department;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.OutcomeCategoryDTO;
import com.fineapple.DTO.OutcomeDTO;
import com.fineapple.DTO.OutcomeViewDTO;

/**
 * @author user
 *
 */
public class OutcomeService {
	
	private OutcomeDAO dao;
	private HttpSession session;
	
	public OutcomeService(HttpSession session) {
		this.dao = new OutcomeDAO();
		this.session = session;
	}
	
	/**
	 * 비용청구시 요구한 사용자에 맞춰 비용 카테고리를 가져오는 서비스 객체
	 * @return 비용 카테고리
	 */
	public ArrayList<OutcomeCategoryDTO> getCategory() {
		
		String departmentSeq = (String) session.getAttribute("departmentSeq");	//세션에서 값 가져오기
		ArrayList<OutcomeCategoryDTO> list = dao.getCategory(departmentSeq);
		return list;
	}
	
	/**
	 * 비용청구서 작성 시 dao로 전달해주는 서비스 객체
	 * @param dto 비용청구서 페이지에서 작성된 내용
	 * @return 성공/실패 여부
	 */
	public int setOutcome(OutcomeDTO dto) {
		return dao.setOutcome(dto);
	}

	/**
	 * 사용자에 맞춰 비용청구 메뉴에서 보여줄 목록을 가져오는 서비스 객체
	 * @return 청구된 목록
	 */
	public ArrayList<OutcomeViewDTO> getOutcome() {
		
		String departmentSeq = (String) session.getAttribute("departmentSeq");	//세션에서 값 가져오기
		ArrayList<OutcomeViewDTO> list = dao.getOutcome(departmentSeq);
		return list;
	}
	
	
}
