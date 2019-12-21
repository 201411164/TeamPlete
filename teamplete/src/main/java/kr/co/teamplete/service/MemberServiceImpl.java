package kr.co.teamplete.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teamplete.dao.MemberDAO;
import kr.co.teamplete.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberVO member) {
		memberDAO.insert(member);	
	}

	@Override
	public int checkIdSignUp(String memberid) {
		int check = memberDAO.checkId(memberid);
		return check;
	}

	@Override
	public MemberVO selectMemberById(String memberid) {
		MemberVO member = memberDAO.selectMember(memberid);
		return member;
	}
	
	@Override
	 public void updateMember(MemberVO member) {
		memberDAO.updateMember(member);
	}

	@Override
	public void deleteMember(String memberid) {
		memberDAO.deleteMember(memberid);
		
	}
	
	

}
