package com.fineapple.DTO;

public class OutcomeViewDTO {

	private String seq;
	private String name;
	private String regDate;
	private int amount;
	private String departmentSeq;
	private String category;
	private String status;
	public String getStatus() {
		return status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDepartmentSeq() {
		return departmentSeq;
	}
	public void setDepartmentSeq(String departmentSeq) {
		this.departmentSeq = departmentSeq;
	}
}