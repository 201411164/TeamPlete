package kr.co.teamplete.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TaskVO {
	
	List<MultipartFile> taskFiles;
	
	List<Integer> deleteFiles;
	
	List<String> chargeMems;
	
	List<Integer> deleteCharge;

	private int taskId;
	private String writerId, writerName;
	private int teamId;
	private String title, taskContent, deadline, taskDate;
	
	private String chargeMemberid;

	public TaskVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TaskVO(List<MultipartFile> taskFiles, List<Integer> deleteFiles, List<String> chargeMems,
			List<Integer> deleteCharge, int taskId, String writerId, String writerName, int teamId, String title,
			String taskContent, String deadline, String taskDate, String chargeMemberid) {
		super();
		this.taskFiles = taskFiles;
		this.deleteFiles = deleteFiles;
		this.chargeMems = chargeMems;
		this.deleteCharge = deleteCharge;
		this.taskId = taskId;
		this.writerId = writerId;
		this.writerName = writerName;
		this.teamId = teamId;
		this.title = title;
		this.taskContent = taskContent;
		this.deadline = deadline;
		this.taskDate = taskDate;
		this.chargeMemberid = chargeMemberid;
	}

	public List<MultipartFile> getTaskFiles() {
		return taskFiles;
	}

	public void setTaskFiles(List<MultipartFile> taskFiles) {
		this.taskFiles = taskFiles;
	}

	public List<Integer> getDeleteFiles() {
		return deleteFiles;
	}

	public void setDeleteFiles(List<Integer> deleteFiles) {
		this.deleteFiles = deleteFiles;
	}

	public List<String> getChargeMems() {
		return chargeMems;
	}

	public void setChargeMems(List<String> chargeMems) {
		this.chargeMems = chargeMems;
	}

	public List<Integer> getDeleteCharge() {
		return deleteCharge;
	}

	public void setDeleteCharge(List<Integer> deleteCharge) {
		this.deleteCharge = deleteCharge;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
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

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTaskContent() {
		return taskContent;
	}

	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getTaskDate() {
		return taskDate;
	}

	public void setTaskDate(String taskDate) {
		this.taskDate = taskDate;
	}

	public String getChargeMemberid() {
		return chargeMemberid;
	}

	public void setChargeMemberid(String chargeMemberid) {
		this.chargeMemberid = chargeMemberid;
	}

	@Override
	public String toString() {
		return "TaskVO [taskFiles=" + taskFiles + ", deleteFiles=" + deleteFiles + ", chargeMems=" + chargeMems
				+ ", deleteCharge=" + deleteCharge + ", taskId=" + taskId + ", writerId=" + writerId + ", writerName="
				+ writerName + ", teamId=" + teamId + ", title=" + title + ", taskContent=" + taskContent
				+ ", deadline=" + deadline + ", taskDate=" + taskDate + ", chargeMemberid=" + chargeMemberid + "]";
	}

	
	
		
}
