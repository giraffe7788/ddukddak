package kr.or.dduk.mms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.mms.service.MmsService;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MmsController {
	
	@Autowired
	MmsService mmsService;
	
	// coolSMS 테스트 화면
	@GetMapping("/mms")
	public String mySms() {
		return "MMS";
	}
	    
	// coolSMS 구현 로직 연결  
	@GetMapping("/sendMMS")
	@ResponseBody
	public String sendMMS(@RequestParam("to") String to) throws CoolsmsException {  	
		return mmsService.sendMMS(to);
	}
	
	//양식 생성
	@GetMapping("/addForm")
	@ResponseBody
	public String addForm(@RequestParam("form") String form){  	
		return mmsService.addForm(form);
	}
}
