package kr.or.dduk.ams.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.ams.service.HospitalReceptionService;
import kr.or.dduk.ams.service.ReservationService;
import kr.or.dduk.common.service.CommonService;
import kr.or.dduk.employee.service.EmployeeService;
import kr.or.dduk.util.FileController;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.DocOfficeVO;
import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.HospitalReceptionVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.ProofApplicationVO;
import kr.or.dduk.vo.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@MultipartConfig
@Slf4j
@RequestMapping("/ams")
@Controller
public class HospitalReceptionController {
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	@Autowired
	HospitalReceptionService hospitalReceptionService;
	
	// 환자 리스트를 위해 쓰는 커먼서비스
	@Autowired
	CommonService commonService;
	
	// 의사 리스트를 가저오는 서비스
	@Autowired
	EmployeeService employeeService;
	
	// 예약 리스트를 가저오는 서비스
	@Autowired
	ReservationService reservationService;
	
	// 현재 접속한 사람의 사번을 가져오기 위해
	@Autowired
	SessionInfo sessionInfo;
	
	@Autowired
	FileController fileController;
	
	
	/**
	 * 접수 페이지
	 * @param model 환자 리스트
	 * @return reception.jsp
	 */
	@GetMapping("/reception")
	public String reception(Model model) {
		//모든 접수 내역 가져오기
		List<HospitalReceptionVO> hospitalReceptionVOList = this.hospitalReceptionService.getTodayReceptionList();
		
		//의사 리스트 만들기
		List<EmployeeVO> doctorVOList = this.employeeService.getDoctorList();
		
		//오늘예약 리스트 만들기
		List<ReservationVO> reservationVOList = this.reservationService.getTodayReservation();
		
		//진료실 상태 가져오기
		List<DocOfficeVO> docOfficeVOList = this.commonService.getOfficesCondition();

		//접수 내역 나누기
		List<HospitalReceptionVO> waitingVOList = new ArrayList<HospitalReceptionVO>();
		List<HospitalReceptionVO> completeVOList = new ArrayList<HospitalReceptionVO>();
		
		//진료상태가 대기중(null)이거나 진료완료(CRST04)가 아닌 환자 리스트를 만들기
		for(HospitalReceptionVO hospitalReceptionVO : hospitalReceptionVOList) {
			if(hospitalReceptionVO.getClinicState()== null || !hospitalReceptionVO.getClinicState().equals("CRST04")) {
				waitingVOList.add(hospitalReceptionVO);
			}
		}
		
		//진료상태가 대기중(null)이 아니고 진료완료(CRST04)인 환자 리스트를 만들기
		for(HospitalReceptionVO hospitalReceptionVO : hospitalReceptionVOList) {
			if(hospitalReceptionVO.getClinicState()!= null && hospitalReceptionVO.getClinicState().equals("CRST04")) {
				completeVOList.add(hospitalReceptionVO);
			}
		}
		
		
		//진료실에 호출된 환자 리스트
		List<HospitalReceptionVO> docOfcList = new ArrayList<>();
		for (HospitalReceptionVO hospitalReceptionVO : hospitalReceptionVOList) {
		    if (!"CRST04".equals(hospitalReceptionVO.getClinicState())) {
		        docOfcList.add(hospitalReceptionVO);
		    }
		}

		log.info("docOfcList => " + docOfcList);
		System.out.println(docOfcList);
		
		
		//환자 관련 데이터
		//대기 환자 리스트
		model.addAttribute("waitingVOList",waitingVOList);
		//진료 완료 환자 리스트
		model.addAttribute("completeVOList",completeVOList);
		//진료실 환자 리스트
		model.addAttribute("docOfficePatientList",docOfcList);
		
		//의사 리스트
		model.addAttribute("doctorVOList",doctorVOList);
		//예약 리스트
		model.addAttribute("reservationVOList",reservationVOList);
		//진료실 리스트
		model.addAttribute("docOfficeVOList",docOfficeVOList);
		
		return "ams/reception";
	}
	
	
	/**
	 * 비동기통신 방법으로 현재 담당의가 나인 진료대기환자 목록을 뽑아옴
	 */
	@ResponseBody
	@PostMapping("/getReceptionList")
	public List<HospitalReceptionVO> getReceptionList() {
		String empNo = sessionInfo.getEmpNo();
		List<HospitalReceptionVO> hospitalReceptionVOList = this.hospitalReceptionService.getReceptionList(empNo);
		return hospitalReceptionVOList;
	}
	
	/**
	 * 제증명 신청
	 * @param proofApplicationVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/createProofApplication")
	public ProofApplicationVO createProofApplication(@RequestBody ProofApplicationVO proofApplicationVO) {
		int result = this.hospitalReceptionService.createProofApplication(proofApplicationVO);
		return proofApplicationVO;
	}
	
	/**
	 * 제증명 업데이트(pdf문서 저장)
	 * @param proofApplicationVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateProofApplication")
	public String updateProofApplication(@ModelAttribute ProofApplicationVO proofApplicationVO) {
		// 파일 로컬+DB 저장, 파일코드 얻어오고 설정
		Map<String, Object> map = this.fileController.uploadPDF(proofApplicationVO.getUploadFile(), "proofDocument");
		int result = (Integer)map.get("result"); // db에 insert 성공한 개수
		log.info("result: " + result);
		log.info("map" + map);
		
		String prdcCd = proofApplicationVO.getPrdcCd();
		
		String proofFileCd = (String)map.get("atchFileCd"); // 파일코드
		proofApplicationVO.setProofFileCd(proofFileCd);
		log.info("??? : " + proofApplicationVO);
		result += this.hospitalReceptionService.updateProofApplication(proofApplicationVO);
		
		return prdcCd;
	}
	
	/**
	 * 비동기통신 방법으로 모든 환자 목록을 가져옴
	 */
	@ResponseBody
	@GetMapping("/getPatientList")
	public List<PatientVO> getPatientList() {
		List<PatientVO> patientVOList = this.commonService.list();
		return patientVOList;
	}
	
	/**
	 * 비동기통신 방법으로 환자 아이디와 일치하는 환자를 가져옴
	 */
	@ResponseBody
	@PostMapping("/searchPatientByNo")
	public PatientVO searchPatientByReg(@RequestBody String paNo) {
		PatientVO patientVO = this.commonService.searchPatientByNo(paNo);
		return patientVO;
	}
	
	/**
	 * 비동기통신 방법으로 주민등록번호과 일치하는 환자를 가져옴
	 */
	@ResponseBody
	@PostMapping("/addReception")
	public int addReception(@RequestBody HospitalReceptionVO hospitalReceptionVO) {
		int result = this.hospitalReceptionService.addReception(hospitalReceptionVO);
		log.info("hospitalReceptionVO : " + hospitalReceptionVO);
		return result;
	}
}
