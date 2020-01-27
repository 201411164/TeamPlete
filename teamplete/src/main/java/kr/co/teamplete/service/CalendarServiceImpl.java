package kr.co.teamplete.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teamplete.dao.CalendarDAO;
import kr.co.teamplete.dto.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private CalendarDAO calendarDAO;

	@Override
	public void insertCalendar(CalendarVO calendar) {
		calendarDAO.insertCalendar(calendar);
	}

	@Override
	public List<CalendarVO> selectAllCalendar(int teamId) {
		List<CalendarVO> calendarList = calendarDAO.selectAllCalendar(teamId);
		return calendarList;
	}

	@Override
	public CalendarVO selectCalendarById(int calendarId) {
		CalendarVO calendar = calendarDAO.selectCalendarById(calendarId);
		return calendar;
	}

}
