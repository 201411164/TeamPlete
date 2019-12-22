package kr.co.teamplete.service;

import java.util.List;

import kr.co.teamplete.dto.RequestVO;

public interface RequestService {

	public void insertRequest(RequestVO request);
	
	public List<RequestVO> selectAllRequest(String ownerId);
	
	public List<RequestVO> selectMyRequest(String reqMemberid);
	
}
