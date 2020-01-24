package kr.co.teamplete.dao;

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
	
}
