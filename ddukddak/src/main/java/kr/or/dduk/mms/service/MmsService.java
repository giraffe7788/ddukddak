package kr.or.dduk.mms.service;

import kr.or.dduk.vo.MmsFormVO;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public interface MmsService {

	//문자 보내기
	public String sendMMS(String to) throws CoolsmsException;

	//형식 추가
	public int addForm(MmsFormVO mmsFormVO);

}
