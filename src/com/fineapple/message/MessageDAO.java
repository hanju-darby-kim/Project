package com.fineapple.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.MsgReadDTO;
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
	
	
	
	public int sAdd(MsgSentDTO sdto) {
		try {
			
			String sql = "insert into tblMsgSent (seq, sentEmployeeNum, title, content, sentDate, sentDelete, sentSave) VALUES (msgsentseq.nextval, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, sdto.getSentEmployeeNum());
			stat.setString(2, sdto.getTitle());
			stat.setString(3, sdto.getContent());
			
			return stat.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	
	
	public int rAdd(MsgReadDTO rdto) {
		try {
			String sql = "select max(seq) as num from tblmsgsent";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			rs.next();
			int msgNum = rs.getInt("num");
			
			sql = "insert into tblMsgRead (seq, msgNumber, readEmployeeNum, readDate, readDelete, readSave) VALUES (msgreadseq.nextval, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setInt(1, msgNum);
			pstat.setInt(2, 15);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	
	
	public ArrayList<MsgSentDTO> list(int num) {
		
		return null;
	}

	public ArrayList<MsgSentDTO> slist(int num) {
		
		try {
			String sql = String.format("select * from tblmsgsent where sentemployeenum = %d order by seq desc", num);
			
			PreparedStatement stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			
			ArrayList<MsgSentDTO> list = new ArrayList<MsgSentDTO>();
			while (rs.next()) {
				MsgSentDTO dto = new MsgSentDTO();
				
				dto.setSeq(rs.getInt("seq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				list.add(dto);
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

}


