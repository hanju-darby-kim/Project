package com.fineapple.department;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.OutcomeDTO;

public class ReadOutcome extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		String seq = req.getParameter("seq");
		
		OutcomeService service = new OutcomeService(session);
		
		if (departmentSeq == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		}
		
		OutcomeDTO dto = service.readOutcome(seq);
		req.setAttribute("dto", dto);
		req.setAttribute("departmentSeq", departmentSeq);
		req.setAttribute("positionSeq", positionSeq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/outcome/read_o.jsp");
		dispatcher.forward(req, resp);
	}
}