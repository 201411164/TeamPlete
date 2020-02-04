package kr.co.teamplete.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.ProfileVO;
import kr.co.teamplete.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	
	// 개인 정보 수정시 비밀번호 확인
	@RequestMapping(value="/checkPW", method=RequestMethod.POST)
	public @ResponseBody String checkPW(@RequestParam("memberid") String memberid, @RequestParam("password") String password) {
		
		Map<String, String> hm = new HashMap<>();
		
		hm.put("memberid", memberid);
		hm.put("password", password);
		
		int count = memberService.checkPw(hm);
		
		return String.valueOf(count);
	}
	
	// 개인 정보 수정
	@ResponseBody
	@RequestMapping(value = "/mypage/modify", method = RequestMethod.PUT)
	public void modifyMemberInfo(@RequestBody MemberVO member) {
		
		MemberVO memberDetail = memberService.selectMemberById(member.getMemberid());
		
		if(memberDetail.getKakao() == 'N') {
//			System.out.println("일반로그인입니다. Kakao: " + memberDetail.getKakao());
			memberService.modifyMemberInfo(member);
		}
		else {
//			System.out.println("카카오 로그인입니다. Kakao: " + memberDetail.getKakao());
			memberService.modifyKakaoInfo(member);
		}
	}
	
	
	// 개인 등급 수정
	@ResponseBody
	@RequestMapping(value = "/mypage/updatetype", method = RequestMethod.PUT)
	public void updateType(@RequestBody MemberVO member) {
		memberService.updateType(member);
	}
	
	
	
	// 프로필 수정(insert)
	@RequestMapping(value = "/mypage/profile", method = RequestMethod.POST)
	public String modifyProfile(String pid, MultipartFile pfile) {
		
		Map<String, String> hm = new HashMap<>();
		
		ProfileVO profile = null;
		
		try {
			profile = memberService.getProfileInfo(pid, pfile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//checkProfile로 insert 할지 update할지 결정(일단 insert만)
		int profileCnt = memberService.checkProfile(pid);
		System.out.println("프로필 업로드 확인 cnt: " + profileCnt);
		
		if(profileCnt == 0) {
			memberService.insertProfile(profile);
		} else {
			memberService.modifyProfile(profile);
		}
		
		
		hm.put("memberid", pid);
		hm.put("profile", profile.getFilePath());
		
		memberService.updateProfile(hm);
		
		return "redirect:/mypage";
	}
	
	//프로필 수정(기본이미지로 변경)
	@RequestMapping(value = "/mypage/delProfile/{pid:.+}", method = RequestMethod.DELETE)
	public void deleteProfile(@PathVariable("pid") String pid) {
		
		List<String> imgList = new ArrayList<>();
		imgList.add("circle1.png");
		imgList.add("circle2.png");
		imgList.add("circle3.png");
		imgList.add("circle4.png");
		imgList.add("circle5.png");
		
		Random random = new Random();
		int index = random.nextInt(imgList.size()); // (0 ~ imgList.size()-1)
		
		Map<String, String> hm = new HashMap<>();
		
		hm.put("memberid", pid);
		hm.put("profile", imgList.get(index));
		
		memberService.updateProfile(hm);
		
		memberService.deleteProfile(pid);
	}
	
	

}
