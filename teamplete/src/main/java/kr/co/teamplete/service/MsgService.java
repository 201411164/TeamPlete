package kr.co.teamplete.service;

import java.util.List;

import kr.co.teamplete.dto.MsgVO;

public interface MsgService {
	
	// insert message
	public void insertMsg(MsgVO msg);

	// select message
	public List<MsgVO> selectMsg(int roomId);

}
