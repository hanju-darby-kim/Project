package com.fineapple.department;

import javax.servlet.http.HttpSession;

public class OutcomeService {
	
	private OutcomeDAO dao;
	private HttpSession session;
	
	public void OutcomeService() {
		this.dao = new OutcomeDAO();
	}
	
	
}
