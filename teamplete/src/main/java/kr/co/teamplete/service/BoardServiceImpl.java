package kr.co.teamplete.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.teamplete.dao.BoardDAO;
import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.FileVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	// insert board
	// @Override
	// public void insertBoardS(BoardVO board) {
	//
	// boardDAO.insertBoard(board);
	// }

	// 모든 board 조회
	@Override
	public List<BoardVO> selectAllBoardS(int taskId) {
		List<BoardVO> boardList = boardDAO.selectAllBoard(taskId);
		return boardList;
	}

	public void insertBoardS(BoardVO board) {

		List<FileVO> boardFileList = null;

		try {
			boardFileList = getBoardFileInfo(board);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		boardDAO.insertBoard(board);

		for (FileVO boardFile : boardFileList) {
			boardDAO.insertBoardFile(boardFile);
		}
		System.out.println(boardFileList.toString());

	}

	/* 게시판 첨부파일 정보 조회 */
	public List<FileVO> getBoardFileInfo(BoardVO board) throws IllegalStateException, IOException {

		List<MultipartFile> files = board.getFiles();

		List<FileVO> boardFileList = new ArrayList<FileVO>();

		FileVO boardFile = new FileVO();

		int boardId = board.getBoardId();
		String insUserId = board.getWriterId();
		String fileNameKey = null;
		String fileName = null;
		String fileExt = null; // 확장자
		String fileSize = null;
		// 파일이 저장될 path 설정
		String filePath = "C:\\fileUpload\\board";

		if (files != null && files.size() > 0) {
			File file = new File(filePath);

			// 디렉토리가 없으면 생성
			if (file.exists() == false) {
				file.mkdirs();
			}

			for (MultipartFile multipartFile : files) {

				fileName = multipartFile.getOriginalFilename();
				fileExt = fileName.substring(fileName.lastIndexOf("."));
				// 파일명 변경(uuid로 암호화) + 확장자
				fileNameKey = getRandomString() + fileExt;
				fileSize = String.valueOf(multipartFile.getSize());

				// 설정한 Path에 파일 저장
				file = new File(filePath + "/" + fileNameKey);

				multipartFile.transferTo(file);

				boardFile = new FileVO();
				boardFile.setBoardId(boardId);
				boardFile.setFileName(fileName);
				boardFile.setFileNameKey(fileNameKey);
				boardFile.setFilePath(URLEncoder.encode(filePath, "utf-8"));
				boardFile.setFileSize(fileSize);
				boardFile.setInsUserId(insUserId);
				boardFile.setDelYN('N');
				boardFileList.add(boardFile);

			}
		} else {
			files = null;
		}

		return boardFileList;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	@Override
	public BoardVO selectBoardById(int boardId) {
		BoardVO board = boardDAO.selectBoard(boardId);
		return board;
	}

	@Override
	public List<FileVO> selectAllFileS(int boardId) {
		List<FileVO> fileList = boardDAO.selectAllFiles(boardId);
		return fileList;
	}

	@Override
	public void deleteBoardS(int boardId) {
		boardDAO.deleteBoard(boardId);
	}

}