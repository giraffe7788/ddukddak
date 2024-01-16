package kr.or.dduk.ams.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kr.or.dduk.ams.service.AdmissionService;
import kr.or.dduk.ams.service.HospitalReceptionService;
import kr.or.dduk.ams.service.ReservationService;
import kr.or.dduk.nurse.service.MedicineManagementService;
import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.HospitalReceptionVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.PurchaseMedicineDetailVO;
import kr.or.dduk.vo.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ams")
public class StatisticsController {
	@Autowired
	MedicineManagementService medicineManagementService;
	
	@Autowired
	HospitalReceptionService hospitalReceptionService;
	
	@Autowired
	AdmissionService admissionService;
	
	@Autowired
	ReservationService reservationService;
	
	@GetMapping("/test")
	public String test(Model model) {
		Gson gson = new Gson();
		
		List<PurchaseMedicineDetailVO> purchaseMedicineDetailVOList = medicineManagementService.getAllPurchasedMedicine();
		String purchaseMedicineDetailVOListStr = gson.toJson(purchaseMedicineDetailVOList);
		
		
		
		model.addAttribute("purchaseMedicineDetailVOList", purchaseMedicineDetailVOListStr);
		
		return "ams/test";
	}
	
	@GetMapping("/statistics")
	public String dyStatistics(Model model) {
		// java 객체를 json으로 변환시키는 객체
		Gson gson = new Gson();
		
		List<PurchaseMedicineDetailVO> purchaseMedicineDetailVOList = medicineManagementService.getAllPurchasedMedicine();
		String purchaseMedicineDetailVOListStr = gson.toJson(purchaseMedicineDetailVOList);
		
		model.addAttribute("purchaseMedicineDetailVOList", purchaseMedicineDetailVOListStr);
		return "ams/dyStatistics";
	}
	
	/**
	 * 접수데이터 가져오기
	 * @return 접수VO List
	 */
	@PostMapping("/getAllReceptionList")
	@ResponseBody
	public List<HospitalReceptionVO> getAllReceptionList() {
		List<HospitalReceptionVO> hospitalReceptionVOList = hospitalReceptionService.getAllReceptionList();
		return hospitalReceptionVOList;
	}
	
	/**
	 * 재방문 환자와 첫방문 환자 가져오기
	 * @return Map(Key: 컬럼 이름, Value: 숫자)
	 */
	@PostMapping("/getRevisitPatient")
	@ResponseBody
	public Map<String, Object> getRevisitPatient() {
		Map<String, Object> RevisitMap = hospitalReceptionService.getRevisitPatient();
		log.info("RevisitMap=>" + RevisitMap);
		return RevisitMap;
	}
	
	@PostMapping("/getAllAdmission")
	@ResponseBody
	public List<AdmissionChartVO> getAllAdmission() {
		List<AdmissionChartVO> AdmissionChartVOList = this.admissionService.getAllAdmission();
		return AdmissionChartVOList;
	}
	
	@PostMapping("/getAdmissionListByMonth")
	@ResponseBody
	public List<AdmissionChartVO> getAdmissionListByMonth(@RequestBody String jsonData) {
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
		
		List<AdmissionChartVO> AdmissionChartVOList = this.admissionService.getAdmissionListByMonth(map);
		return AdmissionChartVOList;
	}
	
	@PostMapping("/getAllReservation")
	@ResponseBody
	public List<ReservationVO> getAllReservation() {
		List<ReservationVO> reservationVOList = this.reservationService.getAllReservation();
		return reservationVOList;
	}
	
	@PostMapping("/getAllAdmissionPatientList")
	@ResponseBody
	public List<PatientVO> getAllAdmissionPatientList() {
		List<PatientVO> patientVOList = this.admissionService.getAllAdmissionPatientList();
		return patientVOList;
	}
	
	@PostMapping("/getAdmissionPatientListByMonth")
	@ResponseBody
	public List<PatientVO> getAdmissionPatientListByMonth(@RequestBody String jsonData) {
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
		List<PatientVO> patientVOList = this.admissionService.getAdmissionPatientListByMonth(map);
		return patientVOList;
	}
}
