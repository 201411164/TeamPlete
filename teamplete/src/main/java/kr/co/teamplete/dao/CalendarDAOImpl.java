package kr.co.teamplete.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.CalendarVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void insertCalendar(CalendarVO calendar) {
		session.insert("kr.co.teamplete.dao.CalendarDAO.insertCalendar", calendar);
	}

	@Override
	public List<CalendarVO> selectAllCalendar(int teamId) {
		List<CalendarVO> calendarList = session.selectList("kr.co.teamplete.dao.CalendarDAO.selectAllCalendar", teamId);
		return calendarList;
	}

	@Override
	public CalendarVO selectCalendarById(int calendarId) {
		CalendarVO calendar = session.selectOne("kr.co.teamplete.dao.CalendarDAO.selectCalendarById", calendarId);
		return calendar;
	}

	@Override
	public void modifyCalendar(CalendarVO calendar) {
		// TODO Auto-generated method stub
		session.update("kr.co.teamplete.dao.CalendarDAO.modifyCalendar", calendar);
	}

	@Override
	public void deleteCalendar(int calendarId) {
		// TODO Auto-generated method stub
		session.delete("kr.co.teamplete.dao.CalendarDAO.deleteCalendar", calendarId);
		
	}
	
}
