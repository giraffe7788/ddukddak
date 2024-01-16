package kr.or.dduk.hrd.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.dduk.calendar.service.CalendarService;
import kr.or.dduk.common.service.CommonService;
import kr.or.dduk.employee.service.EmployeeService;
import kr.or.dduk.util.FileController;
import kr.or.dduk.vo.AuthorityVO;
import kr.or.dduk.vo.DocOfficeVO;
import kr.or.dduk.vo.DocScheduleVO;
import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.ProofApplicationVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@RequestMapping("/hrd")
@Controller
public class HrdController {
	
	@Autowired
	FileController fileController;
	
	@Autowired
	EmployeeService	employeeService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	CalendarService calendarService;
	
	/**
	 * 전체 사원 목록
	 * @param model
	 * @return
	 */
	@GetMapping("/empList")
	public String main(Model model) {
		List<EmployeeVO> empList = this.employeeService.getAllEmp();
		log.info("main -> empList : " + empList);
		
		int waitingCnt = 0;
		int lockedCnt = 0;
		
		for(EmployeeVO empVo : empList) {
			if(empVo.getEmpAcntState().equals("ACST01")) {
				waitingCnt++;
			} else if(empVo.getEmpAcntState().equals("ACST03")) {
				lockedCnt++;
			}
		}
		log.info("mainnnnnnnnnnnnnnnn -> lockedCnt : " + lockedCnt);
		
		model.addAttribute("employeeVOList", empList);
		model.addAttribute("waitingCnt", waitingCnt);
		model.addAttribute("lockedCnt", lockedCnt);
		
		return "hrd/empList";
	}
	
	/**
	 * 비동기통신 방법으로 모든 사원 목록을 가져옴
	 */
	@ResponseBody
	@GetMapping("/getEmpList")
	public List<EmployeeVO> getEmpList() {
		List<EmployeeVO> empVOList = this.employeeService.getAllEmp();
		log.info("getEmpList -> empVOList : " + empVOList);
		
		return empVOList;
	}
	
	/**
	 * 비동기통신 방법으로 승인 관련 사원 목록을 가져옴
	 */
	@ResponseBody
	@GetMapping("/getPermEmpList")
	public List<EmployeeVO> getPermEmpList() {
		List<EmployeeVO> empVOList = this.employeeService.getPermEmpList();
		log.info("getPermEmpList -> empVOList : " + empVOList);
		
		return empVOList;
	}
	
	/**
	 * 계정 조회
	 * @return
	 */
	@ResponseBody
	@PostMapping("/detail")
	public EmployeeVO detail(@RequestParam("empNo") String empNo) {
		log.info("hrd-detail -> empNo : " + empNo);
		EmployeeVO employeeVO = this.employeeService.getHrdDetail(empNo);
		log.info("hrd-detail -> employeeVO : " + employeeVO);
		
		return employeeVO;
	}
	
	/**
	 * 인사과 사원 정보 수정
	 * @param EmployeeVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/update")
	public Map<String, Object> update(@ModelAttribute EmployeeVO employeeVO) {
		
		// 파일 로컬+DB 저장, 파일코드 얻어오고 설정
		if(employeeVO.getUploadFile() != null) {
			Map<String, Object> map = this.fileController.uploadFile(employeeVO.getUploadFile(), "empProfile");
			int result = (Integer)map.get("result"); // db에 insert 성공한 개수
			log.info("result: " + result);
			log.info("map" + map);
			String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
			employeeVO.setAtchFileCd(atchFileCd);
		}
		
		// 만약 비밀번호가 변경됐으면
		if(employeeVO.getEmpPw() != null) {
			// 비밀번호 보안화 인코딩
			String rawPw = employeeVO.getEmpPw();
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String encodedPassword = encoder.encode(rawPw);
			employeeVO.setEmpPw(encodedPassword);
			log.info("update -> employeeVO : " + employeeVO);
		}
		
		// EmployeeVO DB 수정
		int res = this.employeeService.update(employeeVO);
		log.info("update -> res : " + res);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		if(res > 0) { // 수정 성공
			resMap.put("result", "success");
			return resMap;
		}else { 	// 수정 실패
			return null;
		}
	}
	
	/**
	 * 진료실 배정 페이지
	 * @param model
	 * @return
	 */
	@GetMapping("/assignClinicRoom")
	public String assignClinicRoom(Model model) {
		
		// 모든 의사 프로필 가져오기
		List<EmployeeVO> doctorVOList = this.employeeService.getAllDoctorDetail();
		// 일정을 넣을 리스트
//		List<DocScheduleVO> docScheduleVOList = new ArrayList<DocScheduleVO>();
		// 모든 진료실 가져오기
		List<DocOfficeVO> docOfficeVOList = this.commonService.getOfficesCondition();
		
		// 현재 시각에 진행되는 일정을 가져와서 리스트에 넣기
//		for(EmployeeVO doctorVO : doctorVOList) {
//			
//			List<DocScheduleVO> docScheduleVO = this.employeeService.getPresentSchedule(doctorVO.getEmpNo());
//			docScheduleVOList.addAll(docScheduleVO);
//		}
		
		// 날짜에서 T를 공백으로 바꾸기
//		for(DocScheduleVO docScheduleVO : docScheduleVOList) {
//			String startDate = docScheduleVO.getDsStrDate().replace("T", " ");
//			String endDate = docScheduleVO.getDsEndDate().replace("T", " ");
//			docScheduleVO.setDsStrDate(startDate);
//			docScheduleVO.setDsEndDate(endDate);
//		}
		
		model.addAttribute("doctorVOList", doctorVOList);
//		model.addAttribute("docScheduleVOList", docScheduleVOList);
		model.addAttribute("docOfficeVOList", docOfficeVOList);
		return "hrd/assignClinicRoom";
	}
	
	/**
	 * xhr ajax 비동기 통신으로 의사를 진료실에 배정하는 메서드
	 * @param docOfficeVO 진료실 번호, 의사 사번
	 * @return 0: 실패, 1: 성공
	 */
	@ResponseBody
	@PostMapping("/assignDoctorToClinicRoom")
	public int assignDoctorToClinicRoom(@RequestBody DocOfficeVO docOfficeVO) {
		log.info("data => " + docOfficeVO);
		
		int result = 0;
		
		result = this.employeeService.assignDoctorToClinicRoom(docOfficeVO);
		
		return result;
	}
	
	/**
	 * xhr ajax 비동기 통신으로 의사를 진료실에 배정하는 메서드
	 * @param docOfficeVO 진료실 번호, 의사 사번
	 * @return 0: 실패, 1: 성공
	 */
	@ResponseBody
	@PostMapping("/getPresentSchedule")
	public DocScheduleVO getPresentSchedule(@RequestBody EmployeeVO employeeVO) {
		log.info("data => " + employeeVO);
		
		DocScheduleVO docScheduleVO = this.employeeService.getPresentSchedule(employeeVO.getEmpNo());
		
		return docScheduleVO;
	}
	
	/**
	 * xhr ajax 비동기 통신으로 진료실에 배정된 의사를 취소시키는 메서드
	 * @param docOfficeVO 진료실 번호, 의사 사번
	 * @return 0: 실패, 1: 성공
	 */
	@ResponseBody
	@PostMapping("/removeDoctorFromClinicRoom")
	public int removeDoctorFromClinicRoom(@RequestBody DocOfficeVO docOfficeVO) {
		int result = 0;
		
		result = this.employeeService.removeDoctorFromClinicRoom(docOfficeVO.getDoNo());
		
		return result;
	}
	
	/**
	 * 통계 페이지
	 * @param model
	 * @return
	 */
	@GetMapping("/analytics")
	public String analytics() {
		return "hrd/analytics";
	}
	
	/**
	 * 부서별 전체 재직중인 사원 수 -통계
	 * @param
	 * @return
	 */
	@ResponseBody
	@GetMapping("/workingEmpListA")
	public String workingEmpListA() {
		List<HashMap<String, Object>> workingAllEmpList = this.employeeService.workingEmpListA();
		log.info("workingAllEmpList : {}", workingAllEmpList);
		
		Gson gson = new Gson();
		String empAnalList = gson.toJson(workingAllEmpList);
		log.info("workingEmpListA->empAnalList : {}", empAnalList);
		
		return empAnalList;
	}
	
	/**
	 * 연도별 입사 / 퇴사 사원 수 - 통계
	 * @param model
	 * @return
	 */
	@ResponseBody
	@GetMapping("/inOutEmpListA")
	public String inOutEmpListA() {
		// 연도별 입사 사원 수 가져옴
		List<HashMap<String, Object>> inEmpListA = this.employeeService.inEmpListA();
		log.info("inOutEmpListA->inEmpListA : {}", inEmpListA);
		// 연도별 퇴사 사원 수 가져옴
		List<HashMap<String, Object>> outEmpListA = this.employeeService.outEmpListA();
		log.info("inOutEmpListA->outEmpListA : {}", outEmpListA);
		// 입사 퇴사 리스트 하나로 합침
		List<HashMap<String, Object>> combinedList = new ArrayList<>();
        combinedList.addAll(inEmpListA);
        combinedList.addAll(outEmpListA);
        log.info("inOutEmpListA->combinedList : {}", combinedList);
        // JSON으로 바꿔서 보내기
		Gson gson = new Gson();
		String empAnalList = gson.toJson(combinedList);
		log.info("inOutEmpListA->empAnalList : {}", empAnalList);
		
		return empAnalList;
	}
	
	/**
	 * 부서별 사원 수 - 통계
	 * @param model
	 * @return
	 */
	@ResponseBody
	@GetMapping("/genEmpListA")
	public String genEmpListA() {
		// 부서별 사원 수 성별따라 가져옴
		List<HashMap<String, Object>> genEmpListA = this.employeeService.genEmpListA();
		log.info("inOutEmpListA->genEmpListA : {}", genEmpListA);
		
		Gson gson = new Gson();
		String empAnalList = gson.toJson(genEmpListA);
		log.info("inOutEmpListA->empAnalList : {}", empAnalList);
		
		return empAnalList;
	}
	
	/**
	 * 선택된 월 해당 의사 스케줄 분포도 - 통계
	 * @param month
	 * @return
	 */
	@ResponseBody
	@GetMapping("/docSchListA")
	public String docSchListA(@RequestParam("month") String month) {
		log.info("docSchListA->month : ", month);
		
		// 선택한 월에 해당하는 의사 스케줄 가져오기
		List<HashMap<String, Object>> docSchListA = this.calendarService.docSchListA(month);
		log.info("docSchListA->docSchListA : {}", docSchListA);
		
		Gson gson = new Gson();
		String empAnalList = gson.toJson(docSchListA);
		log.info("docSchListA->empAnalList : {}", empAnalList);
		
		return empAnalList;
	}
	
	/**
	 * 선택된 월 해당 간호사 스케줄 분포도 - 통계
	 * @param month
	 * @return
	 */
	@ResponseBody
	@GetMapping("/nurSchListA")
	public String nurSchListA(@RequestParam("month") String month) {
		log.info("nurSchListA->month : ", month);
		
		// 선택한 월에 해당하는 간호사 스케줄 가져오기
		List<HashMap<String, Object>> nurSchListA = this.calendarService.nurSchListA(month);
		log.info("nurSchListA->nurSchListA : {}", nurSchListA);
		
		Gson gson = new Gson();
		String empAnalList = gson.toJson(nurSchListA);
		log.info("nurSchListA->empAnalList : {}", empAnalList);
		
		return empAnalList;
	}
}
