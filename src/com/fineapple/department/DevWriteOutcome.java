package com.fineapple.department;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.OutcomeCategoryDTO;

public class DevWriteOutcome extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		OutcomeService service = new OutcomeService();
		ArrayList<OutcomeCategoryDTO> dto = new ArrayList<OutcomeCategoryDTO>();
		list = service.getCategory(req.getAttribute("departmentSeq"));
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/");
		dispatcher.forward(req, resp);
	}
}