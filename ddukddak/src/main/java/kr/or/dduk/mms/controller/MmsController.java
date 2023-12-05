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

import kr.or.dduk.mms.service.MmsService;
import kr.or.dduk.vo.MmsFormVO;
import kr.or.dduk.vo.MmsHstrVO;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/crm")
public class MmsController {

	@Autowired
	MmsService mmsService;
	
	/**
	 * 문자 메인 화면
	 * @param model 문자 형식, 내역 저장
	 * @return MMS.jsp
	 */
	@GetMapping("/mms")
	public String mySms(Model model) {
		//모든 양식 가져오기
		List<MmsFormVO> mmsFormVOList = mmsService.getAllForm();
		List<MmsHstrVO> mmsHstrVOList = mmsService.getAllHstr();
		
		model.addAttribute("mmsFormVOList", mmsFormVOList);
		model.addAttribute("mmsHstrVOList", mmsHstrVOList);
		
		return "crm/MMS";
	}
	    
	/**
	 * 문자 보내기
	 * @param to 수신자
	 * @return 0 : 실패 / 1 : 성공
	 * @throws CoolsmsException
	 */
	@GetMapping("/sendMMS")
	@ResponseBody
	public String sendMMS(@RequestParam("to") String to) throws CoolsmsException {  	
		return mmsService.sendMMS(to);
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
//		MmsFormVO mmsFormVO = new MmsFormVO();
//		mmsFormVO.setMmsFormCont(formCont);
//		mmsFormVO.setMmsFormCd(formCd);
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
		return mmsService.deleteForm(mmsFormVO);
	}
	
	/**
	 * 문자 내역 추가
	 * @param mmsHstrVO 문자 양식 코드, 발신자, 수신자, 내용
	 * @return 0 : 실패 / 1 : 성공
	 */
	@PostMapping("/addHstr")
	@ResponseBody
	public MmsHstrVO addHstr(@RequestBody MmsHstrVO mmsHstrVO){
		mmsService.addHstr(mmsHstrVO);
		System.out.println(mmsHstrVO);
		return mmsHstrVO;
	}
}
