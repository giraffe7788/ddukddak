package kr.or.dduk.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.calendar.service.CalendarService;
import kr.or.dduk.employee.service.EmployeeService;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.AuthorityVO;
import kr.or.dduk.vo.DocScheduleVO;
import kr.or.dduk.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


@Slf4j
@RequestMapping("/calendar")
@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	SessionInfo sessionInfo;
	
	/**
	 * 캘린더에 로그인 정보
	 * @param model
	 * @return
	 */
	@GetMapping("/sch")
    public String baseCalendar() {
        return "calendar/fullcalendar";
    }
	
	/**
	 * 새 일정 추가
	 * @param docScheduleVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/createSch")
	public Map<String, Object> createSch(@RequestBody DocScheduleVO docScheduleVO) {
		log.info("createSc -> docScheduleVO : " + docScheduleVO);
		
		int res = this.calendarService.createSch(docScheduleVO);
		log.info("createSc -> res : " + res);

		Map<String, Object> map = new HashMap<String, Object>();
		if(res > 0) { // 등록 성공
			map.put("result", "success");
			return map;
		}else { 	// 실패
			return null;
		}
	}
	
	/**
	 * 일정 번호로 저장된 일정 삭제
	 * @param dsNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteSch")
	public Map<String, Object> deleteSch(@RequestParam("dsNo") String dsNo) {
		log.info("deleteSch -> docScheduleVO : " + dsNo);
		
		int res = this.calendarService.deleteSch(dsNo);
		log.info("deleteSch -> res : " + res);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(res > 0) { // 삭제 성공
			map.put("result", "success");
			return map;
		}else { 	// 삭제 실패
			return null;
		}
	}
	
	/**
	 * 풀캘린더에 표시할 DB 내 전체 일정정보 리스트로 가져오기
	 * @param year
	 * @return
	 */
	@ResponseBody
	@PostMapping("/schList")
	public List<DocScheduleVO> schList(@RequestParam("year") String year){
		log.info("selectSch -> year : " + year);
		
		// jsp에서 가져온 현재 해 맵에 담기
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("year", year);		// 현재 해
		log.info("list -> map : " + map);
		// 현재 해 
		List<DocScheduleVO> data = this.calendarService.schList(year);
		log.info("list -> data :" + data);
		
		return data;
	}
	
	/**
	 * 풀캘린더에 표시할 DB 의사별 일정정보 리스트로 가져오기
	 * @param year
	 * @return
	 */
	@ResponseBody
	@PostMapping("/schListByDoc")
	public List<DocScheduleVO> schListByDoc(@RequestParam("year") String year, @RequestParam("empNo") String empNo){
		log.info("schListByDoc -> year : " + year);
		
		// jsp에서 가져온 현재 해 맵에 담기
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("year", year);		// 현재 해
		map.put("empNo", empNo);	// 사번
		log.info("list -> map : " + map);
		// 현재 해 
		List<DocScheduleVO> data = this.calendarService.schListByDoc(map);
		log.info("list -> data :" + data);
		
		return data;
	}
	
	/**
	 * 풀캘린더에 표시할 DB 내 일정정보 사번 별로 리스트로 가져오기
	 * @param year, empNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/schListEmpNo")
	public List<DocScheduleVO> schListEmpNo(@RequestBody String jsonData){
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("schListEmpNo -> "+jsonData);
		
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode jsonNode = objectMapper.readTree(jsonData);
			
			String empNo = jsonNode.get("empNo").asText();
			String year = jsonNode.get("year").asText();
			
			map.put("year", year);		// 현재 해
			map.put("empNo", empNo);		// 현재 해
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		// jsp에서 가져온 현재 해 맵에 담기
		
		log.info("list -> map : " + map);
		// 현재 해 
		List<DocScheduleVO> data = this.calendarService.schListEmpNo(map);
		log.info("list -> data :" + data);
		
		return data;
	}
	
	/**
	 * 일정 번호로 해당 일정 상세 정보 가져오기
	 * @param dsNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/selectSch")
	public DocScheduleVO selectSch(@RequestParam("dsNo") String dsNo) {
		log.info("selectSch -> dsNo : " + dsNo);
		
		DocScheduleVO slctdSch = this.calendarService.selectSch(dsNo);
		log.info("selectSch -> slctdSch : " + slctdSch);
		
		return slctdSch;
	}
	
	/**
	 * 일정 번호로 일정 찾아서 수정 - empNo 제외
	 * @param docScheduleVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateSch")
	public Map<String, Object> updateSch(@RequestBody DocScheduleVO docScheduleVO) {
		log.info("updateSch -> docScheduleVO : " + docScheduleVO );
		
		int res = this.calendarService.updateSch(docScheduleVO);
		log.info("updateSch -> res : " + res);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res > 0) { // 수정 성공
			map.put("result", "success");
			return map;
		}else { 	// 수정 실패
			return null;
		}
	}
	
	/**
	 * 날짜, 사원번호로 일정 정보 가져오기
	 * @param docScheduleVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/selectByDate")
	public List<DocScheduleVO> selectByDate(@RequestBody String jsonData) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode jsonNode = objectMapper.readTree(jsonData);
			
			String empNo = jsonNode.get("empNo").asText();
			String rsvtDt = jsonNode.get("rsvtDt").asText();
			
			map.put("rsvtDt", rsvtDt);
			map.put("empNo", empNo);
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		log.info("맵 : " + map);
		List<DocScheduleVO> data = this.calendarService.selectByDate(map);
		
		return data;
	}
	
}
