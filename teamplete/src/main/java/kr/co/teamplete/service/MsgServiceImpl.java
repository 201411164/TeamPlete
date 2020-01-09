package kr.co.teamplete.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teamplete.dao.MsgDAO;
import kr.co.teamplete.dto.MsgVO;

@Service
public class MsgServiceImpl implements MsgService{
	
	@Autowired
	private MsgDAO msgDAO;

	@Override
	public void insertMsg(MsgVO msg) {
		msgDAO.insertMsg(msg);
	}

	@Override
	public List<MsgVO> selectMsg(int roomId) {
		List<MsgVO> msgList = msgDAO.selectMsg(roomId);
		return msgList;
	}

}
