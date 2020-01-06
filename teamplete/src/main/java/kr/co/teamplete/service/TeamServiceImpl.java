package kr.co.teamplete.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teamplete.dao.ActivityDAO;
import kr.co.teamplete.dao.TeamDAO;
import kr.co.teamplete.dto.ActivityVO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TeamMemberVO;
import kr.co.teamplete.dto.TeamVO;

@Service
public class TeamServiceImpl implements TeamService{
	
	@Autowired
	private TeamDAO teamDAO;
	
	@Autowired
	ActivityDAO activityDAO;
	
	@Override
	public void insertTeam(TeamVO team) {
		
		teamDAO.insert(team);
	}

	@Override
	public List<TeamVO> selectAllTeam(String memberid) {
		List<TeamVO> teamList = teamDAO.selectAll(memberid);
		return teamList;
	}

	@Override
	public TeamVO detailTeam(int teamId) {
		TeamVO team = teamDAO.selectByTeam(teamId);
		return team;
	}

	@Override
	public void insertTeamMem(TeamMemberVO teamMember) {
		teamDAO.insertMember(teamMember);
		
		ActivityVO activity = new ActivityVO();
		
		activity.setTeamId(teamMember.getTeamId());
		activity.setHostId(teamMember.getMemberId());
		activity.setMsg3("초대되었습니다.");
		
		activityDAO.insertActivity(activity);
		
	}

	@Override
	public List<MemberVO> selectAllMembers(int teamId) {
		List<MemberVO> members = teamDAO.selectAllTeamMember(teamId);
		return members;
	}
	
	@Override
	public List<MemberVO> selectAllMembers() {
		List<MemberVO> members = teamDAO.selectAllTeamMember();
		return members;
	}


	@Override
	public void updateTeamInfo(TeamVO team) {
		teamDAO.updateTeam(team);
		
	}

	@Override
	public void deleteTeamById(int teamId) {
		teamDAO.deleteTeam(teamId);
		
	}

	@Override
	public List<MemberVO> NotInTeamMembers(int teamId) {
		List<MemberVO> notTeamMembers = teamDAO.selectNotInTeamMembers(teamId);
		return notTeamMembers;
	}

	@Override
	public void outFromTeam(Map<String, Object> map) {
		teamDAO.outFromTeam(map);
		
		ActivityVO activity = new ActivityVO();
		
		activity.setTeamId((int)map.get("teamId"));
		activity.setHostId((String)map.get("memberId"));
		activity.setMsg3("팀을 나갔습니다.");
		
		activityDAO.insertActivity(activity);
	}

	@Override
	public List<TeamVO> searchTeam(String keyword) {
		List<TeamVO> teamList = teamDAO.searchTeam(keyword);
		return teamList;
	}
	
}
