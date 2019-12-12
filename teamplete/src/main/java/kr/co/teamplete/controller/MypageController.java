package kr.co.teamplete.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
		
		return "mypage/mypage";
	}

}
