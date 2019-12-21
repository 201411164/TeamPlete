package kr.co.teamplete.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.teamplete.dao.TaskDAO;
import kr.co.teamplete.dao.TeamDAO;
import kr.co.teamplete.dto.ChargeVO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TaskFileVO;
import kr.co.teamplete.dto.TaskVO;

@Service
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskDAO taskDAO;
	
	@Autowired
	private TeamDAO teamDAO;

	@Override
	public void insertTaskS(TaskVO task) {
		
		List<TaskFileVO> taskFileList = null;
		
		List<String> chargeMems = task.getChargeMems();

		try {
			taskFileList = getTaskFileInfo(task);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		taskDAO.insertTask(task);
		
		teamDAO.taskLatest(task.getTeamId());

		for (TaskFileVO taskFile : taskFileList) {
			taskDAO.insertTaskFile(taskFile);
		}
//		System.out.println(taskFileList.toString());
		
		if(chargeMems != null) {
			for (String mems : chargeMems) {
				ChargeVO charge = new ChargeVO();
				charge.setChargeMemberid(mems);
				charge.setSubmit('N');
				taskDAO.insertCharge(charge);
			}
		}

	}

	/* 게시판 첨부파일 정보 조회 */
	public List<TaskFileVO> getTaskFileInfo(TaskVO task) throws IllegalStateException, IOException {

		List<MultipartFile> files = task.getTaskFiles();

		List<TaskFileVO> taskFileList = new ArrayList<TaskFileVO>();

		TaskFileVO taskFile = new TaskFileVO();

		int taskId = task.getTaskId();
		String insUserId = task.getWriterId();
		String fileNameKey = null;
		String fileName = null;
		String fileExt = null; // 확장자
		String fileSize = null;
		// 파일이 저장될 path 설정
		String filePath = "C:\\fileUpload\\task";

		if (files != null && files.size() > 0) {
			File file = new File(filePath);

			// 디렉토리가 없으면 생성
			if (file.exists() == false) {
				file.mkdirs();
			}

			for (MultipartFile multipartFile : files) {

				fileName = multipartFile.getOriginalFilename();
				fileExt = fileName.substring(fileName.lastIndexOf("."));
				// 파일명 변경(uuid로 암호화) + 확장자
				fileNameKey = getRandomString() + fileExt;
				fileSize = String.valueOf(multipartFile.getSize());

				// 설정한 Path에 파일 저장
				file = new File(filePath + "/" + fileNameKey);

				multipartFile.transferTo(file);

				taskFile = new TaskFileVO();
				taskFile.setTaskId(taskId);
				taskFile.setFileName(fileName);
				taskFile.setFileNameKey(fileNameKey);
				taskFile.setFilePath(URLEncoder.encode(filePath, "utf-8"));
				taskFile.setFileSize(fileSize);
				taskFile.setInsUserId(insUserId);
				taskFile.setDelYN('N');
				taskFileList.add(taskFile);

			}
		} else {
			files = null;
		}

		return taskFileList;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	@Override
	public List<TaskVO> selectAllTaskS(int teamId) {
		List<TaskVO> taskList = taskDAO.selectAllTask(teamId);
		return taskList;
	}

	@Override
	public void updateTaskS(TaskVO task) {
		
		List<TaskFileVO> taskFileList = null;
		
		List<String> chargeMems = task.getChargeMems();

		try {
			taskFileList = getTaskFileInfo(task);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		taskDAO.updateTask(task);
		
		teamDAO.taskLatest(task.getTeamId());
		
		List<Integer> deleteFiles = task.getDeleteFiles();
		
		if(deleteFiles != null) {
			for (Integer fileNo : deleteFiles) {
				taskDAO.deleteTaskFile(fileNo);
			}
		}
		
		List<Integer> deleteChargeList = task.getDeleteCharge();
		
		if(deleteChargeList != null) {
			for(Integer chargeId : deleteChargeList) {
				taskDAO.deleteCharge(chargeId);
			}
		}
		

		for (TaskFileVO taskFile : taskFileList) {
			taskDAO.insertTaskFileModify(taskFile);
		}
		
		if(chargeMems != null) {
			for (String mems : chargeMems) {
				ChargeVO charge = new ChargeVO();
				charge.setTaskId(task.getTaskId());
				charge.setChargeMemberid(mems);
				charge.setSubmit('N');
				taskDAO.insertChargeModify(charge);
			}
		}

	}

	@Override
	public void deleteTaskS(int taskId) {
		taskDAO.deleteTask(taskId);

	}

	@Override
	public TaskVO selectTaskS(int taskId) {
		TaskVO task = taskDAO.selectTask(taskId);
		return task;
	}

	@Override
	public List<TaskFileVO> selectAllTaskFileS(int taskId) {
		List<TaskFileVO> fileList = taskDAO.selectAllTaskFiles(taskId);
		return fileList;
	}


	@Override
	public List<ChargeVO> selectAllsubmitS(int taskId) {
		List<ChargeVO> taskList = taskDAO.selectAllsubmit(taskId);
		return taskList;
	}

	@Override
	public List<ChargeVO> selectNsubmitS(int taskId) {
		List<ChargeVO> taskList = taskDAO.selectNsubmit(taskId);
		return taskList;
	}

	@Override
	public List<ChargeVO> selectYsubmitS(int taskId) {
		List<ChargeVO> taskList = taskDAO.selectYsubmit(taskId);
		return taskList;
	}

	@Override
	public void updateSubmitS(ChargeVO charge) {
		taskDAO.updateSubmit(charge);
	}

	@Override
	public List<MemberVO> NotChargeMembers(Map<String, Integer> map) {
		List<MemberVO> notChargeMembers = taskDAO.selectNotChargeMembers(map);
		return notChargeMembers;
	}

	@Override
	public List<TaskVO> notSubmitMyTask(int teamId) {
		List<TaskVO> taskList = taskDAO.notSubmitMyTask(teamId);
		return taskList;
	}

}
