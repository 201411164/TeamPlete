package kr.co.teamplete.service;

import kr.co.teamplete.dto.BoardVO;
import kr.co.teamplete.dto.MemberVO;

public interface MemberService {
	
	/* 회원정보 삽입 */
	void insertMember(MemberVO member);
	
	/* 아이디 중복 체크 */
	int checkIdSignUp(String memberid);
	
	/* 특정 회원 조회 */
	MemberVO selectMemberById(String memberid);

	 //update member login
	 public void updateMember(MemberVO member);
	 
	 
}
