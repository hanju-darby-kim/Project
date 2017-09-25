package com.fineapple.DTO;

public class surveyAnswerDTO {
	private String seq;
	private String surveyQuestionSeq;
	private String surveyMultiChoiceSeq;
	private String descriptiveAnswer;
	private String regDate;
	private String empSeq;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSurveyQuestionSeq() {
		return surveyQuestionSeq;
	}
	public void setSurveyQuestionSeq(String surveyQuestionSeq) {
		this.surveyQuestionSeq = surveyQuestionSeq;
	}
	public String getSurveyMultiChoiceSeq() {
		return surveyMultiChoiceSeq;
	}
	public void setSurveyMultiChoiceSeq(String surveyMultiChoiceSeq) {
		this.surveyMultiChoiceSeq = surveyMultiChoiceSeq;
	}
	public String getDescriptiveAnswer() {
		return descriptiveAnswer;
	}
	public void setDescriptiveAnswer(String descriptiveAnswer) {
		this.descriptiveAnswer = descriptiveAnswer;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
}
