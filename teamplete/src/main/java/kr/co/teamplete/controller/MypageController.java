package kr.co.teamplete.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	private MemberService service;
	
	// 개인 정보 수정시 비밀번호 확인
	@RequestMapping(value="/checkPW", method=RequestMethod.POST)
	public @ResponseBody String checkPW(@RequestParam("memberid") String memberid, @RequestParam("password") String password) {
		
		Map<String, String> hm = new HashMap<>();
		
		hm.put("memberid", memberid);
		hm.put("password", password);
		
		int count = service.checkPw(hm);
		
		return String.valueOf(count);
	}
	
	// 개인 정보 수정
	@ResponseBody
	@RequestMapping(value = "/mypage/modify", method = RequestMethod.PUT)
	public void modifyMemberInfo(@RequestBody MemberVO member) {
		service.modifyMemberInfo(member);
	}
}
