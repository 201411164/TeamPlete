package kr.co.teamplete.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.FileVO;
import kr.co.teamplete.service.BoardService;
import kr.co.teamplete.service.TaskService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private TaskService taskService;

	// insert board
	@RequestMapping(value = "/{taskId}/board/write", method = RequestMethod.POST)
	public String writeBoard(BoardVO board, @PathVariable("taskId") int taskId, Model model) {

		board.setTaskId(taskId);

		service.insertBoardS(board);

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
	
	
	// board 삭제
	@RequestMapping(value = "/board/delete/{boardId}", method = RequestMethod.DELETE)
	public void deleteTask(@PathVariable("boardId") int boardId) {

		service.deleteBoardS(boardId);
	}
	

}