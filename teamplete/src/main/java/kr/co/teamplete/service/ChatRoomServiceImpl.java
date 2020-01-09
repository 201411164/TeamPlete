package kr.co.teamplete.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teamplete.dao.ChatRoomDAO;
import kr.co.teamplete.dto.ChatRoomVO;

@Service
public class ChatRoomServiceImpl implements ChatRoomService{
	
	@Autowired
	private ChatRoomDAO chatRoomDAO;

	@Override
	public void insertGroupChatRoom(ChatRoomVO chatRoom) {
		chatRoomDAO.insertGroupChatRoom(chatRoom);
	}

}
