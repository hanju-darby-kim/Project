package com.fineapple.dummy;

public class AtdWorkRecord_dummy {

    public static void main(String[] args) {
	
	int i = 1;
	
	String seq = "";
	String eseq = "10";
	String cseq = "1";
	String comeTime = ""; 
	String leaveTime = ""; 
	
	
	for (i = 1; i <= 31; i++) {
	    
	    seq = i+"";
	    comeTime = String.format("2017-08-%02d 09:00", i);
	    leaveTime = String.format("2017-08-%02d 18:00", i);
	    
	    String insert =
		    String.format("insert into atdWorkRecord (seq, eseq, cseq, comeTime, leaveTime) values (%s, %s, %s, to_char('%s', 'yyyy-mm-dd hh:mi'), to_char('%s', 'yyyy-mm-dd hh:mi'));",
			    seq, eseq, cseq, comeTime, leaveTime); 
	    
	    System.out.println(insert);
	    
	}
	
	
	
	
	
	
		
		
		
	
    }
}
