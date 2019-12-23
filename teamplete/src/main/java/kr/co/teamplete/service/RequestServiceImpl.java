package kr.co.teamplete.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teamplete.dao.RequestDAO;
import kr.co.teamplete.dto.RequestVO;

@Service
public class RequestServiceImpl implements RequestService{
	
	@Autowired
	private RequestDAO requestDAO;

	@Override
	public void insertRequest(RequestVO request) {
		requestDAO.insertRequest(request);
	}

	@Override
	public List<RequestVO> selectAllRequest(String ownerId) {
		List<RequestVO> requestList = requestDAO.selectAllRequest(ownerId);
		return requestList;
	}

	@Override
	public List<RequestVO> selectMyRequest(String reqMemberid) {
		List<RequestVO> requestList = requestDAO.selectMyRequest(reqMemberid);
		return requestList;
	}

	@Override
	public void deleteRequest(Map<String, Object> map) {
		requestDAO.deleteRequest(map);
	}
}
