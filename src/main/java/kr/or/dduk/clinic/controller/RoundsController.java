package kr.or.dduk.clinic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.clinic.service.RoundsService;
import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.PatientVO;

/**
 * 회진 컨트롤러
 * @author 영남
 */
@Controller
@RequestMapping("/rounds")
public class RoundsController {
	
	
	@Autowired
	RoundsService roundsService;
	
	
	@GetMapping("/chart")
	public String chart() {
		return "doctor/rounds";
	}
	
	
	/**
	 * 회진 페이지 에서 과거 입원내역 리스트를 뽑아오기 위한 메서드
	 * @param paNo 환자번호
	 * @return 과거 입원내역 리스트
	 */
	@ResponseBody
	@PostMapping("/simpleAdmissionChartList")
	public List<AdmissionChartVO> simpleAdmissionChartList(String paNo){
		return this.roundsService.simpleAdmissionChartList(paNo);
	}
	
	
	/**
	 * 회진 페이지에서 과거 입원내역 리스트중 특정 입원 클릭시 실행되는 메서드
	 * 해당 입원에서 받은 심플 회진 리스트를 받아옴
	 * @param admiNo 입원번호
	 * @return 회진내역 리스트
	 */
	@ResponseBody
	@PostMapping("/simpleRoundsChartList")
	public AdmissionChartVO simpleRoundsChartList(String admiNo) {
		return this.roundsService.simpleRoundsChartList(admiNo);
	}
	
	
	/**
	 * 회진 페이지에서 현재 입원 정보와 현재 입원에서 실행한 모든 회진 정보를 가져와서 리스트로 만들어줌
	 * @param admiNo 입원번호
	 * @return 입원일, 예상퇴원일, 담당의, 진료날짜 진료상태 진료코드만 
	 */
	@ResponseBody
	@PostMapping("/currentSimpleAdmissionChartList")
	public AdmissionChartVO currentSimpleAdmissionChartList(String admiNo) {
		return this.roundsService.currentSimpleAdmissionChartList(admiNo);
	}
	
	
	/** 
	 * 회진 페이지에서 회진을 시작하고 저장을 누를 때 저장시키는 메서드
	 * @param ClinicVO 회진정보
	 * @return result 성공여부
	 */
	@ResponseBody
	@PostMapping("/createRoundsChart")
	public int createRoundsChart(@RequestBody ClinicChartVO clinicChartVO) {
		return this.roundsService.createRoundsChart(clinicChartVO);
	}
	
	
	/** 
	 * 회진 페이지에서 검사가 완료된 회진을 이어하고, 저장을 누를 때 갱신시키는 메서드
	 * @param ClinicVO 회진정보
	 * @return result 성공여부
	 */
	@ResponseBody
	@PostMapping("/updateRoundsChart")
	public int updateRoundsChart(@RequestBody ClinicChartVO clinicChartVO) {
		return this.roundsService.updateRoundsChart(clinicChartVO);
	}
}
