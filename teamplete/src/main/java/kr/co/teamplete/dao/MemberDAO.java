package kr.co.teamplete.dao;

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

}
