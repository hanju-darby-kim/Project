package com.fineapple.department;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TempStart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("seq", "1");
		req.setAttribute("name", "김삿갓");
		req.setAttribute("positionSeq", "2");//부장
		req.setAttribute("departmentSeq", "1");//개발부
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/temp.jsp");
		dispatcher.forward(req, resp);
	}
}