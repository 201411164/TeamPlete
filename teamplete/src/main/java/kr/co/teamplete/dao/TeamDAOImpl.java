package kr.co.teamplete.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TeamMemberVO;
import kr.co.teamplete.dto.TeamVO;

@Repository
public class TeamDAOImpl implements TeamDAO{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void insert(TeamVO team) {
		session.insert("kr.co.teamplete.dao.TeamDAO.insert", team);
	}

	@Override
	public List<TeamVO> selectAll(String memberid) {
		List<TeamVO> teamList = session.selectList("kr.co.teamplete.dao.TeamDAO.selectAll", memberid);
		return teamList;
	}

	@Override
	public TeamVO selectByTeam(int teamId) {
		TeamVO team = session.selectOne("kr.co.teamplete.dao.TeamDAO.selectTeam", teamId);
		return team;
	}

	@Override
	public void insertMember(TeamMemberVO teamMember) {
		session.insert("kr.co.teamplete.dao.TeamDAO.insertMember", teamMember);
		
	}

	@Override
	public List<MemberVO> selectAllTeamMember(int teamId) {
		List<MemberVO> members = session.selectList("kr.co.teamplete.dao.TeamDAO.selectTeamMember", teamId);
		return members;
	}
	
	@Override
	public List<MemberVO> selectAllTeamMember() {
		List<MemberVO> members = session.selectList("kr.co.teamplete.dao.TeamDAO.selectAllMember");
		return members;
	}

	@Override
	public void updateMembers(TeamVO team) {
		session.update("kr.co.teamplete.dao.TeamDAO.membersUpdate", team);
		
	}

	@Override
	public void updateTeam(TeamVO team) {
		session.update("kr.co.teamplete.dao.TeamDAO.updateTeam", team);
		
	}

	@Override
	public void deleteTeam(int teamId) {
		session.delete("kr.co.teamplete.dao.TeamDAO.deleteTeam", teamId);
		
	}

	@Override
	public List<MemberVO> selectNotInTeamMembers(int teamId) {
		List<MemberVO> notTeamMembers = session.selectList("kr.co.teamplete.dao.TeamDAO.selectNotInTeamMemebers", teamId);
		return notTeamMembers;
	}

	@Override
	public void outFromTeam(Map<String, Object> map) {
		session.delete("kr.co.teamplete.dao.TeamDAO.outFromTeam", map);
		
	}

	@Override
	public void taskLatest(int teamId) {
		session.update("kr.co.teamplete.dao.TeamDAO.taskLatest", teamId);
		
	}

	@Override
	public void boardLatest(int teamId) {
		session.update("kr.co.teamplete.dao.TeamDAO.boardLatest", teamId);
		
	}
	
}
