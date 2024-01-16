package kr.or.dduk.nurse.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import kr.or.dduk.ams.service.HospitalReceptionService;
import kr.or.dduk.nurse.service.NurseTestService;
import kr.or.dduk.util.FileController;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TestOrderVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/nurse")
public class nurseTestController {
	
	// 현재 접속한 사람의 사번을 가져오기 위해
	@Autowired
	SessionInfo sessionInfo;
	
	// 검사 결과 사진 첨부 파일
	@Autowired
	FileController fileController;
	
	@Autowired
	NurseTestService nurseTestService; 
	
	@GetMapping("/test")
	public String main() {
		return "nurse/nurseTest";
	}
	
	/**
	 * 검사 대기 환자 목록 가져오기
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getTestPatList")
	public List<PatientVO> getTestPatList() {
		List<PatientVO> patientVOList = this.nurseTestService.getTestPatList();
		log.info("getTestPatList->patientVOList : " + patientVOList );
		
		return patientVOList;
	}
	
	/**
	 * 목록에서 선택한 환자 정보 가져오기
	 * @param patientVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getTestPatDetail")
	public PatientVO getTestPatDetail(String clinicNo) {
		log.info("getTestPatDetail->clinicNo : " + clinicNo );
		
		PatientVO slctPatientVO = this.nurseTestService.getTestPatDetail(clinicNo);
		log.info("getTestPatDetail->slctPatientVO : " + slctPatientVO );
		
		String empNo = sessionInfo.getEmpNo();
		slctPatientVO.setNowEmpNo(empNo);
		
		return slctPatientVO;
	}
	
	/**
	 * QR코드 생성
	 * @param url
	 * @return
	 * @throws WriterException
	 * @throws IOException
	 */
	@ResponseBody
	@PostMapping(value="/getQRcode")
	public Map<String, Object> qrToTistory(String paNo) throws WriterException, IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 입력된 paNo
		log.info("paNo : " + paNo);
		
		// qr코드 생성부분
	    int width = 200;
	    int height = 200;
	    
	    // qr생성부분
	    BitMatrix encode = new MultiFormatWriter().encode(paNo, BarcodeFormat.QR_CODE, width, height);
	    ByteArrayOutputStream out = new ByteArrayOutputStream();
	    MatrixToImageWriter.writeToStream(encode, "PNG", out);

	    // 파일 저장 부분
//	    File file = new File("qr저장링크");
//		FileOutputStream fileOutputStream = new FileOutputStream(file);
//		fileOutputStream.write(out.toByteArray());
	    
	    // out을 Base64로 인코딩 후 반환
	    byte[] imageBytes = out.toByteArray();
	    String base64Encoded = Base64.getEncoder().encodeToString(imageBytes);
	    log.info(base64Encoded);
	    map.put("base64Encoded",base64Encoded);

	    return map;
	}
	
	/**
	 * 특정 검사오더를 업데이트 시켜준다
	 * @param testOrderVO 업데이트시킬 검사오더VO
	 * @return result 결과
	 */
	@ResponseBody
	@PostMapping("/updateTestOrder")
	public int updateTestOrder(@ModelAttribute TestOrderVO testOrderVO) {
		// 파일 로컬+DB 저장, 파일코드 얻어오고 설정
		if(testOrderVO.getUploadFile() != null) {
			Map<String, Object> map = this.fileController.uploadFile(testOrderVO.getUploadFile(), "testOrderResult");
			int result = (Integer)map.get("result"); // db에 insert 성공한 개수
			String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
			log.info("updateTestOrder -> atchFileCd : " + atchFileCd);
			testOrderVO.setAtchFileCd(atchFileCd);
			log.info("updateTestOrder -> testOrderVO : " + testOrderVO);
		}
		
		// testOrderVO DB 수정
		return this.nurseTestService.updateTestOrder(testOrderVO);
	}
}
