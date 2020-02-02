package kr.co.teamplete.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teamplete.dto.ActivityVO;
import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.FileVO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TaskFileVO;
import kr.co.teamplete.dto.TaskVO;
import kr.co.teamplete.dto.TeamVO;
import kr.co.teamplete.method.Deadline;
import kr.co.teamplete.service.ActivityService;
import kr.co.teamplete.service.BoardService;
import kr.co.teamplete.service.TaskService;
import kr.co.teamplete.service.TeamService;

@Controller
public class TaskController {

	@Autowired
	private TaskService service;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private TeamService teamService;
	
	@Autowired
	private ActivityService activityService;
	
	//태스크 등록
	@PostMapping("/task/write")
	public String insertTask(TaskVO task) {
		
		service.insertTaskS(task);
		
		ActivityVO activity = new ActivityVO();
		
		activity.setTeamId(task.getTeamId());
		activity.setHostId(task.getWriterId());
		activity.setMsg2(task.getTitle());
		activity.setMsg3("카드를 추가했습니다.");
		activity.setType("plus");
		
		activityService.insertActivity(activity);
		
		return "redirect:/teamdetail/" + task.getTeamId();
		
	}
	
	//태스크 상세
	@GetMapping("/taskdetail/{taskId}")
	public ModelAndView taskDetail(@PathVariable("taskId") int taskId) {
		
		TaskVO task = service.selectTaskS(taskId);

		TeamVO teamDetail = teamService.detailTeam(task.getTeamId());
				
		Map<String, Object> objectMap = new HashMap<>();
		
		String deadline = Deadline.deadline(task.getDeadline());
		
		List<TaskFileVO> taskFileList = service.selectAllTaskFileS(taskId);
		
		List<BoardVO> boardList = boardService.selectAllBoardS(taskId);
		
		List<ChargeVO> chargeListAll = service.selectAllsubmitS(taskId);
		
		List<ChargeVO> chargeListN = service.selectNsubmitS(taskId);
		
		List<ChargeVO> chargeListY = service.selectYsubmitS(taskId);
		
		List<List<FileVO>> boardFileList = new ArrayList<>();
		
		
		
		List<MemberVO> members = teamService.selectAllMembers(task.getTeamId());
		
		for(int i=0; i<boardList.size(); i++) {
			boardFileList.add(boardService.selectAllFileS(boardList.get(i).getBoardId()));
		}
		
		Map<String, Integer> hm = new HashMap<>();
		hm.put("teamId", task.getTeamId());
		hm.put("taskId", taskId);
		List<MemberVO> notChargeMembers = service.NotChargeMembers(hm);
						
		for(int i=0; i<chargeListN.size(); i++) {
			for(int j=0; j<boardList.size(); j++) {
				if(chargeListN.get(i).getChargeMemberid().equals(boardList.get(j).getWriterId())) {
					chargeListN.get(i).setSubmit('Y');
					service.updateSubmitS(chargeListN.get(i));
					break;
				}
			}
		}
		
		for(int i=0; i<chargeListY.size(); i++) {
			int cnt = 0;
			for(int j=0; j<boardList.size(); j++) {
				if(chargeListY.get(i).getChargeMemberid().equals(boardList.get(j).getWriterId())) {
					cnt ++;
					break;
				}
			}
			if(cnt == 0) {
				chargeListY.get(i).setSubmit('N');
				service.updateSubmitS(chargeListY.get(i));
			}
		}
		objectMap.put("members", members);
		objectMap.put("taskDetail", task);
		objectMap.put("taskFileList", taskFileList);
		objectMap.put("boardList", boardList);
		objectMap.put("chargeListAll", chargeListAll);
		objectMap.put("submitNmembers", chargeListN);
		objectMap.put("notChargeMembers", notChargeMembers);
		objectMap.put("boardFileList", boardFileList);
		objectMap.put("deadline", deadline);
		objectMap.put("chargeListAllcnt", chargeListAll.size());
		objectMap.put("chargeListNcnt", chargeListN.size());
		objectMap.put("chargeListYcnt", chargeListY.size());
		objectMap.put("teamDetail", teamDetail);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("task/taskDetail");
		
		mav.addAllObjects(objectMap);
		
						
		return mav;
	}
	
	
	//태스크 수정
	@RequestMapping(value = "/task/update/{taskId}", method = { RequestMethod.POST, RequestMethod.GET })
	public String updateTask(TaskVO task, @PathVariable("taskId") int taskId) {

		service.updateTaskS(task);
		
		ActivityVO activity = new ActivityVO();
		
		activity.setTeamId(task.getTeamId());
		activity.setHostId(task.getWriterId());
		activity.setMsg2(task.getTitle());
		activity.setMsg3("카드를 수정했습니다.");
		activity.setType("edit");
		
		activityService.insertActivity(activity);
	
		return "redirect:/taskdetail/" + taskId;
	}

	
	//태스크 삭제
	@RequestMapping(value = "/task/delete/{taskId}", method = RequestMethod.DELETE)
	public void deleteTask(@PathVariable("taskId") int taskId) {
		
		TaskVO task = service.selectTaskS(taskId);
		
		service.deleteTaskS(taskId);
		
		ActivityVO activity = new ActivityVO();
		
		activity.setTeamId(task.getTeamId());
		activity.setHostId(task.getWriterId());
		activity.setMsg2(task.getTitle());
		activity.setMsg3("카드를 삭제했습니다.");
		activity.setType("trash-2");
		
		activityService.insertActivity(activity);
	}
	
}
