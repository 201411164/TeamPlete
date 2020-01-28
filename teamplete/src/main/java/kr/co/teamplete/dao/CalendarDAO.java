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
	
	// 캘린더 수정
	public void modifyCalendar(CalendarVO calendar);
	
	// 캘린더 삭제
	public void deleteCalendar(int calendarId);
	
}
