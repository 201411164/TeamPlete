package kr.co.teamplete.service;

import java.util.Map;

import kr.co.teamplete.dto.MemberVO;

public interface MemberService {

	/* 회원정보 삽입 */
	void insertMember(MemberVO member);

	/* 아이디 중복 체크 */
	int checkIdSignUp(String memberid);

	/* 특정 회원 조회 */
	MemberVO selectMemberById(String memberid);

	// update member login
	public void updateMember(MemberVO member);

	// 회원 탈퇴
	public void deleteMember(String memberid);
	
	//회원정보 수정 시 비밀번호 체크
	public int checkPw(Map<String, String> map);

}
