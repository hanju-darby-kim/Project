package com.fineapple.position;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.tblPositionBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기 
		//2. DB작업(insert) -> DAO 위임
		//3. 결과 출력 -> JSP 위임
		
		//파일 업로드 -> 파일명 얻기 -> insert 
		String path = req.getRealPath("/board/upload");
		int size = 100 * 1024 * 1024;
		
		try {
			//1. 
			req.setCharacterEncoding("UTF-8"); //한글 + POST
			
			// req -> (역할 교체) -> multi
			MultipartRequest multi =new MultipartRequest(
														req, 
														path,		//업로드 폴더 
														size,			//최대크기 
														"UTF-8", 	//인코딩
														new DefaultFileRenamePolicy());
			
			
			//파일 업로드 추가하면서 get방식으로 사용못해 
//			String name = req.getParameter("name");
//			String email = req.getParameter("email");
//			String subject = req.getParameter("subject");
//			String content = req.getParameter("content");
//			String tag = req.getParameter("tag");
//			String pw	= req.getParameter("pw");
			
			String name = multi.getParameter("name");
			String email = multi.getParameter("email");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String tag = multi.getParameter("tag");
			String pw	= multi.getParameter("pw");
			String reply = multi.getParameter("reply");
			String thread = multi.getParameter("thread");
			String depth = multi.getParameter("depth");
			
			//+ 첨부 파일명
			String filename = multi.getFilesystemName("attach");
			String orgfilename = multi.getOriginalFileName("attach");
			
			//2. 
			tblPositionBoardDTO dto = new tblPositionBoardDTO();		//DAO에게 넘기기 위해서 포장
			dto.setName(name);
			dto.setEmail(email);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setTag(tag);
			dto.setPw(pw);
			//dto.setUserip(req.getRemoteAddr()); 			//접속자 IP주소 
			//enc? 고객이 입력한 값이 아니라서 영향을 안받아
			dto.setUserip(req.getRemoteAddr().equals("0:0:0:0:0:0:0:1") ? "127.0.0.1": req.getRemoteAddr());// 접속자 IP 주소
			
			dto.setFilename(filename);
			dto.setOrgfilename(orgfilename);
			
			dto.setReply(reply); // 새글, 답변글 
			if (reply.equals("y")) {
				dto.setThread(Integer.parseInt(thread));//부모꺼
				dto.setDepth(Integer.parseInt(depth));//부모꺼
			}
			
			BoardService service = new BoardService();
			int result = service.add(dto); 	//위임
			
			
			//3. 
			req.setAttribute("result", result); //성공 1, 실패 0 
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/addok.jsp");
		dispatcher.forward(req, resp);
		
	}
}












