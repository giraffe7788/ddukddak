package kr.or.dduk.employee.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

import kr.or.dduk.employee.service.EmployeeService;
import kr.or.dduk.util.FileController;
import kr.or.dduk.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/emp")
@Controller
public class EmployeeController {

	@Autowired
	FileController fileController;
	
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 회원가입 화면 이동
	 * @return
	 */
	@GetMapping("/create")
	public String create(Model model) {
		// DB에서 제일 마지막 empNo값 가져오기
		String lastEmpNo = this.employeeService.getNewNo();
		log.info("create -> lastEmpNo : " + lastEmpNo);
		// 마지막으로 등록된 사원 입사 연월일 가져오기
		String lastEmpNoDate = lastEmpNo.substring(0, 6);
		
		// 현재 날짜 구하기
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
		// 포맷 적용
		String formatedNow = now.format(formatter);

		// 마지막 등록 날짜와 오늘 비교
		if(lastEmpNoDate.equals(formatedNow)) {
			// 기존에 이어 추가되는 새 시퀀스 값
			Long newEmpNo = Long.parseLong(lastEmpNo) + 1;
		    // 새 시퀀스 값 넣어주기
		    model.addAttribute("newEmpNo", Long.toString(newEmpNo));
			log.info("create -> addEmpNo : " + newEmpNo);
		} else {
			// 날짜까지 새 시퀀스 값
			String newEmpNo = formatedNow + "00001";
		    // 새 시퀀스 값 넣어주기
		    model.addAttribute("newEmpNo", newEmpNo);
		    log.info("create -> newEmpNo : " + newEmpNo);
		}
		
		return "emp/create";
	}
	
	/**
	 * 회원가입 진행
	 * @param employeeVO
	 * @return
	 */
	@PostMapping("/create")
	public String create(EmployeeVO employeeVO) {
		log.info("create -> employeeVO : " + employeeVO);
		
		// 파일 로컬+DB 저장, 파일코드 얻어오고 설정
		Map<String, Object> map = this.fileController.uploadFile(employeeVO.getUploadFile(), "empProfile");
		int reuslt = (Integer)map.get("result"); // db에 insert 성공한 개수
		String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
		employeeVO.setAtchFileCd(atchFileCd);
		
		// 비밀번호 보안화 인코딩
		String rawPw = employeeVO.getEmpPw();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(rawPw);
		employeeVO.setEmpPw(encodedPassword);
		
		//employeeVO를 db에 넣기
		int res = this.employeeService.create(employeeVO);
		log.info("create -> res : " + res);
		
		return "redirect:/common/login";
	}
	
	/**
	 * 사원 상세
	 * @param empNo
	 * @param model
	 * @param atchFileCd
	 * @return
	 */
	@GetMapping("/detail")
	public String detail(@RequestParam String empNo, Model model) {

		EmployeeVO employeeVO = this.employeeService.detail(empNo);
		model.addAttribute("employeeVO", employeeVO);
		log.info("detail -> employeeVO : " + employeeVO);
		
		return "emp/detail";
	}
	
	/**
	 * 마이페이지 사원 수정
	 * @param employeeVO
	 * @return
	 */
	@PostMapping("/update")
	public String update(@ModelAttribute EmployeeVO employeeVO) {
		log.info("update -> employeeVO: " + employeeVO);
		
		// 파일 로컬+DB 저장, 파일코드 얻어오고 설정
		if(employeeVO.getUploadFile() != null && !employeeVO.getUploadFile()[0].isEmpty()) {
			Map<String, Object> map = this.fileController.uploadFile(employeeVO.getUploadFile(), "empProfile");
			int result = (Integer)map.get("result"); // db에 insert 성공한 개수
			log.info("result: " + result);
			log.info("map" + map);
			String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
			employeeVO.setAtchFileCd(atchFileCd);
		}
		
		// 만약 비밀번호가 변경됐으면
		if(employeeVO.getEmpPw() != null && !employeeVO.getEmpPw().isEmpty()) {
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
		
		return "redirect:/emp/detail?empNo="+employeeVO.getEmpNo();
	}
	
	/**
	 * 로그인 사원 계정 상태 조회
	 * @param employeeVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/empStCheckAjax")
	public EmployeeVO empStCheckAjax(@RequestBody EmployeeVO employeeVO) {
		log.info("empStCheckAjax -> employeeVO : " + employeeVO);
		
		EmployeeVO empVO = this.employeeService.detail(employeeVO.getEmpNo());
		log.info("empStCheckAjax -> empVO : " + empVO);
		
		return empVO;
	}
	
	/**
	 * 의사 리스트 출력
	 * @param employeeVO
	 * @return
	 */
	@ResponseBody
	@GetMapping("/getDoctorList")
	public List<EmployeeVO> getDoctorList() {
		List<EmployeeVO> data= this.employeeService.getDoctorList();
		log.info("getDoctorList"+data);
		
		return data;
	}
	
	/**
	 * 상태 따라서 사원 조회
	 * @param empAcntState
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getSttDetail")
	public List<EmployeeVO> getSttDetail(@RequestParam("empAcntState") String empAcntState){
		log.info("getSttDetail -> empAcntState : " + empAcntState);
		// 상태로 조회한 사원 목록 리스트로 가져오기
		List<EmployeeVO> empAcntStateList= this.employeeService.getSttDetail(empAcntState);
		log.info("getSttDetail -> empAcntStgetSttDetailateList" + empAcntStateList);
		
		return empAcntStateList;
	}
	
	/**
	 * 선택한 사번의 상태 변경
	 * @param employeeVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateStt")
	public Map<String, Object> updateStt(@RequestBody EmployeeVO employeeVO){
		log.info("updateStt -> EmployeeVO : " + employeeVO);
		
		// EmployeeVO DB 수정
		int res = this.employeeService.updateStt(employeeVO);
		log.info("updateStt -> res : " + res);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(res > 0) { // 수정 성공
			map.put("result", "success");
			return map;
		}else { 	// 수정 실패
			return null;
		}
	}
}
