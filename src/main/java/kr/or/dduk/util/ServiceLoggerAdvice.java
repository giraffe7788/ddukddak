package kr.or.dduk.util;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

/**
 * 스프링 AOP를 이용해 메소드 실행에 관한 로그를 찍는 클래스
 * @author 영남
 */
@Slf4j
@Component
@Aspect
public class ServiceLoggerAdvice {

	// 메소드 실행전에
	@Before("execution(* kr.or.dduk..*.*(..))")
	public void startLog(JoinPoint jp) {
		log.info("실행된 메소드 정보 : " + jp.getSignature());
		log.info("받은 파라미터 정보 : " + Arrays.toString(jp.getArgs()));
	}
	
	// 메소드 실행후에(예외가 발생하면 실행x)
	@AfterReturning(value="execution(* kr.or.dduk..*.*(..))", returning="rtnObj")
	public void logReturning(JoinPoint jp, Object rtnObj) {
		log.info("리턴된 오브젝트 정보 : " + rtnObj);
	}
	
	// 메소드 실행후에(예외가 발생해도 실행)
	@After("execution(* kr.or.dduk..*.*(..))")
	public void endLog(JoinPoint jp) {
		log.info("종료된 메소드 정보 : " + jp.getSignature());
	}
}