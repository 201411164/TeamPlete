package kr.co.teamplete.dto;

public class ChargeVO {
	
	private int chargeId;
	private String chargeMemberid, name, profile;
	private char submit;
	private int taskId;

	public ChargeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChargeVO(int chargeId, String chargeMemberid, String name, String profile, char submit, int taskId) {
		super();
		this.chargeId = chargeId;
		this.chargeMemberid = chargeMemberid;
		this.name = name;
		this.profile = profile;
		this.submit = submit;
		this.taskId = taskId;
	}

	public int getChargeId() {
		return chargeId;
	}

	public void setChargeId(int chargeId) {
		this.chargeId = chargeId;
	}

	public String getChargeMemberid() {
		return chargeMemberid;
	}

	public void setChargeMemberid(String chargeMemberid) {
		this.chargeMemberid = chargeMemberid;
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

	public char getSubmit() {
		return submit;
	}

	public void setSubmit(char submit) {
		this.submit = submit;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	@Override
	public String toString() {
		return "ChargeVO [chargeId=" + chargeId + ", chargeMemberid=" + chargeMemberid + ", name=" + name + ", profile="
				+ profile + ", submit=" + submit + ", taskId=" + taskId + "]";
	}


	

	
}
