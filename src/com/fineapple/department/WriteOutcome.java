package com.fineapple.department;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.OutcomeCategoryDTO;

public class WriteOutcome extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		OutcomeService service = new OutcomeService(req.getSession());
		OutcomeCategoryDTO dto = new OutcomeCategoryDTO();

		ArrayList<OutcomeCategoryDTO> list = service.getCategory();
		req.setAttribute("list", list);
		req.setAttribute("dto", dto);
		
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		
		if (departmentSeq == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);	
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/outcome/write_o.jsp");
		dispatcher.forward(req, resp);	
	}
}