package kr.co.teamplete.dao;

import java.util.List;
import java.util.Map;

import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.RequestVO;

public interface RequestDAO {
	
	// insert request
	public void insertRequest(RequestVO request);
	
	// 팀장에게 온 request 조회
	public List<RequestVO> selectAllRequest(String ownerId);
	
	// 내가 보낸 request 조회
	public List<RequestVO> selectMyRequest(String reqMemberid);
	
	//request 삭제
	public void deleteRequest(Map<String, Object> map);

}
