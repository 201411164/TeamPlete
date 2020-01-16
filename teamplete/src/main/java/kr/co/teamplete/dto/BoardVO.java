package kr.co.teamplete.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	List<MultipartFile> files;
	
	List<Integer> deleteBoardFiles;

	private int boardId;
	private String writerId, name, title, content, boardDate, profile;
	private int taskId;

	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVO(List<MultipartFile> files, List<Integer> deleteBoardFiles, int boardId, String writerId, String name,
			String title, String content, String boardDate, String profile, int taskId) {
		super();
		this.files = files;
		this.deleteBoardFiles = deleteBoardFiles;
		this.boardId = boardId;
		this.writerId = writerId;
		this.name = name;
		this.title = title;
		this.content = content;
		this.boardDate = boardDate;
		this.profile = profile;
		this.taskId = taskId;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public List<Integer> getDeleteBoardFiles() {
		return deleteBoardFiles;
	}

	public void setDeleteBoardFiles(List<Integer> deleteBoardFiles) {
		this.deleteBoardFiles = deleteBoardFiles;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	@Override
	public String toString() {
		return "BoardVO [files=" + files + ", deleteBoardFiles=" + deleteBoardFiles + ", boardId=" + boardId
				+ ", writerId=" + writerId + ", name=" + name + ", title=" + title + ", content=" + content
				+ ", boardDate=" + boardDate + ", profile=" + profile + ", taskId=" + taskId + "]";
	}
	
	

}