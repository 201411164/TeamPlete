package kr.co.teamplete.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
//	public String joinForm(Model model) {
//		
//		MemberVO member = new MemberVO();
//		
//		model.addAttribute("memberVO", member);
//		
//		return "member/joinForm";
//	}
	public String joinForm(@ModelAttribute("memberVO") MemberVO member) {
				
		return "member/joinForm";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String join(@Valid MemberVO member, BindingResult result) {
		
		//System.out.println(member);
		
		// 에러가 발생하면
		if(result.hasErrors()) {
			//System.out.println("오류발생...");
			return "member/joinForm";
		}	
		
		
		if(member.getProfile()=="")
		{
			List<String> imgList = new ArrayList<>();
			imgList.add("circle1.png");
			imgList.add("circle2.png");
			imgList.add("circle3.png");
			imgList.add("circle4.png");
			imgList.add("circle5.png");
			
			
			Random random = new Random();
			int index = random.nextInt(imgList.size()); // (0 ~ imgList.size()-1)
			member.setProfile(imgList.get(index));
		}
		
		
		service.insertMember(member);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/checkSignUp", method=RequestMethod.POST)
	public @ResponseBody String checkSignUp(@RequestParam("idCheck") String id) {
		int rowcount = service.checkIdSignUp(id);
		return String.valueOf(rowcount);
	}

}
