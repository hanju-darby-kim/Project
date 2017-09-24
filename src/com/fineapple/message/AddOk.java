package com.fineapple.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.MsgSentDTO;

public class AddOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1)
		req.setCharacterEncoding("UTF-8"); //한글을 POST으로 넘길때
//		System.out.println(req.getParameter("title"));
//		System.out.println(req.getParameter("content"));
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		//2)
		MsgSentDTO dto = new MsgSentDTO();
		dto.setTitle(title);
		dto.setContent(content);
		
		MessageService service = new MessageService();
		int result = service.add(dto);
		req.setAttribute("result", result);//성공 1, 실패 0
		
		//3)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/addok.jsp");
		dispatcher.forward(req, resp);
		
	}
}

