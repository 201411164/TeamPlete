package kr.co.teamplete.dao;

import java.util.List;

import kr.co.teamplete.dto.MsgVO;

public interface MsgDAO {
	
	// insert message
	public void insertMsg(MsgVO msg);

	// select message
	public List<MsgVO> selectMsg(int roomId);
	
}
