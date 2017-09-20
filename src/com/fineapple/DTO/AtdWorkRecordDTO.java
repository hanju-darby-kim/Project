package com.fineapple.dto;

/**
 * @author hanjukim
 *
 * 직원의 근태기록을 다루는 DTO
 */


public class AtdWorkRecordDTO {
    
    private int seq;			//고유번호
    private int eseq;			//직원 고유번호
    private int cseq;			//근태유형 고유번호(정상근무, 지각, 조퇴 등)
    private String date;		//날짜
    private String comeTime;		//출근시각
    private String leaveTime;		//퇴근시각
    
    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public int getEseq() {
        return eseq;
    }
    public void setEseq(int eseq) {
        this.eseq = eseq;
    }
    public int getCseq() {
        return cseq;
    }
    public void setCseq(int cseq) {
        this.cseq = cseq;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getComeTime() {
        return comeTime;
    }
    public void setComeTime(String comeTime) {
        this.comeTime = comeTime;
    }
    public String getLeaveTime() {
        return leaveTime;
    }
    public void setLeaveTime(String leaveTime) {
        this.leaveTime = leaveTime;
    }    
}
