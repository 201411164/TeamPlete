package kr.co.teamplete.dao;

import java.util.Map;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.ProfileVO;

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
	
	//회원 등급 수정
	public void updateType(MemberVO member);
	
	//회원테이블의 profile 업데이트
	public void updateProfile(Map<String, String> map);
	
	//프로필 변경 insert
	public void insertProfile(ProfileVO profile);
	
	//해당 아이디의 profile 이미지가 이미 업로드 되어있는지 확인
	public int checkProfile(String memberid);

	
	//프로필 변경(modify) update
	public void modifyProfile(ProfileVO profile);
	
	//프로필 변경 delete
	public void deleteProfile(String memberid);
	
	//해당 아이디로 업로드된 프로필 정보 불러오기
	public ProfileVO selectProfile(String memberid);
}
