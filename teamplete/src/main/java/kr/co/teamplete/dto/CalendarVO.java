package kr.co.teamplete.dto;

public class CalendarVO {

	private String title, start, end, description, color, dataEventColor; 
	
	//이상 캘린더 생성시 필수적인 요소들(front에서 ajax로 받아올 자료들)
	// 여기서 id는 "newEvent"와 같이 이벤트 종류를 구분하는 id, 따라서 프라이머리 키를 위해 calendarid int 추가
	
	
	//Calendar는 두 가지 방식으로 생성 1. 팀 안에서 Calendar에서 자체적으로 추가 버튼 눌러서 팀이 공유하는 일정을 유저가 직접 생성
	//2. 팀의 모든 task의 마감일을 불러와서 task제목을 title로, task의 마감일을 end로 넣는다. 
	//3. 개인 일정 화면에서 한 유저만의 독립적인 Calendar 생성
	private int calendarId, teamId;
	private String regMemberid;
	
	
	
	public CalendarVO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public CalendarVO(String title, String start, String end, String description, String color, String dataEventColor,
			int calendarId, int teamId, String regMemberid) {
		super();
		this.title = title;
		this.start = start;
		this.end = end;
		this.description = description;
		this.color = color;
		this.dataEventColor = dataEventColor;
		this.calendarId = calendarId;
		this.teamId = teamId;
		this.regMemberid = regMemberid;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getStart() {
		return start;
	}



	public void setStart(String start) {
		this.start = start;
	}



	public String getEnd() {
		return end;
	}



	public void setEnd(String end) {
		this.end = end;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getColor() {
		return color;
	}



	public void setColor(String color) {
		this.color = color;
	}



	public String getDataEventColor() {
		return dataEventColor;
	}



	public void setDataEventColor(String dataEventColor) {
		this.dataEventColor = dataEventColor;
	}



	public int getCalendarId() {
		return calendarId;
	}



	public void setCalendarId(int calendarId) {
		this.calendarId = calendarId;
	}



	public int getTeamId() {
		return teamId;
	}



	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}



	public String getRegMemberid() {
		return regMemberid;
	}



	public void setRegMemberid(String regMemberid) {
		this.regMemberid = regMemberid;
	}



	@Override
	public String toString() {
		return "CalendarVO [title=" + title + ", start=" + start + ", end=" + end + ", description=" + description
				+ ", color=" + color + ", dataEventColor=" + dataEventColor + ", calendarId=" + calendarId + ", teamId="
				+ teamId + ", regMemberid=" + regMemberid + "]";
	}

	
	
	

}
