package kr.or.dduk.mms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MMSController {
	
	@Autowired
	MMSService mmsService;
	
	// coolSMS 테스트 화면
	@GetMapping("/sms")
	public String mySms() {
		return "SMS";
	}
	    
	// coolSMS 구현 로직 연결  
	@GetMapping("/check/sendSMS")
	@ResponseBody
	public String sendSMS(@RequestParam("to") String to) throws CoolsmsException {  	
		return mmsService.PhoneNumberCheck(to);
	}
}
