package kr.or.dduk.mapper;

import java.util.List;
import java.util.Map;

import kr.or.dduk.vo.ChatMemberVO;
import kr.or.dduk.vo.ChatRoomVO;
import kr.or.dduk.vo.ChatVO;
import kr.or.dduk.vo.EmployeeVO;

public interface ChatMapper {

	List<EmployeeVO> employeeList();

	List<ChatRoomVO> chatRoomList(Map<String, String> map);

	int createRoom(ChatRoomVO chatRoomVO);

	int insertChatEmployee(ChatMemberVO chatMemberVO);
	
	int insertFirstChat(ChatVO chatVO);

	List<ChatVO> chatList(Map<String, Object> map);

	int chatInsert(ChatVO chatVO);

//	List<ChatRoomVO> chatRoomEmployee(Map<String, String> map);

}
