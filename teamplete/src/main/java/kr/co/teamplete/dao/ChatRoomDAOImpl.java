package kr.co.teamplete.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teamplete.dto.ChatRoomVO;

@Repository
public class ChatRoomDAOImpl implements ChatRoomDAO{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void insertGroupChatRoom(ChatRoomVO chatRoom) {
		session.insert("kr.co.teamplete.dao.ChatRoomDAO.insertGroupChatRoom", chatRoom);
	}

}
