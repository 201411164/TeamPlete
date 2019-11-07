package kr.co.teamplete.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teamplete.dao.TeamDAO;
import kr.co.teamplete.dto.TeamVO;

@Service
public class TeamServiceImpl implements TeamService{
	
	@Autowired
	private TeamDAO teamDAO;
	
	@Override
	public void insertTeam(TeamVO team) {
		
		teamDAO.insert(team);
	}

	@Override
	public List<TeamVO> selectAllTeam(String memberid) {
		List<TeamVO> teamList = teamDAO.selectAll(memberid);
		return teamList;
	}

}
