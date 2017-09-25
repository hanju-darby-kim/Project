package com.fineapple.message;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.fineapple.DTO.MsgSentDTO;
import com.fineapple.util.DBUtil;

public class MessageDAO {

	//공통업무 Connection 객체 생성
	private Connection conn;
	
	//공통업무 초기작업
	public MessageDAO() {
		try {
			conn = DBUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//공통업무 자원해제
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int add(MsgSentDTO dto) {
		try {
			System.out.println(dto.getSentEmployeeNum());
			System.out.println(dto.getTitle());
			System.out.println(dto.getContent());
			
			String sql = "insert into tblMsgSent (seq, sentEmployeeNum, title, content, sentDate, sentDelete, sentSave) VALUES (msgsentseq.nextval, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, dto.getSentEmployeeNum());
			stat.setString(2, dto.getTitle());
			stat.setString(3, dto.getContent());
			
			return stat.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
}


