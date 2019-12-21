package kr.co.teamplete.dao;

import java.util.List;

import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.FileVO;
import kr.co.teamplete.dto.TaskFileVO;

public interface BoardDAO {

	// board insert
	public void insertBoard(BoardVO board);

	// 모든 board 조회
	public List<BoardVO> selectAllBoard(int taskId);

	// 파일 업로드
	public void insertBoardFile(FileVO file);

	// board 수정시 파일 업로드
	public void insertBoardFileModify(FileVO file);

	// board 수정시 파일 삭제
	public void deleteBoardFile(int fileNo);

	// 특정 board 조회
	public BoardVO selectBoard(int boardId);

	// board의 모든 파일 조회
	public List<FileVO> selectAllFiles(int boardId);

	// board 삭제
	public void deleteBoard(int boardId);

	// board 수정
	public void updateBoard(BoardVO board);
}