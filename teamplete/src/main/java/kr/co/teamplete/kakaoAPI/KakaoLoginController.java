package kr.co.teamplete.kakaoAPI;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.service.LoginService;
import kr.co.teamplete.service.MemberService;

@SessionAttributes({"loginVO"})
@Controller
public class KakaoLoginController {

    @Autowired
    private KakaoRestAPI kakao;
    
	@Autowired
	MemberService service;
	
    
    @RequestMapping(value="/kakaologin")
    public String login(@RequestParam("code") String code, Model model) {
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        MemberVO member = new MemberVO();
        member.setMemberid((String) userInfo.get("email"));
        member.setName((String) userInfo.get("nickname"));
        member.setPassword((String) userInfo.get("kakaoId"));
        member.setEmail((String) userInfo.get("email"));
        member.setKakao('Y');
        member.setStatus("online");
        int temp=member.getLogincount()+1;
        member.setLogincount(temp);
        
        if((String) userInfo.get("thumbnail_image") != null ) {
            member.setProfile((String) userInfo.get("thumbnail_image"));
        }
        
        if(service.checkIdSignUp(member.getMemberid()) == 0) {
        	service.insertMember(member);
        }
       
        //    클라이언트의 이메일이 존재할 때
        if (userInfo.get("email") != null) {
        	
            model.addAttribute("loginVO", member);
            
            return "redirect:/team/" + member.getMemberid();
        } else return "redirect:/";
        
    }


}
