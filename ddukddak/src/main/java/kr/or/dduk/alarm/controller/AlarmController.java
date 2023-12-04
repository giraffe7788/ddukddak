package kr.or.dduk.alarm.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = { "/msg" })
public class AlarmController {

	/**
	 * 웹 소켓 알림 메시지.. 이동한다.
	 *
	 * @param session 사용자세션
	 * @param model   모델
	 * @return view name
	 */
	@RequestMapping(value = "/main")
	public String websocketMessengerMain(HttpSession session, ModelMap model) {

		return "msg/main";
	}
}
