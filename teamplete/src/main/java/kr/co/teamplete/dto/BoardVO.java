package kr.co.teamplete.dto;

public class BoardVO {
	private int boardId;
	private String writerId, writerName, title, content, 
	boardDate;
	private int taskId;
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int boardId, String writerId, String writerName, String title, String content, String boardDate,
			int taskId) {
		super();
		this.boardId = boardId;
		this.writerId = writerId;
		this.writerName = writerName;
		this.title = title;
		this.content = content;
		this.boardDate = boardDate;
		this.taskId = taskId;
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

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
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

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	@Override
	public String toString() {
		return "BoardVO [boardId=" + boardId + ", writerId=" + writerId + ", writerName=" + writerName + ", title="
				+ title + ", content=" + content + ", boardDate=" + boardDate + ", taskId=" + taskId + "]";
	}
	
}
