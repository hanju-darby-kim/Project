package com.fineapple.position;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.fineapple.util.DBUtil;

public class BoardDAO {
	
	private Connection conn;
	
	//초기 작업 
	public BoardDAO()  {
		try {
			conn = DBUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//boardDAO
	
	//자원해제 
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//close 

	
	// 컨트롤러 요청 -> Service 객체가 글써달라고 요청 -> dao호출
	public int add(BoardDTO dto) {
	
		try {
			String sql = "insert into tblBoard (seq, name, email, subject, content, tag,pw, readCount, regDate, userip, filename, orgfilename, thread, depth) values (boardSeq.nextVal, ?, ?, ?, ?, ?, ?, default, default, ?, ?, ?, ?, ?)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getEmail());
			stat.setString(3, dto.getSubject());
			stat.setString(4, dto.getContent());
			stat.setString(5, dto.getTag());
			stat.setString(6, dto.getPw());
			stat.setString(7, dto.getUserip());
			stat.setString(8, dto.getFilename());
			stat.setString(9, dto.getOrgfilename());
			stat.setInt(10, dto.getThread());
			stat.setInt(11, dto.getDepth());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}

	//서비스객체가 글 목을 가져와 달라고 요청
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			// rs -> list 복사
			/*
				유지 보수가 힘들어 
			 	if (map.get("isSearch").equals("n")) {
					sql = "select seq, name, subject, readCount, regDate, round((sysdate - regDate) * 24* 60) as gap  from tblBoard order by regDate desc";
				} else {
					sql = "select seq, name, subject, readCount, regDate, round((sysdate - regDate) * 24* 60) as gap  from 조건절 tblBoard order by regDate desc";
			}
			*/
			String sql ="";
			String where = "";
			
			if (map.get("isSearch").equals("y")) {
				where = String.format("where %s like '%%%s%%'", map.get("column"), map.get("word"));
			}
			
			//sql = String.format("select seq, name, subject, readCount, regDate, round((sysdate - regDate) * 24* 60) as gap, commentCount  from tblBoard %s order by seq desc", where);
			
			sql = String.format("SELECT * FROM (SELECT a.*, rownum as rnum from (select seq, name, subject, readCount, regDate, round((sysdate - regDate) * 24* 60) as gap, commentCount, filename, depth  from tblBoard %s order by thread desc) a ) WHERE rnum >= %s and rnum <= %s", where, map.get("start"), map.get("end"));
			
			PreparedStatement stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			
			//큰 상자 (테이블)
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			//여기서 발생하는 여러가지 에러 확인!! 
			
			
			//rs -> list 복사
			while (rs.next()) {
				//레코트 1개 -> DTO 1개
				//작은 상자(레코드)
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setFullSubject(rs.getString("Subject"));		//제목 2번 담기
				dto.setReadCount(rs.getInt("readCount"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setGap(rs.getInt("gap")); 		//글쓴시간이 얼마나 지났는지 (분)
				dto.setCommentCount(rs.getInt("commentCount"));	//댓글수
				dto.setFilename(rs.getString("filename"));
				dto.setDepth(rs.getInt("depth"));
				
				list.add(dto);
				
			}//while
			
			return list;
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
	}

	
	//Service 객체가 글 번호를 주면서 레코드 1개를 달라고 요청
	
	public BoardDTO get(String seq) {
		try {
			
			String sql = "select * from tblBoard where seq = ?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();		//원본
			BoardDTO dto = new BoardDTO();		// 복사본 
			
			if (rs.next()) {
				//레코드 1개 -> DTO 1개 복사 
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setTag(rs.getString("tag"));
				dto.setPw(rs.getString("pw"));
				dto.setReadCount(rs.getInt("readCount"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setUserip(rs.getString("userip"));
				
				dto.setFilename(rs.getString("filename"));
				dto.setOrgfilename(rs.getString("orgfilename"));
				dto.setFileCount(rs.getInt("filecount"));
				
				dto.setThread(rs.getInt("thread"));
				dto.setDepth(rs.getInt("depth"));
			}
			
			System.out.println(dto);//모든 값 출력 
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
	//Service 객체가 글 번호를 줄 테니 조회수 증가시켜달라고 요청 
	public void addReadCount(String seq) {

		try {
			 String sql = "update tblBoard set readCount = readCount + 1 where seq = ?";
			 
			 PreparedStatement stat = conn.prepareStatement(sql);
			 stat.setString(1, seq);
			 
			 stat.executeQuery(); 	//조회수 증가 
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	//Service 객체가 DTO 건내줄테니 글 수정해 달라고 요청 
	public int edit(BoardDTO dto) {
		
		try {
			String sql = "update tblBoard set name=?, email=?, subject=?, content=?, tag=? where seq=?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getEmail());
			stat.setString(3, dto.getSubject());
			stat.setString(4, dto.getContent());
			stat.setString(5, dto.getTag());
			stat.setString(6, dto.getSeq());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//Service 객체가 글번호 + 암호 줄테니깐 맞는지 검사해달라고 요청 
	public boolean check(BoardDTO dto) {
		
		try {
			
			String sql = "select count(*) from tblBoard where seq= ? and pw = ?"; //1, 0
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSeq());
			stat.setString(2, dto.getPw());
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				if (rs.getInt(1) == 1) return true;		//암호 일치
				else return false; 		// 암호 틀림 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	
	// Service 객체가 글 삭제해달라고 요청 
	public int del(BoardDTO dto) {
		
		//edit() -> del() 복사
		
		try {
			String sql = "delete from tblBoard where seq=?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSeq());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//Service 객체가 댓글 줄테니 insert 요청 
	
	public int addComment(CommentDTO cdto) {

		try {
			
			String sql = "insert into tblComment (seq, name, comments, regDate, bseq) values (commentSeq.nextVal, ?, ?, default, ?)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			
			stat.setString(1, cdto.getName());
			stat.setString(2, cdto.getComments());
			stat.setString(3, cdto.getBseq());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	//Service가 글과 함께 댓글 목록도 달라고 요청
	public ArrayList<CommentDTO> listComment(String seq) {

		try {
			
			String sql = "select * from tblComment where bseq= ? order by regDate desc";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq); //부모 글번호 
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<CommentDTO> clist = new ArrayList<>();
			
			while (rs.next()) {
				//레코드 1개 -> DTO 1개
				CommentDTO dto = new CommentDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setComments(rs.getString("comments"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setBseq(rs.getString("bseq"));
				
				clist.add(dto);
				
			}
			
			return clist;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//Service가 댓글 번호를 줄테니 삭제해달라고 요청 
	public int detComment(String seq) {

		try {
			
			String sql = "delete from tblComment where seq =?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			int result = stat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	
	//Service가 부모 글번호를 줄테니 그 글에 딸린 모든 댓글을 삭제 
	public void delCommentAll(String seq) {

	try {
			
			String sql = "delete from tblComment where bseq =?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			stat.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// Service가 부모 댓글 수를 업데이트해달라고 요청 
	public void updateCommentCount(String bseq, int i) {
		try {
			
			String sql = "update tblBoard set commentCount = commentCount + ? where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, i);
			stat.setString(2, bseq);
			
			stat.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getTotalCount(HashMap<String, String> map) {
		try {
			
			String where = "";
			
			if (map.get("isSearch").equals("y")) {
				where = String.format("where %s like '%%%s%%'", map.get("column"), map.get("word"));
			}
			
			String sql = "select count(*) from tblBoard " + where;
			
			Statement stat = conn.createStatement();
			
			ResultSet rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	//Service가 글번호를 건내면서 다운로드 횟수가 증가해달라고 요청 
	public void addFileCount(String seq) {
		
	try {
			
			String sql = "update tblBoard set fileCount = fileCount + 1 where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			stat.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// Service 객체가 가장 큰 thread 값 + 1000을 달라고 요청 
	public int getThread() {

		try {
			
			String sql ="select nvl(max(thread), 0) + 1000 from tblBoard";
			
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//Service 객체가 부모글 ~ 이전 새글 thread값을 -1 업데이트 요청
	public void updateThread(int parentThread, int prevThread) {

		try {
			
			//thread값이 중복되지 않도록? <- thread 정렬하는데 사용하기 때문에 
			String sql = "update tblBoard set thread = thread - 1 where thread > ? and thread < ?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, prevThread);
			stat.setInt(2, parentThread);
			
			stat.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
}











