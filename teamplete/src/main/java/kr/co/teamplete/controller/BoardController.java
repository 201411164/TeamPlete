package kr.co.teamplete.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teamplete.dto.ActivityVO;
import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.FileVO;
import kr.co.teamplete.dto.TaskVO;
import kr.co.teamplete.service.ActivityService;
import kr.co.teamplete.service.BoardService;
import kr.co.teamplete.service.TaskService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private TaskService taskService;
	
	@Autowired
	private ActivityService activityService;

	// insert board
	@RequestMapping(value = "/{taskId}/board/write", method = RequestMethod.POST)
	public String writeBoard(BoardVO board, @PathVariable("taskId") int taskId) {

		TaskVO task = taskService.selectTaskS(taskId);
		
		List<ChargeVO> chargeList = taskService.selectNsubmitS(taskId);
		
		for(ChargeVO charge : chargeList) {
			if(board.getWriterId().equals(charge.getChargeMemberid())) {
				charge.setSubmit('Y');
				taskService.updateSubmitS(charge);
			}
		}
		
		board.setTaskId(taskId);

		service.insertBoardS(board);
		
		ActivityVO activity = new ActivityVO();
		
		activity.setTeamId(task.getTeamId());
		activity.setTaskId(taskId);
		activity.setHostId(board.getWriterId());
		activity.setMsg1(task.getTitle());
		activity.setMsg2(board.getTitle());
		activity.setMsg3("을(를) 추가했습니다.");
		activity.setType("file-plus");
		
		activityService.insertActivity(activity);

		return "redirect:/taskdetail/" + taskId;
	}

	// 특정 board 상세 조회
	@RequestMapping(value = "/board/{boardId}", method = RequestMethod.GET)
	public ModelAndView boardDetail(@PathVariable("boardId") int boardId) {

		BoardVO board = service.selectBoardById(boardId);

		// board의 모든 파일 리스트
		List<FileVO> fileList = service.selectAllFileS(boardId);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("board/boardDetail");

		mav.addObject("boardDetail", board);
		mav.addObject("fileList", fileList);

		return mav;
	}
	
	// board 수정
	@RequestMapping(value = "/board/update/{boardId}", method = { RequestMethod.POST, RequestMethod.GET })
	public String updateBoard(BoardVO board, @PathVariable("boardId") int boardId) {
		
		BoardVO boardDetail = service.selectBoardById(boardId);
				
//		service.updateTaskS(task);
		service.updateBoardS(board);
		
		TaskVO task = taskService.selectTaskS(boardDetail.getTaskId());
		
		ActivityVO activity = new ActivityVO();
		
		activity.setTeamId(task.getTeamId());
		activity.setTaskId(task.getTaskId());
		activity.setHostId(board.getWriterId());
		activity.setMsg1(task.getTitle());
		activity.setMsg2(board.getTitle());
		activity.setMsg3("을(를) 수정했습니다.");
		activity.setType("edit");
		
		activityService.insertActivity(activity);
	
		return "redirect:/taskdetail/" + boardDetail.getTaskId();
	}
	
	// board 삭제
	@RequestMapping(value = "/board/delete/{boardId}", method = RequestMethod.DELETE)
	public void deleteBoard(@PathVariable("boardId") int boardId) {
		
		BoardVO boardDetail = service.selectBoardById(boardId);
		
		TaskVO task = taskService.selectTaskS(boardDetail.getTaskId());

		service.deleteBoardS(boardId);
		
		List<ChargeVO> chargeList = taskService.selectYsubmitS(boardDetail.getTaskId());
		
		List<BoardVO> boardList = service.selectAllBoardS(boardDetail.getTaskId());
		
		for(ChargeVO charge : chargeList) {
			int cnt = 0;
			for(BoardVO board : boardList) {
				if(charge.getChargeMemberid().equals(board.getWriterId())) {
					cnt ++;
					break;
				}
			}
			
			if(cnt == 0) {
				charge.setSubmit('N');
				taskService.updateSubmitS(charge);
			}
		}
		
		
		ActivityVO activity = new ActivityVO();
		
		activity.setTeamId(task.getTeamId());
		activity.setTaskId(task.getTaskId());
		activity.setHostId(boardDetail.getWriterId());
		activity.setMsg1(task.getTitle());
		activity.setMsg2(boardDetail.getTitle());
		activity.setMsg3("을(를) 삭제했습니다.");
		activity.setType("file-minus");
		
		activityService.insertActivity(activity);
	}
	

}