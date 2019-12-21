package kr.co.teamplete.controller;

import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.service.LoginService;
import kr.co.teamplete.service.MemberService;


@SessionAttributes({"loginVO"})
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	@Autowired
	private MemberService memberService;
	
	// 스프링 4.3 이상 => GetMapping, PostMapping, PutMapping...
	
	// spring에서 제공하는 session
	// sessionAttribute => login 객체만 request 영역이 아닌 session 영역에 올려달라고 DispatcherServlet에게 요청
	//@Controller 위에  @SessionAttributes({"loginVO"}) 해줘야됨.
	// 이 방식은 로그아웃이 안됨. session 안지워짐 removeAttribute 해도 안지워짐. session 공유영역에 올리는 방식과 다르게 유지하는것. 
	@PostMapping("/login")
	public String login(MemberVO member, Model model) {
				
		MemberVO loginVO = loginService.login(member);
				
		if(loginVO == null) {
			// 로그인 실패
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다");
			return "redirect:/";
		} else {
			// 로그인 성공
			
			int temp=loginVO.getLogincount();
			System.out.println("temp:" + temp);
			loginVO.setLogincount(temp+1);
			loginVO.setStatus("online");
			memberService.updateMember(loginVO);
			model.addAttribute("loginVO", loginVO);
			
			return "redirect:/team/" + member.getMemberid();
		}
	}
	
	
	//세션 정보 삭제
	//SessionStatus객체의 setComplete() 메소드를 사용해서 해제해 주어야함.
	@PostMapping("/logout")
	public String logout(MemberVO member, SessionStatus status) {

		MemberVO logoutVO = memberService.selectMemberById(member.getMemberid());
		logoutVO.setStatus("offline");
		memberService.updateMember(logoutVO);
		status.setComplete();
		
		return "redirect:/";
	}
	
	//회원탈퇴
	@RequestMapping(value="/member/delete/{memberid}", method=RequestMethod.DELETE)
	public void deleteMember(@PathVariable("memberid") String memberid, SessionStatus status) {
		status.setComplete();
		memberService.deleteMember(memberid);
	}
	
}
