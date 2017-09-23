package com.fineapple.attendance.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Community extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/attendance/community.jsp");
	dispatcher.forward(req, resp);

	
	
    }
}