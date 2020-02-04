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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.teamplete.dto.ChatRoomVO;
import kr.co.teamplete.dto.TeamMemberVO;
import kr.co.teamplete.dto.TeamVO;
import kr.co.teamplete.service.ActivityService;
import kr.co.teamplete.service.BoardService;
import kr.co.teamplete.service.CalendarService;
import kr.co.teamplete.service.ChatRoomService;
import kr.co.teamplete.service.MemberService;
import kr.co.teamplete.service.MsgService;
import kr.co.teamplete.service.RequestService;
import kr.co.teamplete.service.TaskService;
import kr.co.teamplete.service.TeamService;

@Controller
public class TeamController {
	
	@Autowired
	private ChatRoomService chatRoomService;

	@Autowired
	private TeamService teamService;
	

	// 팀 등록한 뒤 팀 조회 페이지로 돌아감
	@RequestMapping(value="/team", method = RequestMethod.POST)
	public String createTeam(TeamVO team) {
		
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
		
		teamService.insertTeam(team);
		
		ChatRoomVO chatRoom = new ChatRoomVO();
		
		chatRoom.setGroupYN('Y');
		
		chatRoomService.insertGroupChatRoom(chatRoom);
		
		return "redirect:/team";
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
			teamService.insertTeamMem(teamMember);			
		}
		
		return memberList;
	}
	
	
	
	
	
	
	
	//팀 정보 수정
	@RequestMapping(value = "/team/update/{teamId}", method = { RequestMethod.POST, RequestMethod.GET })
	public String updateTeam(TeamVO team, @PathVariable("teamId") int teamId) {
		teamService.updateTeamInfo(team);
		return "redirect:/team";
	}
	
	@RequestMapping(value = "/team/delete/{teamId}", method = RequestMethod.DELETE)
	public void deleteTeam(@PathVariable("teamId") int teamId) {
		
		teamService.deleteTeamById(teamId);
	}
	
	@RequestMapping(value = "/team/outTeam/{teamId}/{memberId:.+}", method = RequestMethod.DELETE)
	public void outFromTeam(@PathVariable("teamId") int teamId, @PathVariable("memberId") String memberId) {
		
		Map<String, Object> hm = new HashMap<>();
		
		hm.put("teamId", teamId);
		hm.put("memberId", memberId);
		
		teamService.outFromTeam(hm);
	}
	
	

	

}