package com.fineapple.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println(req.getParameter("content"));
		System.out.println("안녕하세요");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/jaejun/addok.jsp");
		dispatcher.forward(req, resp);
		
	}
}

