package kr.or.dduk.treatment.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.dduk.treatment.service.TreatmentRecordService;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TreatmentOrderVO;
import kr.or.dduk.vo.TreatmentStatsVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/treatment")
public class TreatmentRecordController {

	@Autowired
	TreatmentRecordService treatmentRecordService;
	
	/**
	 * 치료기록 페이지 이동
	 * @return
	 */
	@RequestMapping(value="/treatmentRecord")
	public String treatmentRecord(Model model) {
		Gson gson = new Gson();
		
		// 모든 치료오더 리스트를 리턴
		List<ClinicChartVO> clinicChartVOList = this.treatmentRecordService.getAllTreatmentOrderList();
		String clinicChartVOListStr = gson.toJson(clinicChartVOList);
		model.addAttribute("clinicChartVOList", clinicChartVOListStr);
		return "treatment/treatmentRecord";
	}
	
	/**
	 * 치료완료 환자 리스트
	 * @return 치료완료 환자
	 */
	@ResponseBody
	@PostMapping("/treatmentPatientList")
	public List<PatientVO> treatmentPatientList() {
		log.info("treatmentPatientList 실행!!");
		List<PatientVO> treatmentPatientList = treatmentRecordService.treatmentPatientList();
		log.info("treatmentPatientList : " + treatmentPatientList);
		return treatmentPatientList;
	}
	
	/**
	 * 환자 정보 가져오기
	 * @param paNo
	 * @return 환자 정보
	 */
	@ResponseBody
	@PostMapping("/selectTreatmentPatientInfo")
	public PatientVO selectTreatmentPatientInfo(@RequestParam("paNo") String paNo){
		PatientVO patientVO = treatmentRecordService.selectTreatmentPatientInfo(paNo);
		return patientVO;
	}
	
	/**
	 * 과거 치료내역 정보 가져오기
	 * @param clinicNo
	 * @return 과거 치료내역 정보
	 */
	@ResponseBody
	@PostMapping("/selectTreatmentInfo")
	public PatientVO selectTreatmentInfo(//@RequestParam("paNo") String paNo
		    @RequestParam("clinicNo") String clinicNo
		    //@RequestParam("tmCd") String tmCd
			){
	    
	    PatientVO patientVO = treatmentRecordService.selectTreatmentInfo(clinicNo);
	    return patientVO;
	}
	
	/**
	 * 과거 치료내역
	 * @param paNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getTreatmentInfo")
	public PatientVO getTreatmentInfo(@RequestParam("paNo") String paNo){
		PatientVO patientVO = treatmentRecordService.getTreatmentInfo(paNo);
		return patientVO;
	}
	/**
	 * 당일 치료내역 가져오기
	 * @param paNo
	 * @return 당일 치료내역 정보
	 */
	@ResponseBody
	@PostMapping("/selectTodayTreatmentInfo")
	public PatientVO selectTodayTreatmentInfo(String paNo){
		PatientVO patientVO = treatmentRecordService.selectTodayTreatmentInfo(paNo);
		return patientVO;
	}
	
	/**
	 * 치료기록 작성
	 * @param treatmentOrderVO
	 * @return 치료기록
	 */
	@ResponseBody
	@PostMapping("/updateTrodCont")
	public TreatmentOrderVO updateTrodCont(@RequestBody TreatmentOrderVO treatmentOrderVO){
		log.info("치료기록수정!!!" + treatmentOrderVO);
		
		int result = treatmentRecordService.updateTrodCont(treatmentOrderVO);
		return treatmentOrderVO;
	}
	
//	@GetMapping("/treatmentStatistics")
//	public String treatmentStatistics(Model model) {
//		Gson gson = new Gson();
//		
//		// 환부 통계
//		List<TreatmentStatsVO> bodyCdStatisticsList = treatmentRecordService.bodyCdStatisticsList();
//		String bodyCdStatistics = gson.toJson(bodyCdStatisticsList);
//		model.addAttribute("bodyCdStatistics", bodyCdStatistics);
//		return "treatment/treatmentRecord";
//	}
}
