package kr.or.dduk.chat.service;

import java.util.List;
import java.util.Map;

import kr.or.dduk.vo.ChatRoomVO;
import kr.or.dduk.vo.ChatVO;
import kr.or.dduk.vo.EmployeeVO;

public interface IChatService {

	List<EmployeeVO> employeeList();

	List<ChatRoomVO> chatRoomList(Map<String, String> map);

	int chatRoomCreate(String chatRmNm, List<String> selectEmployee);

	List<ChatVO> chatList(Map<String, Object> map);

	int chatInsert(ChatVO chatVO);

//	List<ChatRoomVO> chatRoomEmployee(Map<String, String> map);

}
