package kr.co.teamplete.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teamplete.dao.ActivityDAO;
import kr.co.teamplete.dto.ActivityVO;

@Service
public class ActivityServiceImpl implements ActivityService{
	
	@Autowired
	private ActivityDAO activityDAO;

	@Override
	public void insertActivity(ActivityVO activity) {
		activityDAO.insertActivity(activity);
	}

	@Override
	public List<ActivityVO> selectAllActivity(int teamId) {
		List<ActivityVO> activityList = activityDAO.selectAllActivity(teamId);
		return activityList;
	}

}
