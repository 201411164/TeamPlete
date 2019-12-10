package kr.co.teamplete.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TaskFileVO;
import kr.co.teamplete.dto.TaskVO;
import kr.co.teamplete.dto.TeamMemberVO;
import kr.co.teamplete.dto.TeamVO;
import kr.co.teamplete.service.BoardService;
import kr.co.teamplete.service.MemberService;
import kr.co.teamplete.service.TaskService;
import kr.co.teamplete.service.TeamService;

@Controller
public class TeamController {
	
	@Autowired
	private TeamService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private BoardService boardService;
	

	// 팀 등록한 뒤 팀 조회 페이지로 돌아감
	@RequestMapping(value="/team/{loginVO.memberid}", method = RequestMethod.POST)
	public String createTeam(TeamVO team, @PathVariable("loginVO.memberid") String memberid) {
		
		List<String> imgList = new ArrayList<>();
		imgList.add("action-2277292_1920.jpg");
		imgList.add("basketball-2258650_1920.jpg");
		imgList.add("friendship-2366955_1920.jpg");
		imgList.add("meeting-2284501_1920.jpg");
		imgList.add("startup-593341_1920.jpg");
		imgList.add("startup-594090_1920.jpg");
		imgList.add("home-office-569359_1920.jpg");
		imgList.add("business-2846221_1920.jpg");
		imgList.add("desk-3139127_1920.jpg");
		imgList.add("office-1209640_1920.jpg");
		imgList.add("picnic-1208229_1920.jpg");
		imgList.add("people-2557396_1920.jpg");
		imgList.add("soldier-919202_1920.jpg");
		
		Random random = new Random();
		int index = random.nextInt(imgList.size()); // (0 ~ imgList.size()-1)
		team.setImg(imgList.get(index));
		
		String ownerName = memberService.selectMemberById(memberid).getName();
		
		team.setMembers(ownerName);
		
		service.insertTeam(team);
		
		return "redirect:/team/" + memberid;
	}
	
	// 팀 조회
	@RequestMapping(value = "/team/{loginVO.memberid}", method = RequestMethod.GET)
	public ModelAndView teamList(@PathVariable("loginVO.memberid") String memberid) {

		List<String> deadline = new ArrayList<>();
		List<TeamVO> teamList = service.selectAllTeam(memberid);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("team/team");
		mav.addObject("teamList", teamList);
		for(int i=0; i<teamList.size(); i++) {
			deadline.add(deadline(teamList.get(i).getDeadline()));
//			System.out.println(deadline(teamList.get(i)));
		}
		mav.addObject("deadline", deadline);

		return mav;
	}
	
	// 팀 멤버 문자열 update
	public void membersUpdate(TeamVO team) {
		
		List<MemberVO> members = service.selectAllMembers(team.getTeamId());
		
		String membersStr = "";
		for(int i=0; i<members.size(); i++) {
			if(i == members.size()-1) {
				membersStr = membersStr + members.get(i).getName();
			}else membersStr = membersStr + members.get(i).getName() + ", ";
		}
		
//		System.out.println(membersStr);
		
		team.setMembers(membersStr);
		
		service.updateAllMembers(team);
	
	}

	// 남은 제출 기한 구하기
	public String deadline(String deadlineStr) {
		String deadline = deadlineStr;

		if (deadline != null) {
			String[] words = deadline.split("-");
			try {
				Calendar today = Calendar.getInstance(); // 오늘 날짜
//				System.out.println("오늘날짜: " + today);
				Calendar dday = Calendar.getInstance();

				dday.set(Integer.parseInt(words[0]), Integer.parseInt(words[1]) - 1, Integer.parseInt(words[2]));
//				System.out.println("dday 날짜: " + dday);

				long calDay = (dday.getTimeInMillis() - today.getTimeInMillis()) / 86400000;
				long calDay2= (today.getTimeInMillis() - dday.getTimeInMillis()) / 86400000;

				if (calDay < 0)
					
					return   Long.toString(calDay2) + "일 초과";
				else if (calDay == 0)
					return "오늘";
				else
					return Long.toString(calDay) + "일 남음";

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "마감기한 없음";
	}
	
	
	// 상세 팀 조회 (태스크 조회)
	@RequestMapping(value = "/teamdetail/{id}", method = {RequestMethod.GET})
	public ModelAndView teamDetail(@PathVariable("id") int teamId) {
		
		TeamVO team = service.detailTeam(teamId);
		List<MemberVO> members = service.selectAllMembers(teamId);
		List<MemberVO> allmembers = service.selectAllMembers();
		List<TaskVO> taskList = taskService.selectAllTaskS(teamId);
		List<List<TaskFileVO>> taskFileList = new ArrayList<>();
		List<String> deadline = new ArrayList<>();
		List<List<ChargeVO>> chargeMembers = new ArrayList<>();
		List<List<ChargeVO>> submitN = new ArrayList<>();
		for(int i=0; i<taskList.size(); i++) {
			taskFileList.add(taskService.selectAllTaskFileS(taskList.get(i).getTaskId()));
			deadline.add(deadline(taskList.get(i).getDeadline()));
			chargeMembers.add(taskService.selectAllsubmitS(taskList.get(i).getTaskId()));
			submitN.add(taskService.selectNsubmitS(taskList.get(i).getTaskId()));
		}

		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("team/teamDetail");
		mav.addObject("team", team);
		mav.addObject("members", members);
//		System.out.println(members.toString());
		mav.addObject("taskList", taskList);
		mav.addObject("allmembers", allmembers);
		mav.addObject("taskFileList", taskFileList);
		
		mav.addObject("taskDeadline", deadline);
		
		mav.addObject("chargeMembers", chargeMembers);
		
		mav.addObject("submitN", submitN);
	
		return mav;
	}
	

	//팀 멤버 추가한 뒤 상세 팀 조회 페이지로 돌아감
	@RequestMapping(value = "/teamdetail/{id}", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<String> addTeamMember( @RequestBody ArrayList<String> memberList,  @PathVariable("id") int teamId) {
		for (String s : memberList) {
			//teamMember.setMemberId(s);
			TeamMemberVO teamMember = new TeamMemberVO();
			teamMember.setMemberId(s);
			teamMember.setTeamId(teamId);			
			service.insertTeamMem(teamMember);			
		}
		
		TeamVO team = service.detailTeam(teamId);
		membersUpdate(team);
		
		return memberList;
	}
	
	//팀 정보 수정
	@RequestMapping(value = "/team/update/{teamId}", method = { RequestMethod.POST, RequestMethod.GET })
	public String updateTeam(TeamVO team, @PathVariable("teamId") int teamId) {
		TeamVO team2= service.detailTeam(teamId);
		service.updateTeamInfo(team);
		return "redirect:/team/" + team2.getOwnerId();
	}
	
	@RequestMapping(value = "/team/delete/{teamId}", method = RequestMethod.DELETE)
	public void deleteTeam(@PathVariable("teamId") int teamId) {
		
		service.deleteTeamById(teamId);
	}

}