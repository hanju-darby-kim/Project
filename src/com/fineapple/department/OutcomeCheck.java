package com.fineapple.department;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.OutcomeViewDTO;

public class OutcomeCheck extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		OutcomeService service = new OutcomeService(req.getSession());
		OutcomeViewDTO dto = new OutcomeViewDTO();
		
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		
		if (departmentSeq == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		}
		
		ArrayList<OutcomeViewDTO> list = service.getOutcome();
		req.setAttribute("list", list);
		
		if (departmentSeq.equals("1")) {	//개발
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/dev/outcome/outcome.jsp");
			dispatcher.forward(req, resp);
		} else if (departmentSeq.equals("2")) {	//인사
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/res/outcome/outcome.jsp");
			dispatcher.forward(req, resp);
		} else if (departmentSeq.equals("3")) {	//총무
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/acc/outcome/outcome.jsp");
			dispatcher.forward(req, resp);
		} else if (departmentSeq.equals("4")) {	//영업
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/mar/outcome/outcome.jsp");
			dispatcher.forward(req, resp);
		} else {
			req.setAttribute("msg", "계정 확인에 실패했습니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);	
		}
	}
}