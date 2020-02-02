package kr.co.teamplete.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teamplete.dto.ActivityVO;
import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.CalendarVO;
import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.FileVO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.MsgVO;
import kr.co.teamplete.dto.RequestVO;
import kr.co.teamplete.dto.TaskFileVO;
import kr.co.teamplete.dto.TaskVO;
import kr.co.teamplete.dto.TeamVO;
import kr.co.teamplete.kakaoAPI.KakaoRestAPI;
import kr.co.teamplete.method.Deadline;
import kr.co.teamplete.method.UpdateTime;
import kr.co.teamplete.service.ActivityService;
import kr.co.teamplete.service.BoardService;
import kr.co.teamplete.service.CalendarService;
import kr.co.teamplete.service.ChatRoomService;
import kr.co.teamplete.service.LoginService;
import kr.co.teamplete.service.MemberService;
import kr.co.teamplete.service.MsgService;
import kr.co.teamplete.service.RequestService;
import kr.co.teamplete.service.TaskService;
import kr.co.teamplete.service.TeamService;


@SessionAttributes({"loginVO"})
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private TeamService teamService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private RequestService requestService;
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@Autowired
	private MsgService msgService;
	
    @Autowired
    private KakaoRestAPI kakao;
    
    @Autowired
    private CalendarService calendarService;
	
	
	String loginId;
	
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
			
			loginId = loginVO.getMemberid();
			
			return "redirect:/team";
		}
	}
	
	// 카카오 로그인
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

        
        if((String) userInfo.get("thumbnail_image") != null ) {
            member.setProfile((String) userInfo.get("thumbnail_image"));
        }
        
        if(memberService.checkIdSignUp(member.getMemberid()) == 0) {
        	memberService.insertMember(member);
        }
       
        //    클라이언트의 이메일이 존재할 때
        if (userInfo.get("email") != null) {
        	
            member.setStatus("online");
            int temp=member.getLogincount()+1;
            member.setLogincount(temp);
            memberService.updateMember(member);
        	
            model.addAttribute("loginVO", member);
            
            loginId = member.getMemberid();
            
            return "redirect:/team";
        } else return "redirect:/";
        
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
	
	

	
	// 세션에 저장된 아이디로 팀 조회
	@RequestMapping(value = "/team", method = RequestMethod.GET)
	public ModelAndView teamList() {
		
		List<String> updateTime = new ArrayList<>();
		
		List<String> deadline = new ArrayList<>();
		List<TeamVO> teamList = teamService.selectAllTeam(loginId);
		List<List<MemberVO>> teamMemberList = new ArrayList<>();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("team/team");
		mav.addObject("teamList", teamList);
		for(int i=0; i<teamList.size(); i++) {
			deadline.add(Deadline.deadline(teamList.get(i).getDeadline()));
			teamMemberList.add(teamService.selectAllMembers(teamList.get(i).getTeamId()));
			if(teamList.get(i).getTaskLatest() != null && teamList.get(i).getBoardLatest() != null) {
				if(UpdateTime.calcLatest(teamList.get(i).getTaskLatest(), teamList.get(i).getBoardLatest()) >= 0) {
					updateTime.add(UpdateTime.updateTime(teamList.get(i).getTaskLatest()));
				}else updateTime.add(UpdateTime.updateTime(teamList.get(i).getBoardLatest()));
			}else if(teamList.get(i).getTaskLatest() != null && teamList.get(i).getBoardLatest() == null) {
				updateTime.add(UpdateTime.updateTime(teamList.get(i).getTaskLatest()));
			}else updateTime.add("업데이트 없음");
			
		}
		mav.addObject("deadline", deadline);
		mav.addObject("teamMemberList", teamMemberList);
		mav.addObject("updateTime", updateTime);

		return mav;
	}
	
	
	// 상세 팀 조회 (태스크 조회)
	@RequestMapping(value = "/teamdetail/{id}", method = {RequestMethod.GET})
	public ModelAndView teamDetail(@PathVariable("id") int teamId) {
		
		List<CalendarVO> calendarList = calendarService.selectAllCalendar(teamId);
		
		MemberVO user = memberService.selectMemberById(loginId);
		
		//채팅내용 조회
		List<MsgVO> msgList = msgService.selectMsg(teamService.detailTeam(teamId).getRoomId());
		
		//activity 시간 계산
		List<String> activityTime = new ArrayList<>();
		
		List<ActivityVO> activityList = activityService.selectAllActivity(teamId);
		
		for(ActivityVO activity : activityList) {
			activityTime.add(UpdateTime.updateTime(activity.getActDate()));
		}
		
		Map<String, Object> map = new HashMap<>();
		
		TeamVO team = teamService.detailTeam(teamId);
		List<MemberVO> members = teamService.selectAllMembers(teamId);
		
		for(MemberVO member : members) {
			if(member.getMemberid().equals(teamService.detailTeam(teamId).getOwnerId())) {
				members.remove(member);
				members.add(0, member);
				break;
			}
		}
		List<MemberVO> allmembers = teamService.selectAllMembers();
		List<TaskVO> taskList = taskService.selectAllTaskS(teamId);
		List<List<TaskFileVO>> taskFileList = new ArrayList<>();
		List<String> deadline = new ArrayList<>();
		List<List<ChargeVO>> chargeMembers = new ArrayList<>();
		List<List<ChargeVO>> submitN = new ArrayList<>();
		
		List<MemberVO> notTeamMembers = teamService.NotInTeamMembers(teamId);
		
		List<TaskVO> notSubmitMyTask = taskService.notSubmitMyTask(teamId);
		List<String> deadline2 = new ArrayList<>();
		List<TaskFileVO> FileVOList = new ArrayList<>();
		List<BoardVO> boardList = new ArrayList<>();
		List<FileVO> FileList = new ArrayList<>();
		int totalFileSize = 0;
		
		for (TaskVO s : taskList) {
			boardList = boardService.selectAllBoardS(s.getTaskId());
			for(BoardVO b : boardList) {
				FileList=boardService.selectAllFileS(b.getBoardId());
				for(FileVO f : FileList) {
					totalFileSize+=Integer.parseInt(f.getFileSize());
				}
			}
		}
		
		
		List<List<FileVO>> boardFileList = new ArrayList<>();

		for (int i = 0; i < boardList.size(); i++) {
			boardFileList.add(boardService.selectAllFileS(boardList.get(i).getBoardId()));
		}
		
		
		
		
		for(int i=0; i<taskList.size(); i++) {
			taskFileList.add(taskService.selectAllTaskFileS(taskList.get(i).getTaskId()));
			deadline.add(Deadline.deadline(taskList.get(i).getDeadline()));
			chargeMembers.add(taskService.selectAllsubmitS(taskList.get(i).getTaskId()));
			submitN.add(taskService.selectNsubmitS(taskList.get(i).getTaskId()));
			
			
		}
		
		
		for(int i=0;i<taskFileList.size();i++) {
			FileVOList= taskFileList.get(i);
			for(int j=0;j<FileVOList.size();j++) {
				totalFileSize+=Integer.parseInt(FileVOList.get(j).getFileSize());
			}
		}
		
		
		
		for(int i=0; i<notSubmitMyTask.size(); i++) {
			deadline2.add(Deadline.deadline(notSubmitMyTask.get(i).getDeadline()));
		}
		
		map.put("team", team);
		map.put("members", members);
		map.put("taskList", taskList);
		map.put("allmembers", allmembers);
		map.put("taskFileList", taskFileList);
		map.put("chargeMembers", chargeMembers);
		map.put("taskDeadline", deadline);
		map.put("submitN", submitN);
		map.put("notTeamMembers", notTeamMembers);
		map.put("notSubmitMyTask", notSubmitMyTask);
		map.put("notSubmitMyTaskDeadline", deadline2);
		map.put("totalFileSize",totalFileSize);
		map.put("activityList", activityList);
		map.put("activityTime", activityTime);
		map.put("msgList", msgList);
		map.put("user", user);
		map.put("calendarList", calendarList);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("team/teamDetail");
		mav.addAllObjects(map);
	
		return mav;
	}
	
	
	// 팀 검색
	@RequestMapping(value = "/team/search", method = RequestMethod.GET)
	public ModelAndView searchTeam(@RequestParam("keyword") String keyword) {
		
		Map<String, Object> map = new HashMap<>();
		
		List<TeamVO> searchTeamList = teamService.searchTeam(keyword);
		
		List<List<MemberVO>> allTeamMembers = new ArrayList<>();
		
		// 내가 요청한 request
		List<RequestVO> requestList = requestService.selectMyRequest(loginId);
		
		
		for(TeamVO searchTeam : searchTeamList) {
			allTeamMembers.add(teamService.selectAllMembers(searchTeam.getTeamId()));
		}
		
		List<String> updateTime = new ArrayList<>();

		ModelAndView mav = new ModelAndView();
		for (int i = 0; i < searchTeamList.size(); i++) {
			if (searchTeamList.get(i).getTaskLatest() != null && searchTeamList.get(i).getBoardLatest() != null) {
				if (UpdateTime.calcLatest(searchTeamList.get(i).getTaskLatest(), searchTeamList.get(i).getBoardLatest()) >= 0) {
					updateTime.add(UpdateTime.updateTime(searchTeamList.get(i).getTaskLatest()));
				} else
					updateTime.add(UpdateTime.updateTime(searchTeamList.get(i).getBoardLatest()));
			} else if (searchTeamList.get(i).getTaskLatest() != null && searchTeamList.get(i).getBoardLatest() == null) {
				updateTime.add(UpdateTime.updateTime(searchTeamList.get(i).getTaskLatest()));
			} else
				updateTime.add("업데이트 없음");
		}
		
		
		
		mav.setViewName("team/searchResultTeam");
		
		map.put("searchTeamList", searchTeamList);
		map.put("allTeamMembers", allTeamMembers);
		map.put("requestList", requestList);
		
		map.put("updateTime", updateTime);

		mav.addAllObjects(map);
		
		return mav;
	}

	
	
	// 세션에 저장된 아이디의 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();

		MemberVO user = new MemberVO();

		user = memberService.selectMemberById(loginId);
		

		Map<String, Object> map = new HashMap<>();
		List<TaskVO> notSubmitMyTaskAll = taskService.notSubmitMyTaskAll(loginId);
		List<TeamVO> teamList = teamService.selectAllTeam(loginId);
		List<RequestVO> allRequestList = requestService.selectAllRequest(loginId);

		map.put("notSubmitMyTaskAll", notSubmitMyTaskAll);
		map.put("user", user);
		map.put("teamCnt",teamList.size());
		mav.addObject("requestCnt", allRequestList.size());
		mav.addAllObjects(map);
		mav.setViewName("mypage/mypage");

		return mav;
	}
	
	// 세션에 저장된 아이디의 상점
		@RequestMapping(value = "/shop", method = RequestMethod.GET)
		public ModelAndView myshop() {
			ModelAndView mav = new ModelAndView();

			MemberVO user = new MemberVO();

			user = memberService.selectMemberById(loginId);

			Map<String, Object> map = new HashMap<>();
			
			map.put("user", user);
			mav.addAllObjects(map);
			mav.setViewName("shop/shop");

			return mav;
		}
	
	
	
	
	
	
	
	
	
}
