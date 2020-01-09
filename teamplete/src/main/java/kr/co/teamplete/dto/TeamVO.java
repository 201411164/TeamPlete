package kr.co.teamplete.dto;

public class TeamVO {
	private int teamId;
	private String teamName, ownerId, deadline, img, taskLatest, boardLatest;
	private String keyword, name;
	
	private int roomId;
	
	
	public TeamVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public TeamVO(int teamId, String teamName, String ownerId, String deadline, String img, String taskLatest,
			String boardLatest, String keyword) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
		this.ownerId = ownerId;
		this.deadline = deadline;
		this.img = img;
		this.taskLatest = taskLatest;
		this.boardLatest = boardLatest;
		this.keyword = keyword;
	}


	public int getTeamId() {
		return teamId;
	}


	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}


	public String getTeamName() {
		return teamName;
	}


	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}


	public String getOwnerId() {
		return ownerId;
	}


	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}


	public String getDeadline() {
		return deadline;
	}


	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public String getTaskLatest() {
		return taskLatest;
	}


	public void setTaskLatest(String taskLatest) {
		this.taskLatest = taskLatest;
	}


	public String getBoardLatest() {
		return boardLatest;
	}


	public void setBoardLatest(String boardLatest) {
		this.boardLatest = boardLatest;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	


	public int getRoomId() {
		return roomId;
	}


	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}


	@Override
	public String toString() {
		return "TeamVO [teamId=" + teamId + ", teamName=" + teamName + ", ownerId=" + ownerId + ", deadline=" + deadline
				+ ", img=" + img + ", taskLatest=" + taskLatest + ", boardLatest=" + boardLatest + ", keyword="
				+ keyword + "]";
	}
	
	


}
