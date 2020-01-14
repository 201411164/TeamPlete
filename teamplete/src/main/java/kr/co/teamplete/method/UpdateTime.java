package kr.co.teamplete.method;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class UpdateTime {
	
	public static String updateTime(String date) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		
		Date time = new Date(); //현재시간
		String currentTime = format.format(time);
		Date getTime = null;
		Date ct = null;
		try {
			getTime = format.parse(date);
			ct = format.parse(currentTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    long diff = ct.getTime() - getTime.getTime();

	    String result;
	    long t;
	    
	    if((diff / 86400000) >= 1) {
	    	t = diff / 86400000;
	    	if(t==1) {
	    		result="어제";
	    		return result;
	    	}	    		
	    	result = t + "일 전";
	    }else if((diff / 3600000) >= 1) {
	    	t = diff / 3600000;
	    	result = t + "시간 전";
	    }else {
	    	t = diff / 60000;
	    	if(t<5) {
	    		result="방금 전";
	    		return result;
	    	}
	    	result = t + "분 전";
	    }

	    System.out.println(currentTime);
		return result;
	}
	
	public static long calcLatest(String date1, String date2) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
				
		Date time1 = null;
		Date time2 = null;
		try {
			time1 = format.parse(date1);
			time2 = format.parse(date2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    long diff = time1.getTime() - time2.getTime();

		return diff;
	}


}
