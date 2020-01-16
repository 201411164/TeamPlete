package kr.co.teamplete.dto;

public class MsgVO {
	
	private int msgId, roomId;
	private String writerId, name, profile, text, msgDate, msgTime;
	
	public MsgVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MsgVO(int msgId, int roomId, String writerId, String name, String profile, String text, String msgDate,
			String msgTime) {
		super();
		this.msgId = msgId;
		this.roomId = roomId;
		this.writerId = writerId;
		this.name = name;
		this.profile = profile;
		this.text = text;
		this.msgDate = msgDate;
		this.msgTime = msgTime;
	}

	public int getMsgId() {
		return msgId;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
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

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}

	public String getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(String msgTime) {
		this.msgTime = msgTime;
	}

	@Override
	public String toString() {
		return "MsgVO [msgId=" + msgId + ", roomId=" + roomId + ", writerId=" + writerId + ", name=" + name
				+ ", profile=" + profile + ", text=" + text + ", msgDate=" + msgDate + ", msgTime=" + msgTime + "]";
	}
	
	
}
