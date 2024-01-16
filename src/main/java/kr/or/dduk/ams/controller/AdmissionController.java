package kr.or.dduk.ams.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.dduk.ams.service.AdmissionService;
import kr.or.dduk.ams.service.PayService;
import kr.or.dduk.employee.service.EmployeeService;
import kr.or.dduk.util.FileController;
import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.AdmissionRoomVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.DataWrapper;
import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.PayVO;
import kr.or.dduk.vo.ProofApplicationVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 원무과 입/퇴원 관리
 * @author 202306_JYG2
 *
 */
@Slf4j
@Controller
@RequestMapping("/ams")
public class AdmissionController {

	@Autowired
	private AdmissionService admissionService;
	
	// 의사 리스트를 가저오는 서비스
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	PayService payService;
	
	@Autowired
	FileController fileController;
	
	/**
	 * 입/퇴원 페이지 이동
	 * @return
	 */
	@RequestMapping(value="/admission")
	public String admission(Model model) {
		List<AdmissionRoomVO> admissionRoomVOList = admissionService.admissionRoomVOList();
		log.info("admissionRoomVOList : " + admissionRoomVOList);
		model.addAttribute("admissionRoomVOList", admissionRoomVOList);
		log.info("병상 : " + admissionRoomVOList.size());
		//의사 리스트 만들기
		List<EmployeeVO> doctorVOList = this.employeeService.getDoctorList();
		log.info("doctorVOList : " + doctorVOList);
		model.addAttribute("doctorVOList", doctorVOList);
		
		return "ams/admission";
	}
	
	/**
	 * 입원대기환자 조회
	 * @return 입원대기환자
	 */
	@ResponseBody
	@PostMapping("/selectAdmissionList")
	public List<PatientVO> selectAdmissionList(String clinicNo){
		List<PatientVO> selectAdmissionList = admissionService.selectAdmissionList(clinicNo);
		log.info("selectAdmissionList : " + selectAdmissionList);
		return selectAdmissionList;
	}
	
	/**
	 * 퇴원대기환자 조회
	 * @return 퇴원대기환자
	 */
	@ResponseBody
	@PostMapping("/selectDischargeList")
	public List<PatientVO> selectDischargeList(String clinicNo){
		List<PatientVO> selectDischargeList = admissionService.selectDischargeList(clinicNo);
		log.info("selectDischargeList : " + selectDischargeList);
		return selectDischargeList;
	}
	
	/**
	 * 대기환자 클릭 시 환자정보 상세조회
	 * @param paNo
	 * @return 환자정보
	 */
	@ResponseBody
	@PostMapping("/getPatientDetail")
	public List<PatientVO> getPatientDetail(String paNo) {
		log.info("paNo : " + paNo);
		List<PatientVO> getPatientDetail = this.admissionService.getPatientDetail(paNo);
		log.info("getPatientDetail : " + getPatientDetail);
		return getPatientDetail;
	}
	
	
	/**
	 * 의사 소견 가져오기
	 * @param clinicNo
	 * @return 차트번호, 의사소견
	 */
	@ResponseBody
	@PostMapping("/getClinicOpinion")
    public List<ClinicChartVO> getClinicOpinion(String clinicNo) {
        List<ClinicChartVO> getClinicOpinion = admissionService.getClinicOpinion(clinicNo);
        log.info("getClinicOpinion : " + getClinicOpinion);
        return getClinicOpinion;
    }
	
	
	/**
	 * 입원실 현황, 담당의, 입원번호를 가져옴
	 * @return 해당 정보들이 모두 담긴 patientVO 리턴
	 */
	@ResponseBody
	@PostMapping("/getAmsPatientVOList")
	public List<PatientVO> admissionRoomVOList(){
		List<PatientVO> patientVOList = admissionService.getAmsPatientVOList();
		log.info("patientVOList : " + patientVOList);
		return patientVOList;
	}
	
	
	/**
	 * 의사가 진료 완료 시 입원필요를 선택하고 입원 정보를 입력한 후 저장
	 * @param admissionChartVO 입원차트VO
	 * @return 성공여부
	 */
	@ResponseBody
	@PostMapping(value="/admissionInsert")
	public int admissionInsert(@RequestBody DataWrapper dataWrapper) {
		log.info("입원 차트 insert및 진료차트 갱신에 필요한 데이터 : " + dataWrapper);
		return this.admissionService.admissionInsert(dataWrapper);
	}
	
	/**
	 * 선택한 환자 입원
	 * @param map
	 * @return
	 */
	@PostMapping(value="/admissionUpdate")
	public String admissionUpdate(@RequestBody DataWrapper dataWrapper) {
		log.info("admissionUpdate 실행");
		
		Map<String, Object> map = this.fileController.uploadFile(dataWrapper.admissionChartVO.getUploadFile(), "uploadFile");

		String result = admissionService.admissionUpdate(dataWrapper);
		
		String admiFile = (String)map.get("atchFileCd"); // 파일코드
		dataWrapper.admissionChartVO.setAdmiFile(admiFile);
		
		result += this.admissionService.admiFileUpdate(dataWrapper.admissionChartVO);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/admissionUpdateYN")
	public int admissionUpdateYN(@ModelAttribute PatientVO patientVO) {
	    log.info("여기용~ : " + patientVO);
	    
	    // 환자의 입원차트 정보 가져오기
	    List<AdmissionChartVO> admissionChartVOList = patientVO.getAdmissionChartVOList();

        for (AdmissionChartVO admissionChartVO : admissionChartVOList) {
            // 업로드할 파일 가져오고
            MultipartFile[] uploadFile = admissionChartVO.getUploadFile();

            // FileController의 uploadFile로 파일 업로드하고
            Map<String, Object> fileUploadResult = fileController.uploadFile(uploadFile, "admiFile");
            String atchFileCd = (String) fileUploadResult.get("atchFileCd"); // 파일 코드 가져오기

            // 업로드된 파일의 코드를 AdmissionChartVO에 넣고
            admissionChartVO.setAdmiFile(atchFileCd); // admiFile 속성에 파일 코드 설정하기
        }
        
        int result = admissionService.admissionUpdateYN(patientVO);
        
	    return result;
	}
	 
	/**
	 * 퇴원처리
	 * @param dataWrapper
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/dischargeUpdate")
	public String dischargeUpdate(@RequestBody DataWrapper dataWrapper) {
		log.info("admissionUpdate 실행" + dataWrapper);
		String result = admissionService.dischargeUpdate(dataWrapper);
		
	    // 수납 테이블 insert
	    String paNo = dataWrapper.getPatientVO().getPaNo();
	    String admiNo = dataWrapper.getAdmissionChartVO().getAdmiNo();
	    PayVO payVO = new PayVO();
	    payVO.setPaNo(paNo);
	    payVO.setAdmiNo(admiNo);
	    result += payService.insertPay(payVO);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/admissionRoomDetail", method=RequestMethod.POST)
	public List<AdmissionRoomVO> admissionRoomDetail(Model model){
		List<AdmissionRoomVO> admissionRoomDetail = admissionService.admissionRoomVOList();
		log.info("admissionRoomVOList2 : " + admissionRoomDetail);
		model.addAttribute("admissionRoomVOList", admissionRoomDetail);
		log.info("병상 : " + admissionRoomDetail.size());
		return admissionRoomDetail;
	}
	
	@ResponseBody
	@PostMapping(value="/selectAllPatient")
	public List<PatientVO> selectAllPatient() {
		List<PatientVO> selectAllPatient = admissionService.selectAllPatient();
		log.info("selectAllPatient : " + selectAllPatient);
		return selectAllPatient;
	}
}