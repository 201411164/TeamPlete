package kr.co.teamplete.dto;

public class RequestVO {
	
	private String ownerId, reqMemberid, teamName, reqDate, name;
	private int teamId;
	
	public RequestVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RequestVO(String ownerId, String reqMemberid, String teamName, String reqDate, int teamId) {
		super();
		this.ownerId = ownerId;
		this.reqMemberid = reqMemberid;
		this.teamName = teamName;
		this.reqDate = reqDate;
		this.teamId = teamId;
	}

	public String getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}

	public String getReqMemberid() {
		return reqMemberid;
	}

	public void setReqMemberid(String reqMemberid) {
		this.reqMemberid = reqMemberid;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getReqDate() {
		return reqDate;
	}

	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "RequestVO [ownerId=" + ownerId + ", reqMemberid=" + reqMemberid + ", teamName=" + teamName
				+ ", reqDate=" + reqDate + ", teamId=" + teamId + "]";
	}

	
	


}