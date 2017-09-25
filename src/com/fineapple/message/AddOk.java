package com.fineapple.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.MsgReadDTO;
import com.fineapple.DTO.MsgSentDTO;

public class AddOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//세션 객체 얻어오기
		HttpSession session = req.getSession();
		int num = (int)session.getAttribute("num");
		
		//1) add.jsp 에서 보낸 값 받기 
		req.setCharacterEncoding("UTF-8"); //한글을 POST방식으로 받을때
//		System.out.println(req.getParameter("title"));
//		System.out.println(req.getParameter("content"));
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		//2) tblMsgSent에 값 쓰기
		MsgSentDTO sdto = new MsgSentDTO();
		sdto.setTitle(title);
		sdto.setContent(content);
		sdto.setSentEmployeeNum(num);
		
		MessageService service = new MessageService();
		int sresult = service.sAdd(sdto);
		req.setAttribute("sresult", sresult); //성공 1, 실패 0
		
		//3) tblMsgRead에 값 쓰기
		MsgReadDTO rdto = new MsgReadDTO();
		int rresult = service.rAdd(rdto);
		req.setAttribute("rresult", rresult); //성공 1, 실패 0
		
		//4)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/addok.jsp");
		dispatcher.forward(req, resp);
		
	}
}

