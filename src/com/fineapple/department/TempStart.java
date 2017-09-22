package com.fineapple.department;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TempStart extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		session.setAttribute("seq", "1");
		session.setAttribute("name", "김삿갓");
		session.setAttribute("positionSeq", "2");//부장
		session.setAttribute("departmentSeq", "1");//개발부
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/temp.jsp");
		dispatcher.forward(req, resp);
	}
}