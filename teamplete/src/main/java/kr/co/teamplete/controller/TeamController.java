package kr.co.teamplete.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.co.teamplete.dto.ActivityVO;
import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.FileVO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.RequestVO;
import kr.co.teamplete.dto.TaskFileVO;
import kr.co.teamplete.dto.TaskVO;
import kr.co.teamplete.dto.TeamMemberVO;
import kr.co.teamplete.dto.TeamVO;
import kr.co.teamplete.method.Deadline;
import kr.co.teamplete.method.UpdateTime;
import kr.co.teamplete.service.ActivityService;
import kr.co.teamplete.service.BoardService;
import kr.co.teamplete.service.MemberService;
import kr.co.teamplete.service.RequestService;
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
	
	@Autowired
	private RequestService requestService;
	
	@Autowired
	private ActivityService activityService;
	

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
		
//		String ownerName = memberService.selectMemberById(memberid).getName();
		
		service.insertTeam(team);
		
		return "redirect:/team/" + memberid;
	}
	
	// 팀 조회
	@RequestMapping(value = "/team/{loginVO.memberid}", method = RequestMethod.GET)
	public ModelAndView teamList(@PathVariable("loginVO.memberid") String memberid) {
		
		List<String> updateTime = new ArrayList<>();
		
		List<String> deadline = new ArrayList<>();
		List<TeamVO> teamList = service.selectAllTeam(memberid);
		List<List<MemberVO>> teamMemberList = new ArrayList<>();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("team/team");
		mav.addObject("teamList", teamList);
		for(int i=0; i<teamList.size(); i++) {
			deadline.add(Deadline.deadline(teamList.get(i).getDeadline()));
			teamMemberList.add(service.selectAllMembers(teamList.get(i).getTeamId()));
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
		
		//activity 시간 계산
		List<String> activityTime = new ArrayList<>();
		
		List<ActivityVO> activityList = activityService.selectAllActivity(teamId);
		
		for(ActivityVO activity : activityList) {
			activityTime.add(UpdateTime.updateTime(activity.getActDate()));
		}
		
		Map<String, Object> map = new HashMap<>();
		
		TeamVO team = service.detailTeam(teamId);
		List<MemberVO> members = service.selectAllMembers(teamId);
		
		for(MemberVO member : members) {
			if(member.getMemberid().equals(service.detailTeam(teamId).getOwnerId())) {
				members.remove(member);
				members.add(0, member);
				break;
			}
		}
		List<MemberVO> allmembers = service.selectAllMembers();
		List<TaskVO> taskList = taskService.selectAllTaskS(teamId);
		List<List<TaskFileVO>> taskFileList = new ArrayList<>();
		List<String> deadline = new ArrayList<>();
		List<List<ChargeVO>> chargeMembers = new ArrayList<>();
		List<List<ChargeVO>> submitN = new ArrayList<>();
		
		List<MemberVO> notTeamMembers = service.NotInTeamMembers(teamId);
		
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
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("team/teamDetail");
		mav.addAllObjects(map);
	
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
	
	@RequestMapping(value = "/team/outTeam/{teamId}/{memberId:.+}", method = RequestMethod.DELETE)
	public void outFromTeam(@PathVariable("teamId") int teamId, @PathVariable("memberId") String memberId) {
		
		Map<String, Object> hm = new HashMap<>();
		
		hm.put("teamId", teamId);
		hm.put("memberId", memberId);
		
		service.outFromTeam(hm);
	}
	
	// 팀 검색
	@RequestMapping(value = "/{id}/team/search", method = RequestMethod.GET)
	public ModelAndView searchTeam(@RequestParam("keyword") String keyword, @PathVariable("id") String id) {
		
		Map<String, Object> map = new HashMap<>();
		
		List<TeamVO> searchTeamList = service.searchTeam(keyword);
		
		List<List<MemberVO>> allTeamMembers = new ArrayList<>();
		
		// 내가 요청한 request
		List<RequestVO> requestList = requestService.selectMyRequest(id);
		
		
		for(TeamVO searchTeam : searchTeamList) {
			allTeamMembers.add(service.selectAllMembers(searchTeam.getTeamId()));
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

}