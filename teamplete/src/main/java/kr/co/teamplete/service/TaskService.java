package kr.co.teamplete.service;

import java.util.List;
import java.util.Map;

import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TaskFileVO;
import kr.co.teamplete.dto.TaskVO;

public interface TaskService {

	// 태스크 생성
	void insertTaskS(TaskVO task);

	// 모든 태스크 조회
	List<TaskVO> selectAllTaskS(int teamId);

	// 특정 태스크 조회
	TaskVO selectTaskS(int taskId);

	// 태스크 업데이트
	public void updateTaskS(TaskVO task);

	// 태스크 삭제
	public void deleteTaskS(int taskId);

	// task의 모든 파일 조회
	public List<TaskFileVO> selectAllTaskFileS(int taskId);
	
	// 태스크 담당자 전체 조회
	public List<ChargeVO> selectAllsubmitS(int taskId);
	
	// 태스크 담당자 (미제출자)
	public List<ChargeVO> selectNsubmitS(int taskId);
	
	// 태스크 담당자 (제출자)
	public List<ChargeVO> selectYsubmitS(int taskId);
	
	// 태스크 담당자 update
	public void updateSubmitS(ChargeVO charge);
	
	//태스크 담당자가 아닌 팀의 멤버들만 조회
	public List<MemberVO> NotChargeMembers(Map<String, Integer> map);
	
	//모든 태스크 중 로그인 중인 사용자의 제출하지 않은 태스크 목록
	public List<TaskVO> notSubmitMyTask(int teamId);

}
