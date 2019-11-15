package kr.co.teamplete.dao;

import java.util.List;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.TeamMemberVO;
import kr.co.teamplete.dto.TeamVO;

public interface TeamDAO {

	//팀 생성
	public void insert(TeamVO team);
	
	//모든 팀 조회
	public List<TeamVO> selectAll(String memberid);
	
	//특정 팀 조회
	public TeamVO selectByTeam(int teamId);
	
	//팀 멤버 추가
	public void insertMember(TeamMemberVO teamMember);
	
	//팀 모든 멤버 조회
	public List<MemberVO> selectAllTeamMember(int teamId);

}