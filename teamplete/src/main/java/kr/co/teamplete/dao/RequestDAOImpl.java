package kr.co.teamplete.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.RequestVO;

@Repository
public class RequestDAOImpl implements RequestDAO{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void insertRequest(RequestVO request) {
		session.insert("kr.co.teamplete.dao.RequestDAO.insertRequest", request);
	}

	@Override
	public List<RequestVO> selectAllRequest(String ownerId) {
		List<RequestVO> requestList = session.selectList("kr.co.teamplete.dao.RequestDAO.selectAllRequest", ownerId);
		return requestList;
	}

	@Override
	public List<RequestVO> selectMyRequest(String reqMemberid) {
		List<RequestVO> requestList = session.selectList("kr.co.teamplete.dao.RequestDAO.selectMyRequest", reqMemberid);
		return requestList;
	}

}
