package kr.co.teamplete.method;

import java.util.Calendar;

public class Deadline {
	
	// 남은 제출 기한 구하기
	public static String deadline(String deadline) {

		if (deadline != null) {
			String[] words = deadline.split("-");
			try {
				Calendar today = Calendar.getInstance(); // 오늘 날짜
//				System.out.println("오늘날짜: " + today);
				Calendar dday = Calendar.getInstance();

				dday.set(Integer.parseInt(words[0]), Integer.parseInt(words[1]) - 1, Integer.parseInt(words[2]));
//				System.out.println("dday 날짜: " + dday);

				long calDay = (dday.getTimeInMillis() - today.getTimeInMillis()) / 86400000;
				long calDay2= (today.getTimeInMillis() - dday.getTimeInMillis()) / 86400000;

				if (calDay < 0)
					
					return   Long.toString(calDay2) + "일 초과";
				else if (calDay == 0)
					return "오늘";
				else
					return Long.toString(calDay) + "일 남음";

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "마감기한 없음";
	}

}
