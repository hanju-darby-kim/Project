package com.fineapple.all.freeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.FBCategoryDTO;
import com.fineapple.DTO.FBFileDTO;
import com.fineapple.DTO.FreeBoardDTO;
import com.fineapple.util.DBUtil;

public class FreeBoardDAO {

	Connection conn;
	
	public FreeBoardDAO() {
		conn = DBUtil.getConnection();
	}
	
	public ArrayList<FBCategoryDTO> getCategory() {
	
		try {
			
			String sql = "SELECT * FROM FBCategory";
			Statement stat = conn.createStatement();
			
			ResultSet rs = stat.executeQuery(sql);
			
			ArrayList<FBCategoryDTO> categoryList = new ArrayList<FBCategoryDTO>();

			while (rs.next()) {
				FBCategoryDTO dto = new FBCategoryDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				categoryList.add(dto);
			}
			
			
			return categoryList;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null; 
		}
		
	}

	public int addFile(FreeBoardDTO fbdto) {
		try {
			
			String sql = "INSERT INTO freeboard (seq, empSeq, FBCategory, title, content, readCount, regDate, thread, depth) "
									+ "VALUES (freeBoardSeq.nextVal, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, DEFAULT)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, fbdto.getEmpSeq());
			stat.setString(2, fbdto.getFBCategory());
			stat.setString(3, fbdto.getTitle());
			stat.setString(4, fbdto.getContent());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}

	public int addFreeBoard(FreeBoardDTO fbdto) {
		try {
			
			int result = 0; 
			
			//방금 넣은 freeboard 테이블에서의 시퀀스 구하기
			String sql = "SELECT MAX(seq) FROM freeBoard";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				fbdto.setSeq(rs.getString(1));
			}
			
			
			//첨부파일들 하나하나 집어넣기
			sql = "INSERT INTO FBFile (seq, FBSeq, orgFileName, fileName) VALUES (FBFileSeq.nextVal, ?, ?, ?)";
			
			for (FBFileDTO filedto : fbdto.getFileList()) {
				PreparedStatement pstat = conn.prepareStatement(sql);
				pstat.setString(1, fbdto.getSeq());
				pstat.setString(2, filedto.getOrgFileName());
				pstat.setString(3, filedto.getFileName());
				result = pstat.executeUpdate();
			}
			
			return result;
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}


	

}
