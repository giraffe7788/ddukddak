package kr.or.dduk.chat.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dduk.chat.service.IChatService;
import kr.or.dduk.mapper.ChatMapper;
import kr.or.dduk.vo.ChatMemberVO;
import kr.or.dduk.vo.ChatRoomVO;
import kr.or.dduk.vo.ChatVO;
import kr.or.dduk.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatServiceImpl implements IChatService{

	@Autowired
	private ChatMapper chatMapper;
	
	@Override
	public List<EmployeeVO> employeeList() {
		List<EmployeeVO> employeeList = chatMapper.employeeList();
		return employeeList;
	}

	@Override
	public List<ChatRoomVO> chatRoomList(Map<String, String> map) {
		List<ChatRoomVO> chatRoomList = chatMapper.chatRoomList(map);
		return chatRoomList;
	}

	@Override
	@Transactional
	public int chatRoomCreate(String chatRmNm, List<String> selectEmployee) {
		//chatRmNm : ㅁㄴㅇㄹ
		//selectEmployee : [a001, a002]

		ChatRoomVO chatRoomVO = new ChatRoomVO();
		chatRoomVO.setChatRmNm(chatRmNm);
		
		log.info("chatRoomCreate->chatRoomVO : " + chatRoomVO);
		
		int result = chatMapper.createRoom(chatRoomVO);
		
        if (result > 0) {
            for (String chatEmployeeNo : selectEmployee) {
            	ChatMemberVO chatMemberVO = new ChatMemberVO();
                chatMemberVO.setEmpNo(chatEmployeeNo);
                chatMemberVO.setChatRmNo(chatRoomVO.getChatRmNo());//selectKey
                //ChatMemberVO(chatRmListNo=0, chatRmNo=14, empNo=a001, empName=null
                //, empDeptCd=null, fileCd=null, chatVOList=null)
                  result += chatMapper.insertChatEmployee(chatMemberVO);
                  
              //자손
              ChatVO chatVO = new ChatVO();
              chatVO.setChatRmListNo(chatMemberVO.getChatRmListNo());//selectKey(자식)
              chatVO.setChatRmNo(chatRoomVO.getChatRmNo());//selectKey(부모)
              chatVO.setEmpNo(chatEmployeeNo);              
              result += chatMapper.insertFirstChat(chatVO);            
            }
        }
        return result;
	}

//	@Override
//	public List<ChatRoomVO> chatRoomEmployee(Map<String, String> map) {
//		List<ChatRoomVO> chatRoomEmployee = chatMapper.chatRoomEmployee(map);
//		return chatRoomEmployee;
//	}
	
	@Override
	public List<ChatVO> chatList(Map<String, Object> map) {
		List<ChatVO> chatList = chatMapper.chatList(map);
		return chatList;
	}

	@Override
	public int chatInsert(ChatVO chatVO) {
		int result = chatMapper.chatInsert(chatVO);
		
		return result;
	}


}
