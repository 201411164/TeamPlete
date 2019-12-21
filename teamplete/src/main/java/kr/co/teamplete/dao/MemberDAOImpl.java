package kr.co.teamplete.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.MemberVO;

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

}
