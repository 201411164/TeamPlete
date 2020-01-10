package kr.co.teamplete.dto;

public class ActivityVO {
	
	private int activityId, teamId, taskId;
	private String hostId, msg1, msg2, msg3, actDate, type;
	private String name;
	
	public ActivityVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ActivityVO(int activityId, int teamId, int taskId, String hostId, String msg1, String msg2, String msg3,
			String actDate, String type, String name) {
		super();
		this.activityId = activityId;
		this.teamId = teamId;
		this.taskId = taskId;
		this.hostId = hostId;
		this.msg1 = msg1;
		this.msg2 = msg2;
		this.msg3 = msg3;
		this.actDate = actDate;
		this.type = type;
		this.name = name;
	}

	public int getActivityId() {
		return activityId;
	}

	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getHostId() {
		return hostId;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}

	public String getMsg1() {
		return msg1;
	}

	public void setMsg1(String msg1) {
		this.msg1 = msg1;
	}

	public String getMsg2() {
		return msg2;
	}

	public void setMsg2(String msg2) {
		this.msg2 = msg2;
	}

	public String getMsg3() {
		return msg3;
	}

	public void setMsg3(String msg3) {
		this.msg3 = msg3;
	}

	public String getActDate() {
		return actDate;
	}

	public void setActDate(String actDate) {
		this.actDate = actDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ActivityVO [activityId=" + activityId + ", teamId=" + teamId + ", taskId=" + taskId + ", hostId="
				+ hostId + ", msg1=" + msg1 + ", msg2=" + msg2 + ", msg3=" + msg3 + ", actDate=" + actDate + ", type="
				+ type + ", name=" + name + "]";
	}
	
	

}
