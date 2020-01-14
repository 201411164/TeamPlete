package kr.co.teamplete.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	
	@RequestMapping(value="/mypage/{memberVO.memberid}", method=RequestMethod.GET)
	public ModelAndView mypage(@PathVariable("memberVO.memberid") String memberid) {
		ModelAndView mav = new ModelAndView();
		
		  MemberVO user = new MemberVO();
		  
		  user = memberService.selectMemberById(memberid);
		
		  Map<String, Object> map = new HashMap<>(); 
		  List<TaskVO> notSubmitMyTaskAll = taskService.notSubmitMyTaskAll(memberid);
		  
		  map.put("notSubmitMyTaskAll", notSubmitMyTaskAll);
		  map.put("user", user);
		  mav.addAllObjects(map);
		  mav.setViewName("mypage/mypage");
		
		return mav;
	}
	
	// 개인 정보 수정시 비밀번호 확인
	@RequestMapping(value="/checkPW", method=RequestMethod.POST)
	public @ResponseBody String checkPW(@RequestParam("memberid") String memberid, @RequestParam("password") String password) {
		
		Map<String, String> hm = new HashMap<>();
		
		hm.put("memberid", memberid);
		hm.put("password", password);
		
		int count = memberService.checkPw(hm);
		
		return String.valueOf(count);
	}

}
