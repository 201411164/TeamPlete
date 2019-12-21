package kr.co.teamplete.dto;

public class TeamVO {
	private int teamId;
	private String teamName, ownerId, members, deadline, img, taskLatest, boardLatest;
	private String keyword;
	
	
	public TeamVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TeamVO(int teamId, String teamName, String ownerId, String members, String deadline, String img) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
		this.ownerId = ownerId;
		this.members = members;
		this.deadline = deadline;
		this.img = img;
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
	public String getMembers() {
		return members;
	}
	public void setMembers(String members) {
		this.members = members;
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
	
	
	@Override
	public String toString() {
		return "TeamVO [teamId=" + teamId + ", teamName=" + teamName + ", ownerId=" + ownerId + ", members=" + members
				+ ", deadline=" + deadline + ", img=" + img + "]";
	}


}
