package kr.co.teamplete.dao;

import java.util.List;
import java.util.Map;

import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.FileVO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TaskFileVO;
import kr.co.teamplete.dto.TaskVO;

public interface TaskDAO {

	// 태스크 생성
	public void insertTask(TaskVO task);

	// 모든 태스크 조회
	public List<TaskVO> selectAllTask(int teamId);

	// 특정 태스크 조회
	public TaskVO selectTask(int taskId);

	// 태스크 수정
	public void updateTask(TaskVO task);

	// 태스크 삭제
	public void deleteTask(int taskId);

	// 파일 업로드
	public void insertTaskFile(TaskFileVO file);
	
	// 태스크 수정시 파일 업로드
	public void insertTaskFileModify(TaskFileVO file);
	
	//수정시 파일 삭제
	public void deleteTaskFile(int fileNo);

	// board의 모든 파일 조회
	public List<TaskFileVO> selectAllTaskFiles(int taskId);

	// 태스트 담장자 추가
	public void insertCharge(ChargeVO charge);
	
	//태스크 수정시 담당자 추가
	public void insertChargeModify(ChargeVO charge);
	
	//태스크 수정시 담당자 삭제
	public void deleteCharge(int chargeId);
	
	// 태스크 담당자 전체 조회
	public List<ChargeVO> selectAllsubmit(int taskId);
	
	// 태스크 담당자 (미제출자)
	public List<ChargeVO> selectNsubmit(int taskId);
	
	// 태스크 담당자 (제출자)
	public List<ChargeVO> selectYsubmit(int taskId);
	
	//태스크 담당자 update
	public void updateSubmit(ChargeVO charge);
	
	//태스크 담당자가 아닌 팀의 멤버들만 조회
	public List<MemberVO> selectNotChargeMembers(Map<String, Integer> map);
	
	// 특정 팀에서 사용자의 제출하지 않은 모든 태스크 목록
	public List<TaskVO> notSubmitMyTask(int teamId);
	
	//  로그인 중인 사용자의 모든 제출하지 않은 태스크 목록
	public List<TaskVO> notSubmitMyTaskAll(String memberId);
	
	// 특정 파일 상세
	public TaskFileVO selectOneFile(int fileNo);
}
