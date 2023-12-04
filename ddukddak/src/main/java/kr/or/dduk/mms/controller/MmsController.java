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
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/mms")
public class MmsController {

	@Autowired
	MmsService mmsService;
	
	// coolSMS 테스트 화면
	@GetMapping("/mms")
	public String mySms(Model model) {
		//모든 양식 가져오기
		List<MmsFormVO> mmsFormVOList = mmsService.getAllForm();
		model.addAttribute("mmsFormVOList", mmsFormVOList);
		return "mms/MMS";
	}
	    
	// coolSMS 구현 로직 연결  
	@GetMapping("/sendMMS")
	@ResponseBody
	public String sendMMS(@RequestParam("to") String to) throws CoolsmsException {  	
		return mmsService.sendMMS(to);
	}
	
	//양식 생성
	@PostMapping("/addForm")
	@ResponseBody
	public MmsFormVO addForm(@RequestBody MmsFormVO mmsFormVO){
		mmsService.addForm(mmsFormVO);
		return mmsFormVO;
	}
	
	//양식 수정
	@PostMapping("/updateForm")
	@ResponseBody
	public int updateForm(@RequestBody MmsFormVO mmsFormVO){
//		MmsFormVO mmsFormVO = new MmsFormVO();
//		mmsFormVO.setMmsFormCont(formCont);
//		mmsFormVO.setMmsFormCd(formCd);
		return mmsService.updateForm(mmsFormVO);
	}
	
	//양식 삭제
	@PostMapping("/deleteForm")
	@ResponseBody
	public int deleteForm(@RequestBody MmsFormVO mmsFormVO){
		return mmsService.deleteForm(mmsFormVO);
	}
}
