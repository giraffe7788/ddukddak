package kr.or.dduk.clinic.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.clinic.service.HospitalReceptionService;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.HospitalReceptionVO;

@Controller
@RequestMapping("/reception")
public class HospitalReceptionController {
	
	@Autowired
	HospitalReceptionService hospitalReceptionService;
	
	@Autowired
	SessionInfo sessionInfo;
	
	/**
	 * 현재 담당의가 나인 진료대기환자 목록을 뽑아옴
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getReceptionList")
	public List<HospitalReceptionVO> getReceptionList() {
		String empNo = sessionInfo.getEmpNo();
		List<HospitalReceptionVO> hospitalReceptionVOList = this.hospitalReceptionService.getReceptionList(empNo);
		return hospitalReceptionVOList;
	}
}
