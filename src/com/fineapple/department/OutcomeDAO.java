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
	 * 사용자에 따라 비용청구서를 DB에 기록
	 * @param dto 비용청구서 내용
	 * @param positionSeq 청구서를 작성한 사용자의 직급
	 * @param departmentSeq 청구서를 작성한 사용자의 부서
	 * @return 성공/실패 여부
	 */
	public int setOutcome(OutcomeDTO dto, String positionSeq, String departmentSeq) {
		try {
			String sql = "";
			if (positionSeq.equals("1") || (positionSeq.equals("2") && departmentSeq.equals("3"))) {	//사장 혹은 총무부 부장이 청구서를 작성한 경우
				sql = "insert into tblOutcome (seq, empSeq, cSeq, regDate, content, amount, etc) values (outcomeSeq.nextVal, ?, ?, default, ?, ?, 3)";
			} else if (positionSeq.equals("2")) {	//타 부서의 장이 청구서를 작성한 경우
				sql = "insert into tblOutcome (seq, empSeq, cSeq, regDate, content, amount, etc) values (outcomeSeq.nextVal, ?, ?, default, ?, ?, 2)";
			} else {	//기타 사원이 청구서를 작성한 경우
				sql = "insert into tblOutcome (seq, empSeq, cSeq, regDate, content, amount) values (outcomeSeq.nextVal, ?, ?, default, ?, ?)";				
			}
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
				dto.setStatus(rs.getString("etc"));	//현황
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.getOutcome ###");
			return null;
		}
	}

	/**
	 * 요청된 비용청구서 1장을 돌려줌
	 * @param seq 비용청구서 번호
	 * @param departmentSeq 읽기를 요청한 사용자의 부서번호
	 * @return 비용청구서 1장 DTO
	 */
	public OutcomeDTO readOutcome(String seq, String departmentSeq) {
		try {
			String sql = "select * from vOutcomeRead where seq = ? and departmentSeq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			stat.setString(2, departmentSeq);
			
			OutcomeDTO dto = new OutcomeDTO();
			
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));	//번호
				dto.setEmpSeq(rs.getString("name"));	//작성자
				dto.setRegDate(rs.getString("regDate"));	//작성일
				dto.setContent(rs.getString("content"));	//내용
				dto.setAmount(rs.getInt("amount"));	//금액
				dto.setcSeq(rs.getString("category"));	//종류
				dto.setConDate(rs.getString("conDate"));	//승인일
				dto.setEtc(rs.getString("etc"));	//현황
			}
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.readOutcome ###");
			return null;
		}
	}

	/**
	 * 부서장의 비용청구서 승인
	 * @param seq 비용청구서 번호
	 * @param positionSeq 승인한 부서장의 직급
	 * @param departmentSeq 승인한 부서장의 부서
	 * @param confirm 승인/반려 여부
	 * @return 결과 반환
	 */
	public int setOutcomeConfirm(String seq, String departmentSeq, String positionSeq, String confirm) {
		try {
			String sql = "update tblOutcome set etc = ? where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			
			if (confirm.equals("yes")) {	//승인한 경우
				//사장 혹은 총무부서장이 승인한 경우
				if (positionSeq.equals("1") || positionSeq.equals("2") && departmentSeq.equals("3")) {
					stat.setString(1, "3");
				//기타 부서장이 승인한 경우
				} else {
					stat.setString(1, "2");
				}
				stat.setString(2, seq);
			} else {	//반려한 경우
				stat.setString(1, "1");
				stat.setString(2, seq);
			}
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.setOutcomeConfirm ###");
			return 0;
		}
	}
}