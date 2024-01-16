
package kr.or.dduk.clinic.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.ams.service.PayService;
import kr.or.dduk.clinic.service.ClinicService;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.HospitalReceptionVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.PayVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 의사 진료 컨트롤러
 * @author 김영남
 */
@Slf4j
@Controller
@RequestMapping("/clinic")
public class ClinicController {

	
	@Autowired
	ClinicService clinicService;
	
	@Autowired
	PayService payService;
	
	/**
	 * 진료화면 이동
	 * @return
	 */
	@GetMapping("/clinicChart")
	public String chart() {
		return "doctor/clinicChart";
	}
	
	
	/**
	 * 특정 환자의 진료정보들을 간략하게 가져오는 메서드
	 * 환자정보 클릭시 해당환자의 진료목록을 가져오기 위한 메서드
	 * @param paNo 환자번호
	 */
	@ResponseBody
	@PostMapping("/simpleClinicChartList")
	public PatientVO simpleClinicChartList(String paNo){
		PatientVO patientVO = this.clinicService.simpleClinicChartList(paNo);
		return patientVO;
	}
	
	
	/**
	 * 특정 진료의 정보를 자세히 가져오는 메서드
	 * 환자의 진료목록에서 특정 진료를 클릭 시 해당 진료의 정보를 자세히 화면에 출력시켜주기 위한 메서드
	 * @param clinicNo 진료번호
	 */
	@ResponseBody
	@PostMapping("/clinicChartDetail")
	public ClinicChartVO clinicChartDetail(String clinicNo) {
		return this.clinicService.clinicChartDetail(clinicNo);
	}
	
	
	/**
	 * 특정 진료의 정보를 자세히 가져오는 메서드
	 * 회진 페이지에서만 쓰려고 경량화한 쿼리
	 * @param clinicNo 진료번호
	 */
	@ResponseBody
	@PostMapping("/lightWeightClinicChartDetail")
	public ClinicChartVO lightWeightClinicChartDetail(String clinicNo) {
		return this.clinicService.clinicChartDetail(clinicNo);
	}
	
	
	/**
	 * 환자의 대기 목록에서 대기중인 환자를 클릭 시, 호출완료로 변경 및 진료차트 테이블에 데이터 생성
	 * @param	HospitalReceptionVO, hsrpNo(접수번호)와 paNo(환자번호)를 포함
	 * @return	Map<String, Object> 성공여부인 result와 진료번호인 clinicNo를 key값으로 가짐
	 */
	@ResponseBody
	@PostMapping("/startClinicChart")
	public Map<String, Object> startClinicChart(@RequestBody HospitalReceptionVO hospitalReceptionVO){
		
		Map<String,Object> map = this.clinicService.startClinicChart(hospitalReceptionVO);
		return map;
	}
	
	
	/**
	 * 접수번호를 바탕으로 진료의 정보를 가져와서 리턴시켜주는 메소드
	 */
	@ResponseBody
	@PostMapping("/continueClinicChart")
	public ClinicChartVO continueClinicChart(String hsrpNo) {
		return this.clinicService.continueClinicChart(hsrpNo);
	}
	
	
	/**
	 * 진료차트를 업데이트시켜준다 (진료중>검사중, 검사완료>진료완료)
	 * @param clinicChartVO 업데이트 시킬 진료차트의 정보
	 * @return 성공여부
	 */
	@ResponseBody
	@PostMapping("/updateClinicChart")
	public int updateClinicChart(@RequestBody ClinicChartVO clinicChartVO) {
		
		int result = 0;

		result += this.clinicService.updateClinicChart(clinicChartVO);
		
		// 만약 진료상태가 CRST04, CRST06(진료완료, 처치대기) 이면 수납 테이블 생성
		if(clinicChartVO.getClinicState().equals("CRST04") || clinicChartVO.getClinicState().equals("CRST06")) {

			// 입원번호로 진료번호 가져오기
			String hsrpNo = clinicChartVO.getHsrpNo();
			String clinicNo = this.clinicService.getClinicNoByHsrpNo(hsrpNo);
			
		    // 수납 테이블 insert
		    String paNo = clinicChartVO.getPaNo();
		    PayVO payVO = new PayVO();
		    payVO.setPaNo(paNo);
		    payVO.setClinicNo(clinicNo);
		    result += payService.insertPay(payVO);
		}
		
		return result;
	}
	
	
	/**
	 * 진료차트의 진료상태를 업데이트해주는 메서드
	 * @param clinicChartVO 진료번호와 진료상태
	 * @return 성공여부
	 */
	@ResponseBody
	@PostMapping("/updateClinicState")
	public int updateClinicState(@RequestBody ClinicChartVO clinicChartVO) {
		return this.clinicService.updateClinicState(clinicChartVO);
	}
}
