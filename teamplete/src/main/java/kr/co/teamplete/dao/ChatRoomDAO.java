package kr.co.teamplete.dao;

import kr.co.teamplete.dto.ChatRoomVO;

public interface ChatRoomDAO {
	
	//팀의 단체 채팅방 insert
	public void insertGroupChatRoom(ChatRoomVO chatRoom);

}
