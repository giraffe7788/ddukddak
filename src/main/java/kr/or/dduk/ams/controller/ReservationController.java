package kr.or.dduk.ams.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.dduk.ams.service.ReservationService;
import kr.or.dduk.calendar.service.CalendarService;
import kr.or.dduk.vo.DocScheduleVO;
import kr.or.dduk.vo.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/reserve")
@Controller
public class ReservationController {
	
	@Autowired
	ReservationService reservationService;
	
	@Autowired
	CalendarService calendarService;
	
	@GetMapping("/reservation")
	public String main() {
		
		return "ams/reservation";
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
	 * 해당 날짜의 진료예약 가져오기
	 * @param reservationVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getReservationList")
	public List<ReservationVO> getReservationList(@RequestBody ReservationVO reservationVO){
		List<ReservationVO> data = this.reservationService.getReservationList(reservationVO);
		log.info("reservationList -> date" + data);
		
		return data;
	}
	
	/**
	 * 통계용 예약 월별
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getReservationListByMonth")
	public List<ReservationVO> getReservationListByMonth(@RequestBody String jsonData) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode jsonNode = objectMapper.readTree(jsonData);
			String year = jsonNode.get("year").asText();
			String month = jsonNode.get("month").asText();
			
			map.put("year", year);		// 현재 해
			map.put("month", month);		// 현재 해
			
			log.info("year" + year);
			log.info("month" + month);
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		List<ReservationVO> data = this.reservationService.getReservationListByMonth(map);
		log.info("reservationList -> date" + data);
		
		return data;
	}
	
	
	/**
	 * 예약하기
	 * @param reservationVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/createReservation")
	public int createReservation(@RequestBody ReservationVO reservationVO) {
		
		int reselt = this.reservationService.createReservation(reservationVO);
		
		return reselt;
	}
	
	
	
	
}
