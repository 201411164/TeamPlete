package kr.co.teamplete.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.FileVO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TaskFileVO;
import kr.co.teamplete.dto.TaskVO;

@Repository
public class TaskDAOImpl implements TaskDAO{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void insertTask(TaskVO task) {
		session.insert("kr.co.teamplete.dao.TaskDAO.insertTask", task);
	}

	@Override
	public List<TaskVO> selectAllTask(int teamId) {
		List<TaskVO> taskList = session.selectList("kr.co.teamplete.dao.TaskDAO.selectAllTask", teamId);
		return taskList;
	}

	@Override
	public void updateTask(TaskVO task) {
		session.update("kr.co.teamplete.dao.TaskDAO.updateTask", task);
		
	}

	@Override
	public void deleteTask(int taskId) {
		session.delete("kr.co.teamplete.dao.TaskDAO.deleteTask", taskId);
		
	}

	@Override
	public TaskVO selectTask(int taskId) {
		TaskVO task = session.selectOne("kr.co.teamplete.dao.TaskDAO.selectTask", taskId);
		
		return task;
	}

	@Override
	public void insertTaskFile(TaskFileVO file) {
		 session.insert("kr.co.teamplete.dao.TaskDAO.insertTaskFile", file);		
	}
	
	//태스크 수정시 파일 업로드
	@Override
	public void insertTaskFileModify(TaskFileVO file) {
		session.insert("kr.co.teamplete.dao.TaskDAO.insertTaskFileModify", file);
		
	}
	
	//수정시 파일 삭제
	@Override
	public void deleteTaskFile(int fileNo) {
		session.delete("kr.co.teamplete.dao.TaskDAO.deleteTaskFile", fileNo);
		
	}

	@Override
	public List<TaskFileVO> selectAllTaskFiles(int taskId) {
	      List<TaskFileVO> fileList = session.selectList("kr.co.teamplete.dao.TaskDAO.selectAllTaskFiles", taskId);
	      return fileList;
	}

	@Override
	public void insertCharge(ChargeVO charge) {
		session.insert("kr.co.teamplete.dao.TaskDAO.insertCharge", charge);
		
	}
	
	//태스크 수정시 담당자 추가
	@Override
	public void insertChargeModify(ChargeVO charge) {
		session.insert("kr.co.teamplete.dao.TaskDAO.insertChargeModify", charge);
		
	}
	
	//태스크 수정시 담당자 삭제
	@Override
	public void deleteCharge(int chargeId) {
		session.delete("kr.co.teamplete.dao.TaskDAO.deleteCharge", chargeId);
	}

	@Override
	public List<ChargeVO> selectAllsubmit(int taskId) {
		List<ChargeVO> chargeList = session.selectList("kr.co.teamplete.dao.TaskDAO.selectAllsubmit", taskId);
		return chargeList;
	}

	@Override
	public List<ChargeVO> selectNsubmit(int taskId) {
		List<ChargeVO> chargeList = session.selectList("kr.co.teamplete.dao.TaskDAO.selectNsubmit", taskId);
		return chargeList;
	}

	@Override
	public List<ChargeVO> selectYsubmit(int taskId) {
		List<ChargeVO> chargeList = session.selectList("kr.co.teamplete.dao.TaskDAO.selectYsubmit", taskId);
		return chargeList;
	}

	@Override
	public void updateSubmit(ChargeVO charge) {
		session.update("kr.co.teamplete.dao.TaskDAO.updateSubmit", charge);
		
	}

	@Override
	public List<MemberVO> selectNotChargeMembers(Map<String, Integer> map) {
		List<MemberVO> notChargeMembers = session.selectList("kr.co.teamplete.dao.TaskDAO.notTaskChargeMembers", map);
		return notChargeMembers;
	}

	@Override
	public List<TaskVO> notSubmitMyTask(int teamId) {
		List<TaskVO> taskList = session.selectList("kr.co.teamplete.dao.TaskDAO.notSubmitMyTask", teamId);
		return taskList;
	}
	
	@Override
	public List<TaskVO> notSubmitMyTaskAll(String memberid){
		List<TaskVO> taskList = session.selectList("kr.co.teamplete.dao.TaskDAO.notSubmitMyTaskAll", memberid);
		return taskList;
	}

	@Override
	public TaskFileVO selectOneFile(int fileNo) {
		TaskFileVO file = session.selectOne("kr.co.teamplete.dao.TaskDAO.selectOneFile", fileNo);
		return file;
	}


}
