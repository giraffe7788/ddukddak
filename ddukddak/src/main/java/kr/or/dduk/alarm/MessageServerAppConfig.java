package kr.or.dduk.alarm;

import java.util.Map;

import javax.websocket.server.ServerEndpointConfig.Configurator;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

/**
 * @Class Name : MessageServerAppConfig.java
 * @Description : EndPoint를 bean으로 담기 위해 설정하는 Configurator(다른 Bean과 연동 시 EndPoint에 설정해주어야 함)
 */
public class MessageServerAppConfig extends Configurator {

	/**
	 * EndPoint의 bean객체를 리턴
	 */
	@Override
	public <T> T getEndpointInstance(Class<T> endpointClass) throws InstantiationException {

		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		
		if (wac == null) {
			throw new IllegalStateException("WebApplicationContext를 찾을 수 없습니다.");
		}

		Map<String, T> beans = wac.getBeansOfType(endpointClass);

		if (beans.isEmpty()) {
			// bean객체가 없으면 새로 만들어줌
			return wac.getAutowireCapableBeanFactory().createBean(endpointClass);
		}

		if (beans.size() == 1) {
			// 엔드포인트의 만약 빈 객체가 딱 1개면 리턴
			return beans.values().iterator().next();
		} else {
			// 빈 객체가 2개이상이면 예외 발생시킴
			throw new IllegalStateException("한개 이상의 빈 객체가 생성되었습니다 " + endpointClass);
		}
	}
}
