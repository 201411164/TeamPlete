package kr.co.teamplete.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teamplete.dto.TaskDateVO;
import kr.co.teamplete.service.TaskDateService;

@Controller
public class TaskDateController {
	
	@Autowired
	private TaskDateService service;

	
	@RequestMapping(value = "calendar/calendar", method = RequestMethod.GET)
	public ModelAndView calendar(ModelAndView mav) {
		
		List<TaskDateVO> taskDate = service.selectAllTask();
		mav = new ModelAndView("calendar/calendar");

		mav.addObject("taskDate", taskDate);
		
		return mav;
	}
	@RequestMapping(value = "/practice", method = RequestMethod.GET)
	public String practice() {
		return "practice";
	}
	@RequestMapping(value = "/drag", method = RequestMethod.GET)
	public String drag() {
		return "drag";
	}

	@RequestMapping(value = "/calendar", method = RequestMethod.POST)
	public String write2(TaskDateVO taskDate) {

		service.insertTask(taskDate);

		return "redirect:/calendar";
	}


}
