package kr.co.teamplete.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.MsgVO;

@Repository
public class MsgDAOImpl implements MsgDAO{
	
	@Autowired
	private SqlSessionTemplate session;


	@Override
	public void insertMsg(MsgVO msg) {
		session.insert("kr.co.teamplete.dao.MsgDAO.insertMsg", msg);
	}


	@Override
	public List<MsgVO> selectMsg(int roomId) {
		List<MsgVO> msgList = session.selectList("kr.co.teamplete.dao.MsgDAO.selectMsg", roomId);
		return msgList;
	}

}
