package kr.co.teamplete.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.ActivityVO;

@Repository
public class ActivityDAOImpl implements ActivityDAO{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void insertActivity(ActivityVO activity) {
		
		session.insert("kr.co.teamplete.dao.ActivityDAO.insertActivity", activity);
	}

	@Override
	public List<ActivityVO> selectAllActivity(int teamId) {
		List<ActivityVO> activityList = session.selectList("kr.co.teamplete.dao.ActivityDAO.selectActivity", teamId);
		return activityList;
	}

}
