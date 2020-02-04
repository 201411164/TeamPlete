package kr.co.teamplete.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.RequestVO;
import kr.co.teamplete.method.UpdateTime;
import kr.co.teamplete.service.MemberService;
import kr.co.teamplete.service.RequestService;

@Controller
public class NavbarController {
	
	@Autowired
	private RequestService requestService;
	
	@Autowired
	private MemberService memberService;
	
	
	
	@RequestMapping(value = "/navbar/{memberid:.+}", method = RequestMethod.GET)
	public ModelAndView navbar(@PathVariable("memberid") String memberid) {
		
		// 요청온 시간 계산
		List<String> requestTime = new ArrayList<>();
		
		// 나에게 온 request
		List<RequestVO> allRequestList = requestService.selectAllRequest(memberid);
		
		MemberVO user = memberService.selectMemberById(memberid);
		
		for(RequestVO request : allRequestList) {
			requestTime.add(UpdateTime.updateTime(request.getReqDate()));
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("include/navbar");
		mav.addObject("allRequestList", allRequestList);
		mav.addObject("requestCnt", allRequestList.size());
		mav.addObject("requestTime", requestTime);
		mav.addObject("user", user);
		
		return mav;
	}
	
	
	
}
