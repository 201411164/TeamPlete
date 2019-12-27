package kr.co.teamplete.service;

import java.util.List;

import kr.co.teamplete.dto.ActivityVO;

public interface ActivityService {

	
	// insert activity
	public void insertActivity(ActivityVO activity);
	
	// 팀의 activity 조회
	public List<ActivityVO> selectAllActivity(int teamId);
	
}
