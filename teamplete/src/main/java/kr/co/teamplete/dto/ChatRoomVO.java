package kr.co.teamplete.dto;

public class ChatRoomVO {
	
	private int roomId, teamId;
	private char groupYN;
	
	public ChatRoomVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatRoomVO(int roomId, int teamId, char groupYN) {
		super();
		this.roomId = roomId;
		this.teamId = teamId;
		this.groupYN = groupYN;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public char getGroupYN() {
		return groupYN;
	}

	public void setGroupYN(char groupYN) {
		this.groupYN = groupYN;
	}

	@Override
	public String toString() {
		return "ChatRoomVO [roomId=" + roomId + ", teamId=" + teamId + ", groupYN=" + groupYN + "]";
	}
	

}
