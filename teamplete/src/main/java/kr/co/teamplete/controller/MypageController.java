package kr.co.teamplete.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TaskVO;
import kr.co.teamplete.service.MemberService;
import kr.co.teamplete.service.TaskService;
import kr.co.teamplete.service.TeamService;

@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private TeamService service;
	
	@Autowired
	private TaskService taskService;
	
	
	
	@RequestMapping(value="/mypage/{loginVO.memberid}", method=RequestMethod.GET)
	public ModelAndView mypage(@PathVariable("loginVO.memberid") String memberid) {
		ModelAndView mav = new ModelAndView();
		
		
		
		  Map<String, Object> map = new HashMap<>(); List<TaskVO> notSubmitMyTask =
		  taskService.notSubmitMyTaskAll(memberid);
		  
		  
		  
		  map.put("notSubmitMyTask", notSubmitMyTask);
		  mav.addAllObjects(map);
		  mav.setViewName("mypage/mypage");
		
		return mav;
	}

}
