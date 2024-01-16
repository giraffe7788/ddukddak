package kr.or.dduk.nurse.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.dduk.mapper.NurseTestMapper;
import kr.or.dduk.nurse.service.NurseTestService;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TestOrderVO;

@Service
public class NurseTestServiceImpl implements NurseTestService{
	
	@Autowired
	NurseTestMapper nurseTestMapper;
	
	@Autowired
	SessionInfo sessionInfo;

	@Override
	public List<PatientVO> getTestPatList() {
		return this.nurseTestMapper.getTestPatList();
	}

	@Override
	public PatientVO getTestPatDetail(String clinicNo) {
		return this.nurseTestMapper.getTestPatDetail(clinicNo);
	}
	
	/**
	 * 특정 검사오더를 업데이트 시켜준다
	 * @param testOrderVO 업데이트시킬 검사오더VO
	 * @return result 결과
	 */
	@Override
	public int updateTestOrder(TestOrderVO testOrderVO) {
		
		// 사번(검사자)를 세션에서 넣어준다
		testOrderVO.setTestOrderEmpNo(sessionInfo.getEmpNo());
		
		return this.nurseTestMapper.updateTestOrder(testOrderVO);
	}
}
