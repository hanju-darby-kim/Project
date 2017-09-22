package com.fineapple.department;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fineapple.DTO.OutcomeCategoryDTO;
import com.fineapple.DTO.OutcomeDTO;
import com.fineapple.DTO.OutcomeViewDTO;
import com.fineapple.util.DBUtil;

/**
 * @author 박의영
 *
 */
public class OutcomeDAO {

	private Connection conn; 
	
	/**
	 * 생성자(DB 연결)
	 */
	public OutcomeDAO() {
		try {
			conn = DBUtil.getConnection();			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.OutcomeDAO ###");
		}
	}
	
	/**
	 * 
	 */
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 현재 사용자의 부서에 따라 비용청구서 작성시 보여줄 비용카테고리를 제한해서 돌려줌
	 * @param departmentSeq 세션에서 가져온 부서번호
	 * @return 비용카테고리
	 */
	public ArrayList<OutcomeCategoryDTO> getCategory(String departmentSeq) {
		try {
			String sql = "select * from tblOCategory";
			Statement stat = conn.createStatement();
			
			ArrayList<OutcomeCategoryDTO> list = new ArrayList<OutcomeCategoryDTO>();
			
			ResultSet rs = stat.executeQuery(sql);
			
			int count = 1;
			
			if (departmentSeq.equals("3")) {	//인사부에서 요청한 경우에만 모든 카테고리를 제공
				while (rs.next()) {
					OutcomeCategoryDTO dto = new OutcomeCategoryDTO();
					dto.setSeq(rs.getString("seq"));	//카테고리 번호
					dto.setName(rs.getString("name"));//카테고리 이름
					
					list.add(dto);
				}								
			} else {	//기타 부서에서 요청시 5번까지만 제공
				while (rs.next()) {
					OutcomeCategoryDTO dto = new OutcomeCategoryDTO();
					dto.setSeq(rs.getString("seq"));	//카테고리 번호
					dto.setName(rs.getString("name"));//카테고리 이름
					
					list.add(dto);
					if (count == 5) break;
					count++;
				}
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.getCategory ###");
			return null;
		}
	}
	
	/**
	 * 사용자의 부서에 따라 비용청구서 작성 후 DB에 기록
	 * @param dto 비용청구서 내용
	 * @return 성공/실패 여부
	 */
	public int setOutcome(OutcomeDTO dto) {
		try {
			String sql = "insert into tblOutcome (seq, empSeq, cSeq, regDate, content, amount) values (outcomeSeq.nextVal, ?, ?, default, ?, ?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getEmpSeq());	//작성자
			stat.setString(2, dto.getcSeq());	//카테고리 번호
			stat.setString(3, dto.getContent());	//내용
			stat.setInt(4, dto.getAmount());	//금액
			
			return stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.setOutcome ###");
			return 0;
		}
	}
	
	/**
	 * 사용자의 부서에 따라 비용청구서의 목록을 반환 
	 * @param departmentSeq 사용자의 부서번호
	 * @return 비용청구서 목록
	 */
	public ArrayList<OutcomeViewDTO> getOutcome(String departmentSeq) {
		try {
			String sql = "select * from vOutcome where departmentSeq = ? order by regDate desc";	//부서번호와 작성일순 정렬
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, departmentSeq);
			
			ArrayList<OutcomeViewDTO> list = new ArrayList<OutcomeViewDTO>();
			
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				OutcomeViewDTO dto = new OutcomeViewDTO();
				dto.setSeq(rs.getString("seq"));	//지출내역서 번호
				dto.setName(rs.getString("name"));	//작성자
				dto.setRegDate(rs.getString("regDate"));	//작성일
				dto.setAmount(rs.getInt("amount"));	//금액
				dto.setDepartmentSeq(rs.getString("departmentSeq"));	//부서 번호
				dto.setCategory(rs.getString("category"));	//지출 카테고리
				
				System.out.println(dto.getSeq());
				System.out.println(dto.getName());
				System.out.println(dto.getRegDate());
				System.out.println(dto.getAmount());
				System.out.println(dto.getDepartmentSeq());
				System.out.println(dto.getCategory());
				
				String status = rs.getString("etc");	//현황
				if (status == null) {	//부서장 대기
					dto.setStatus("부서장 대기");
				} else if (status.equals("1")) {	//부서장 반려
					dto.setStatus("부서장 반려");
				} else if (status.equals("2")) {	//부서장 승인
					dto.setStatus("부서장 승인");
				} else if (status.equals("3")) {	//총무부 반려
					dto.setStatus("총무부 반려");
				} else if (status.equals("4")) {	//총무부 승인
					dto.setStatus("총무부 승인");
				}
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.getOutcome ###");
			return null;
		}
	}

}
