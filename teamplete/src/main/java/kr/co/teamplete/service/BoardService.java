package kr.co.teamplete.service;

import java.util.List;

import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.FileVO;

public interface BoardService {
   
   // insert board
   public void insertBoardS(BoardVO board);
   
   //모든 board 조회
   public List<BoardVO> selectAllBoardS(int taskId);
   
   //특정 board 상세 조회
   public BoardVO selectBoardById(int boardId);
   
   //board의 모든 파일 조회
   public List<FileVO> selectAllFileS(int boardId);
   
   //board 삭제
   public void deleteBoardS(int boardId);

}