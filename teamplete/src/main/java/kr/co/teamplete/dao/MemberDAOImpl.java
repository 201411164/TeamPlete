package kr.co.teamplete.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.ProfileVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public void insert(MemberVO member) {
		session.insert("kr.co.teamplete.dao.MemberDAO.insertMember", member);
	}

	@Override
	public int checkId(String memberid) {
		int check = session.selectOne("kr.co.teamplete.dao.MemberDAO.checkId", memberid);

		return check;
	}

	@Override
	public MemberVO selectMember(String memberid) {
		MemberVO member = session.selectOne("kr.co.teamplete.dao.MemberDAO.selectMember", memberid);
		return member;
	}
	
	@Override
	public void updateMember(MemberVO member) {
		session.update("kr.co.teamplete.dao.MemberDAO.updateMember", member);
	}

	@Override
	public void deleteMember(String memberid) {
		session.delete("kr.co.teamplete.dao.MemberDAO.deleteMember", memberid);
		
	}

	@Override
	public int checkPw(Map<String, String> map) {
		
		int count = session.selectOne("kr.co.teamplete.dao.MemberDAO.checkPw", map);
		
		return count;
	}

	@Override
	public void modifyMemberInfo(MemberVO member) {
		session.update("kr.co.teamplete.dao.MemberDAO.modifyMemberInfo", member);
	}

	@Override
	public void updateProfile(Map<String, String> map) {
		session.update("kr.co.teamplete.dao.MemberDAO.updateProfile", map);
	}

	@Override
	public void insertProfile(ProfileVO profile) {
		session.insert("kr.co.teamplete.dao.MemberDAO.insertProfile", profile);
	}

	@Override
	public int checkProfile(String memberid) {
		int cnt = session.selectOne("kr.co.teamplete.dao.MemberDAO.checkProfile", memberid);
		return cnt;
	}

	@Override
	public void modifyProfile(ProfileVO profile) {
		session.update("kr.co.teamplete.dao.MemberDAO.modifyProfile", profile);
	}

	@Override
	public void deleteProfile(String memberid) {
		session.delete("kr.co.teamplete.dao.MemberDAO.deleteProfile", memberid);
	}

	@Override
	public ProfileVO selectProfile(String memberid) {
		ProfileVO profile = session.selectOne("kr.co.teamplete.dao.MemberDAO.selectProfile", memberid);
		return profile;
	}

}
