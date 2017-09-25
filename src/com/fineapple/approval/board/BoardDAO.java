package com.fineapple.approval.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fineapple.DTO.ApprovalBoardDTO;
import com.fineapple.util.DBUtil;
import com.test.board.BoardDTO;


public class BoardDAO {

	private Connection conn = null;	
	public BoardDAO() {
		conn = DBUtil.getConnection();
	}

	//AddOk 서블릿이 글 좀 써달라고 DTO 건네면서 위임	
	public int add(ApprovalBoardDTO dto) {
		try {
			// 10 10 
			String sql = "insert into approvalBoard (seq, name, appovalCategoryNum, subject, regDate, content, readCount, thread, depth, empNum, pw) "
					+ "values (approvalBoardSeq.nextval, ?, ?, ?, default, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getAppovalCategoryNum());
			stat.setString(3, dto.getSubject());
			stat.setString(4, dto.getContent());
			stat.setInt(5, dto.getReadCount());
			stat.setInt(6, dto.getThread());
			stat.setInt(7, dto.getDepth());
			stat.setString(8, dto.getEmpNum());
			stat.setString(9, dto.getPw());
			
			return stat.executeUpdate();//글쓰기
		
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return 0;

	
	}

	
	// View 서블릿이 글 번호를 줄테니 글 1개(DTO)를 달라는 작업.
	public ApprovalBoardDTO get(String seq) {
		try {

			String sql = "SELECT * FROM approvalBoard WHERE SEQ = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				
				ApprovalBoardDTO dto = new ApprovalBoardDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setUserip(rs.getString("userip"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setTag(rs.getString("tag"));
				
				return dto;
				
			}

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return null;
	}
	
}