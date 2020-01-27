package kr.co.teamplete.dao;

import java.util.List;

import kr.co.teamplete.dto.CalendarVO;

public interface CalendarDAO {
	
	// 일정 insert
	public void insertCalendar(CalendarVO calendar);
	
	// 팀의 모든 캘린더 select
	public List<CalendarVO> selectAllCalendar(int teamId);
	
	// 특정 캘린더 select
	public CalendarVO selectCalendarById(int calendarId);

}
