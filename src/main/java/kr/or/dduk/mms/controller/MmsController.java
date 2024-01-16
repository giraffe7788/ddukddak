package kr.or.dduk.mms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.ams.service.AdmissionService;
import kr.or.dduk.ams.service.HospitalReceptionService;
import kr.or.dduk.ams.service.ReservationService;
import kr.or.dduk.common.service.CommonService;
import kr.or.dduk.mms.service.MmsService;
import kr.or.dduk.vo.HospitalReceptionVO;
import kr.or.dduk.vo.MmsFormVO;
import kr.or.dduk.vo.MmsHstrVO;
import kr.or.dduk.vo.MmsVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.ReservationVO;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/crm")
public class MmsController {

	//문자 서비스
	@Autowired
	MmsService mmsService;
	
	//환자 리스트 가저오기 위한 커먼서비스
	@Autowired
	CommonService commonService;
	
	//예약 리스트 가저오기 위한 서비스
	@Autowired
	ReservationService reservationService;
	
	//입원 환자 리스트 가저오는 서비스
	@Autowired
	AdmissionService admissionService;
	
	/**
	 * 문자 메인 화면
	 * @param model 문자 형식, 내역 저장
	 * @return MMS.jsp
	 */
	@GetMapping("/mms")
	public String mySms(Model model) {
		//모든 양식 가져오기
		List<MmsFormVO> mmsFormVOList = this.mmsService.getAllForm();
		List<MmsHstrVO> mmsHstrVOList = this.mmsService.getAllHstr();
		
		//환자 불러오기
		List<PatientVO> patientVOList = this.commonService.list();
		//예약리스트 불러오기
		List<ReservationVO> receptionVOList = this.reservationService.getReservationUntilToday();
		//입원 환자 불러오기
		List<PatientVO> admissionPatientVOList = this.admissionService.getAllAdmissionPatient();
		
		//데이터 저장
		model.addAttribute("mmsFormVOList", mmsFormVOList);
		model.addAttribute("mmsHstrVOList", mmsHstrVOList);
		model.addAttribute("patientVOList", patientVOList);
		model.addAttribute("receptionVOList", receptionVOList);
		model.addAttribute("admissionPatientVOList", admissionPatientVOList);
		
		return "crm/mms";
	}
	    
	/**
	 * 문자 보내기
	 * @param to 수신자
	 * @return 0 : 실패 / 1 : 성공
	 * @throws CoolsmsException
	 */
	@PostMapping("/sendMMS")
	@ResponseBody
	public int sendMMS(@RequestBody List<MmsVO> list) throws CoolsmsException {  	
		return mmsService.sendMMS(list);
	}
	
	/**
	 * 문자 양식 추가
	 * @param mmsFormVO 문자 양식 제목, 내용
	 * @return 0 : 실패 / 1 : 성공
	 */
	@PostMapping("/addForm")
	@ResponseBody
	public MmsFormVO addForm(@RequestBody MmsFormVO mmsFormVO){
		mmsService.addForm(mmsFormVO);
		System.out.println(mmsFormVO);
		return mmsFormVO;
	}
	
	/**
	 * 문자 양식 수정
	 * @param mmsFormVO 문자 양식 코드, 제목, 내용
	 * @return 0 : 실패 / 1 : 성공
	 */
	@PostMapping("/updateForm")
	@ResponseBody
	public int updateForm(@RequestBody MmsFormVO mmsFormVO){
		return mmsService.updateForm(mmsFormVO);
	}
	
	/**
	 * 문자 양식 삭제
	 * @param mmsFormVO 문자 양식 코드
	 * @return 0 : 실패 / 1 : 성공
	 */
	@PostMapping("/deleteForm")
	@ResponseBody
	public int deleteForm(@RequestBody MmsFormVO mmsFormVO){
		System.out.println(mmsFormVO);
		return mmsService.deleteForm(mmsFormVO);
	}
	
	/**
	 * 문자 내역 추가
	 * @param mmsHstrVO 문자 양식 코드, 발신자, 수신자, 내용
	 * @return 0 : 실패 / 1 : 성공
	 */
	@PostMapping("/addHstr")
	@ResponseBody
	public int addHstr(@RequestBody List<MmsHstrVO> mmsHstrVOList){
		return mmsService.addHstr(mmsHstrVOList);
	}
}
