package com.fineapple.all.freeboard;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.FBCategoryDTO;
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


	

}
