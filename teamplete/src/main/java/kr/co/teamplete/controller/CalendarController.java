package kr.co.teamplete.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.teamplete.dto.CalendarVO;
import kr.co.teamplete.service.CalendarService;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService calendarService;
	
	/* 캘린더 등록 */
	@PostMapping("/calendar/write")
	@ResponseBody
	public void insertCalendar(@RequestBody CalendarVO calendar) {
		
		calendarService.insertCalendar(calendar);
		
	}
	
	/* 캘린더 수정 */
	@ResponseBody
	@PutMapping("/calendar/modify")
	public void modifyCalendar(@RequestBody CalendarVO calendar) {
		
		calendarService.modifyCalendar(calendar);
	}
	
	/* 캘린더 삭제 */
	@ResponseBody
	@DeleteMapping("/calendar/delete/{calendarId}")
	public void deleteCalendar(@PathVariable("calendarId") int calendarId) {
		
		calendarService.deleteCalendar(calendarId);
		
	}
}
