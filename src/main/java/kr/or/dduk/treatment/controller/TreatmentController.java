package kr.or.dduk.treatment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.common.service.CommonService;
import kr.or.dduk.treatment.service.TreatementService;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.DataWrapper;
import kr.or.dduk.vo.PatientRecordVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TreatmentRoomVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/treatment")
@Controller
public class TreatmentController {
	
	@Autowired
	private TreatementService treatementService;
	
	/**
	 * 대기환자정보 가져와서 페이지로 가져감
	 * @return
	 */
	@RequestMapping("/room")
	public String list(Model model) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		List<PatientVO> patientVOList = this.treatementService.list(param);
		log.info("patientVOList: " + patientVOList);
		
		model.addAttribute("patientVOList",patientVOList);
		
		return "treatment/room";
	}
	/**
	 * 환자 아작쓰 화면에 뿌려주기 위해서,,, 
	 * @param param
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selectPatient" , method = { RequestMethod.POST })
	public List<PatientVO> selectPatient(@RequestBody ClinicChartVO clinicChartVO) {
		
		List<PatientVO> patientVOList = this.treatementService.selectpatient(clinicChartVO);
		
		return patientVOList;
	}
	
	/**
	 * 치료실 배정
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selectroom" , method = { RequestMethod.POST })
	public List<TreatmentRoomVO> selectroom(@RequestBody Map<String, Object> map) {
		
		log.info("roomcheck -> map : " + map);
		
		List<TreatmentRoomVO> TreatmentRoomVOList 
			= this.treatementService.selectroom((int) map.get("treatmentroomNumber"));
		
		return TreatmentRoomVOList;
	}
	
	@ResponseBody
	@RequestMapping(value="/updatetre" , method = { RequestMethod.POST })
	public int updatetre(@RequestBody DataWrapper dataWrapper) {
		
		log.info("dataWrapper!!!!!!!!!!!!!!!!!: " + dataWrapper);
		
		return this.treatementService.updatetre(dataWrapper); 
	}
	
}

