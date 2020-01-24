package kr.co.teamplete.service;

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

}
