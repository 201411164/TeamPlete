package kr.co.teamplete.dao;

import java.util.Map;

import kr.co.teamplete.dto.MemberVO;

public interface MemberDAO {
	
	/* 회원가입 */
	public void insert(MemberVO member);
	
	
	/* 아이디 중복 체크 */
	int checkId(String memberid);
	
	/* 특정 회원 조회 */
	MemberVO selectMember(String memberid);
	
	/* update member*/
	public void updateMember(MemberVO member);
	
	// 회원탈퇴
	public void deleteMember(String memberid);
	
	//회원 정보 수정 시 비밀번호 체크
	public int checkPw(Map<String, String> map);
	
	//회원 정보 수정
	public void modifyMemberInfo(MemberVO member);

}
