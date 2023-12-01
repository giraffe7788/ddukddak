package kr.or.dduk.mms.service;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

public interface MmsService {

	//문자 보내기
	public String sendMMS(String to) throws CoolsmsException;

	//형식 만들기
	public String addForm(String form);

}
