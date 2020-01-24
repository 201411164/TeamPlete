package kr.co.teamplete.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.teamplete.dto.CalendarVO;
import kr.co.teamplete.service.CalendarService;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService calendarService;
	
	@PostMapping("/calendar/write")
	@ResponseBody
	public void insertCalendar(@RequestBody CalendarVO calendar) {
		
		calendarService.insertCalendar(calendar);
		
	}

}
