package com.fineapple.position;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Add extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 새글? 답변글? add.do?reply=n&thread=2000&depth=0
		req.setAttribute("reply", req.getParameter("reply"));
		req.setAttribute("thread", req.getParameter("thread"));
		req.setAttribute("depth", req.getParameter("depth"));
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/add.jsp");
		dispatcher.forward(req, resp);
		
	}
}