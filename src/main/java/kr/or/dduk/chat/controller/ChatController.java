package kr.or.dduk.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.chat.service.IChatService;
import kr.or.dduk.vo.ChatRoomVO;
import kr.or.dduk.vo.ChatVO;
import kr.or.dduk.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 	실시간 채팅
 * @author 202306_JYG2
 *
 */
@Slf4j
@Controller
@RequestMapping("/ddukddak")
public class ChatController {
		
	@Autowired
	private IChatService chatService;
	
	@GetMapping(value="/chat")
	public String chat() {
		return "emp/chat";
	}
	
	/**
	 * 직원목록 출력
	 * @return 직원목록
	 */
	@ResponseBody
	@RequestMapping(value="/chatting/employee/list", method=RequestMethod.POST)
	public List<EmployeeVO> employeeList(){
		log.info("employeeList() 실행~");
		List<EmployeeVO> employeeList = this.chatService.employeeList();
		log.info("직원목록 : " + employeeList);
		return employeeList;
	}
	
	/**
	 * 채팅방 목록 출력
	 * @return 채팅방 목록
	 */
	@ResponseBody
	@RequestMapping(value="/chatting/room/list", method=RequestMethod.POST)
	public List<ChatRoomVO> chatRoomList(){
		Map<String, String> map = new HashedMap();
		log.info("chatRoomList() 실행~");
		List<ChatRoomVO> chatRoomList = this.chatService.chatRoomList(map);
		log.info("채팅방 목록 : " + chatRoomList);
		return chatRoomList;
	}
	
	/**
	 * 채팅방 생성
	 * @param map 
	 * @return 채팅방명, 선택된 직원
	 */
	@ResponseBody
	@RequestMapping(value="/chatting/room/create", method=RequestMethod.POST)
	public int chatRoomCreate(
	         @RequestBody Map<String,Object> map) {
		//map : {chatRmNm=ㅁㄴㄹㅇ, selectEmployee=[a001, a002]}
		log.info("map : " + map);
		//chatRmNm : 11
	    log.info("chatRmNm : " + map.get("chatRmNm"));
	    log.info("selectEmployee : " + map.get("selectEmployee"));

	    String chatRmNm = (String)map.get("chatRmNm");
	    List<String> selectEmployee = (List<String>)map.get("selectEmployee");
	    
	    log.info("selectEmployee : " + selectEmployee);
	    
//	    String chatRoomCreate = this.chatService.chatRoomCreate(chatRmNm, selectEmployee);
	    int chatRoomCreate = this.chatService.chatRoomCreate(chatRmNm, selectEmployee);
	    
	    return chatRoomCreate;
	    
	}
//	//채팅방에 속한 직원정보
//	@ResponseBody
//	@RequestMapping(value="/chatting/room/employee", method=RequestMethod.POST)
//	public List<ChatRoomVO> chatRoomEmployee() {
//		Map<String, String> map = new HashMap<String, String>();
//		log.info("chatRoomEmployee->map : ", map);
//		List<ChatRoomVO> chatRoomEmployee = chatService.chatRoomEmployee(map);
//		log.info("chatRoomEmployee : ", chatRoomEmployee);
//		return chatRoomEmployee;
//	}
	
	
	/**
	 * 채팅내역 출력
	 * @return 채팅내역
	 */
	@ResponseBody
	@RequestMapping(value="/chatting/chat/list", method=RequestMethod.POST)
	public List<ChatVO> chatList(@RequestBody String chatRmNo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chatRmNo", chatRmNo);
		List<ChatVO> chatList = chatService.chatList(map);
		return chatList;
	}
	
	/**
	 * 채팅내용 입력
	 * @param map
	 * @return 채팅내용
	 */
	@ResponseBody
	@RequestMapping(value="/chatting/chat/Insert", method=RequestMethod.POST)
	public int chatInsert(@RequestBody ChatVO chatVO) {
		log.info("chatInsert() 실행~");
		log.info("chatInsert->chatVO : " + chatVO);
		System.out.println("charVO => " + chatVO);
//		chatVO.setChatFileCd("1234");
		int chatInsert = this.chatService.chatInsert(chatVO);
		return chatInsert;
	}
	
}
