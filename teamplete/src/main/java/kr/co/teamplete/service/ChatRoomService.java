package kr.co.teamplete.service;

import kr.co.teamplete.dto.ChatRoomVO;

public interface ChatRoomService {
	
	//팀의 단체 채팅방 insert
	public void insertGroupChatRoom(ChatRoomVO chatRoom);

}
