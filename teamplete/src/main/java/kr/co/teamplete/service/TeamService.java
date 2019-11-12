package kr.co.teamplete.service;

import java.util.List;

import kr.co.teamplete.dto.TeamMemberVO;
import kr.co.teamplete.dto.TeamVO;

public interface TeamService {

	// 팀 생성
	void insertTeam(TeamVO team);
	
	//모든 팀 조회
	List<TeamVO> selectAllTeam(String memberid);
	
	//특정 팀 조회
	TeamVO detailTeam(int teamId);
	
	//팀 멤버 추가
	void insertTeamMem(TeamMemberVO teamMember);
}
