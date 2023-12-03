package kr.or.dduk.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.dduk.notice.service.NoticeService;

@RequestMapping("/notice")
@Controller
public class NoticeControllerr {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		
		  List list = noticeService.list();
		  model.addAttribute("list", list);
		  
		  return "notice/notice";
	}
	
	

}

