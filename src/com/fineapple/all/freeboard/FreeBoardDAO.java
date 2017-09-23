package com.fineapple.all.freeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.FBCategoryDTO;
import com.fineapple.DTO.FBFileDTO;
import com.fineapple.DTO.FreeBoardDTO;
import com.fineapple.DTO.VFreeBoardDTO;
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
			
			conn.close();
			return categoryList;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null; 
		}
		
	}

	public int addFreeBoard(FreeBoardDTO fbdto) {
		try {
			
			String sql = "INSERT INTO freeboard (seq, empSeq, FBCategory, title, content, readCount, regDate, thread, depth) "
									+ "VALUES (freeBoardSeq.nextVal, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, DEFAULT)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, fbdto.getEmpSeq());
			stat.setString(2, fbdto.getFBCategory());
			stat.setString(3, fbdto.getTitle());
			stat.setString(4, fbdto.getContent());
			
			int result = stat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}

	
	public String getMaxSeq() {
		
		int result = 0; 
		
		//방금 넣은 freeboard 테이블에서의 시퀀스 구하기
		String sql = "SELECT MAX(seq) FROM freeBoard";
		Statement stat;
		String seq = "";
		try {
			stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				seq = rs.getString(1);
			}
			
			rs.close();
			stat.close();
			
			return seq;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//첨부파일 저장
	public int addFile(FreeBoardDTO fbdto) {
		try {
			
			int result = 0;
	
			//첨부파일들 하나하나 집어넣기
			String sql = "INSERT INTO FBFile (seq, FBSeq, orgFileName, fileName) VALUES (FBFileSeq.nextVal, ?, ?, ?)";
			
			//있는 만큼
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

	//view 중 글 불러오기
	public VFreeBoardDTO getContent(String seq) {
		
		try {
			//시퀀스가 넘겨받은 시퀀스와 같은 애를 찾아라
			String sql = "SELECT * FROM VFreeBoard WHERE seq = ?";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			ResultSet rs = pstat.executeQuery();
			
			VFreeBoardDTO dto = new VFreeBoardDTO(); //dto 준비
			
			while (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setName(rs.getString("name"));
				dto.setFbCategory("fbCategory");
				dto.setTitle(rs.getString("title"));
				dto.setContent("content");
				dto.setReadCount(rs.getString("readCount"));
				dto.setThread("thread");
				dto.setDepth("depth");
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
		
	}

	public ArrayList<FBFileDTO> getFiles(String seq) {

		try {
			String sql = "SELECT * FROM fbFile WHERE fbSeq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			
			//fbdto에 넣을 파일 리스트
			ArrayList<FBFileDTO> fileList = new ArrayList<FBFileDTO>();
			
			//여러개일 수 있으니 while로 
			while(rs.next()) {
				FBFileDTO dto = new FBFileDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setFileName(rs.getString("fileName"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				fileList.add(dto);
			}
			
			return fileList;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}

}
