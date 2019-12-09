package kr.co.teamplete.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.FileVO;
import kr.co.teamplete.dto.TaskFileVO;
import kr.co.teamplete.dto.TaskVO;
import kr.co.teamplete.dto.TeamVO;

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



}
