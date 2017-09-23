package com.fineapple.attendance.etc;

public class AtdWorkRecord_dummy {

    public static void main(String[] args) {
	
	//9월 21일 오전 11시 54분.
	//직원번호는 10~62번.
	//getWrSql(10);
	getWcmSql(10);
}
    
    //직원의 고유번호를 받아서, 8월 동안의 WorkRecord insert 문을 출력한다. 
    //9시 출근, 18시 퇴근
    public static void getWrSql(int employeeSeq) {
	int i = 1;
	
	String seq = "";
	String eseq = employeeSeq+"";
	String comeTime = ""; 
	String leaveTime = ""; 
	
	
	for (i = 1; i <= 31; i++) {
	    
	    seq = i+"";
	    comeTime = String.format("2017-08-%02d 09:00", i);
	    leaveTime = String.format("2017-08-%02d 18:00", i);
	    
	    String insert =
		    String.format("insert into atdWorkRecord (seq, eseq, comeTime, leaveTime) values (%s, %s, to_date('%s', 'yyyy-mm-dd hh24:mi'), to_date('%s', 'yyyy-mm-dd hh24:mi'));",
			    seq, eseq, comeTime, leaveTime); 
	    
	    System.out.println(insert);
	    
	}
    }
    
    //직원의 고유번호를 받아서, 8월 동안의 Work Record에 대해서 정상근무 카테고리를 입힌다. 
    //WrCtgManage insert 문을 출력.
    public static void getWcmSql(int employeeSeq) {
	int i = 1;
	
	String seq = "";
	String wrseq = "";
	String cseq = "1";	//1 -> 정상근무 
	
	
	for (i = 1; i <= 31; i++) {
	    
	    seq = i+"";
	    wrseq = i+"";
	    
	    String insert =
		    String.format("insert into atdWrCtgManage (seq, wrseq, cseq) values (%s, %s, %s);",
			    seq, wrseq, cseq); 
	    
	    System.out.println(insert);
	    
	}
    }
    
}
