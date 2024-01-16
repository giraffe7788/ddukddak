package kr.or.dduk.nurse.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.dduk.employee.service.EmployeeService;
import kr.or.dduk.nurse.service.WorkforceManagementService;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.NurScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/nurse")
@Controller
public class WorkforceManagementContoller {
	@Autowired
	SessionInfo sessionInfo;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	WorkforceManagementService workforceManagementService;
	
	/**
	 * 간호사근무관리 페이지
	 * @return
	 */
	@GetMapping("/workforce")
	public String workforce() {
		return "nurse/workforce";
	}
	
	/**
	 * 엑셀로 근무일정 인서트
	 * @param file
	 * @return
	 */
	@ResponseBody
	@PostMapping("/createNurSchedule")
	public int createNurSchedule(@RequestParam("file") MultipartFile file, @RequestParam("jsonParams") String jsonData) {
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
		return this.workforceManagementService.createNurSchedule(file, map);
	}
	
	/**
	 * 근무일정 가져오기
	 * @param jsonData
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getNurScheduleList") 
	public List<NurScheduleVO> getNurScheduleList(@RequestBody String jsonData) {
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
		
		List<NurScheduleVO> nurScheduleVOList = this.workforceManagementService.getNurScheduleList(map);
		
		return nurScheduleVOList;
	}
	
	/**
	 * 간호사 리스트 가져오기
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getNurseList") 
	public List<EmployeeVO> getNurseList() {
		List<EmployeeVO> nurseList = this.workforceManagementService.getNurseList();
		
		return nurseList;
	}
	
	/**
	 * 간호사일정 엑셀파일로 만들기!
	 * @param jsonData
	 * @return
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value="/createWorkforceExcel", method = RequestMethod.POST, produces = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet; charset=utf-8")
	public ResponseEntity<byte[]> createWorkforceExcel(HttpServletResponse response, @RequestBody String jsonData) {
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
			
			// 엑셀 생성 서비스 호출
	        byte[] excelBytes = this.workforceManagementService.createWorkforceExcel(map);

	        // 컨텐츠 타입과 파일명 지정
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.setContentDispositionFormData("attachment","workforce_schedule.xlsx");

	        return ResponseEntity.ok().headers(headers).body(excelBytes);
		} catch (IOException e) {
			 e.printStackTrace();
	         // 에러 처리를 원하는 대로 수행
	         return ResponseEntity.status(500).body(null);
		}
		
//		String downloadDir = System.getProperty("user.home") + "/Downloads";
//		String localFile = downloadDir + "/" + year + "_" + month + "_간호근무일정.xlsx";
//		File file = new File(localFile);
//		
//		FileOutputStream fos = null;
//		fos = new FileOutputStream(file);
//		wb.write(fos);
//
//		if (fos != null) fos.close();
		
//		// 컨텐츠 타입과 파일명 지정
//		response.setContentType("ms-vnd/excel");
//		response.setHeader("Content-Disposition", "attachment;filename=freeBoard.xlsx");  //파일이름지정.
//		//response OutputStream에 엑셀 작성
//		wb.write(response.getOutputStream());
//		
//		wb.close();
//		
////		 // 파일 다운로드용 응답 헤더 설정
////	    HttpHeaders headers = new HttpHeaders();
////	    headers.setContentType(MediaType.parseMediaType("application/vnd.ms-excel"));
////	    headers.setContentDispositionFormData("attachment", localFile);
//
//	    // 파일을 바이트 배열로 변환하여 응답
//	    byte[] excelBytes = Files.readAllBytes(file.toPath());
//	    
//	    return new ResponseEntity<>(excelBytes, headers, HttpStatus.OK);
		
	}
}
