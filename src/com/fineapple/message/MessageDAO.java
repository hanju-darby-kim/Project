package com.fineapple.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.MsgReadDTO;
import com.fineapple.DTO.MsgSRDTO;
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
	
	
	
	//보낸쪽지함에 쪽지 저장
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

	//받은쪽지함에 쪽지 저장
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
	
	
	
	//받은쪽지함 출력
	public ArrayList<MsgSRDTO> list(int num) {
		try {
			String sql = "SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber where reademployeenum = ? order by sseq desc";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, num);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));

				list.add(dto);
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//보낸쪽지함 출력
	public ArrayList<MsgSRDTO> slist(int num) {
		
		try {
			String sql = "SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber where sentemployeenum = ? order by sseq desc";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, num);
			ResultSet rs = stat.executeQuery();
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));

				list.add(dto);
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	//보관쪽지함 출력
	public ArrayList<MsgSRDTO> plist(int num) {
		try {
			String sql = "select * from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber) where (sentemployeenum = ? and sentsave = 'Y') or (reademployeenum = ? and readsave = 'Y') order by sseq desc";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, num);
			stat.setInt(2, num);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));

				list.add(dto);
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//업퍼헤더 리스트출력
	public ArrayList<MsgSRDTO> upperlist(int num) {
		try {
			
			String sql = "select * from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber) where reademployeenum = ? and readdate is null order by sseq desc";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, num);
			
			ResultSet rs = stat.executeQuery();
			int cnt = 1;
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));
				
				list.add(dto);
				if (cnt == 5) {
					break;
				}
				cnt++;
				
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	public ArrayList<MsgSRDTO> viewlist(String sseq) {
		try {

			String sql = "select * from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber) where sseq = ? order by sseq desc";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, sseq);
			
			ResultSet rs = stat.executeQuery();
			int cnt = 1;
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));
				
				list.add(dto);
				if (cnt == 5) {
					break;
				}
				cnt++;
				
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<MsgSRDTO> pviewlist(String sseq) {
		try {

			String sql = "select * from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber) where sseq = ? order by sseq desc";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, sseq);
			
			ResultSet rs = stat.executeQuery();
			int cnt = 1;
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));
				
				list.add(dto);
				if (cnt == 5) {
					break;
				}
				cnt++;
				
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}


