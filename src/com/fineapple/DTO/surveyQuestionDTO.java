package com.fineapple.DTO;

public class surveyQuestionDTO {

	private String seq;
	private String surveySeq;
	private String questionNumber;
	private String question;
	private String multiNum;
	private String answerLimit;
	private String requred;
	private String answerTypeSeq;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSurveySeq() {
		return surveySeq;
	}
	public void setSurveySeq(String surveySeq) {
		this.surveySeq = surveySeq;
	}
	public String getQuestionNumber() {
		return questionNumber;
	}
	public void setQuestionNumber(String questionNumber) {
		this.questionNumber = questionNumber;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getMultiNum() {
		return multiNum;
	}
	public void setMultiNum(String multiNum) {
		this.multiNum = multiNum;
	}
	public String getAnswerLimit() {
		return answerLimit;
	}
	public void setAnswerLimit(String answerLimit) {
		this.answerLimit = answerLimit;
	}
	public String getRequred() {
		return requred;
	}
	public void setRequred(String requred) {
		this.requred = requred;
	}
	public String getAnswerTypeSeq() {
		return answerTypeSeq;
	}
	public void setAnswerTypeSeq(String answerTypeSeq) {
		this.answerTypeSeq = answerTypeSeq;
	}
}
