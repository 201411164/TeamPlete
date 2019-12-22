package kr.co.teamplete.service;

import java.util.List;
import java.util.Map;

import kr.co.teamplete.dto.MemberVO;
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
	
	//팀의 모든 멤버 조회
	List<MemberVO> selectAllMembers(int teamId);
	
	//모든 멤버 조회
	List<MemberVO> selectAllMembers();
	
	//팀 정보 업데이트
	public void updateTeamInfo(TeamVO team);
	
	//팀 삭제
	public void deleteTeamById(int teamId);
	
	//팀에 없는 멤버들 조회
	public List<MemberVO> NotInTeamMembers(int teamId);
	
	//팀에서 나가기
	public void outFromTeam(Map<String, Object> map);
}
