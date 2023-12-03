package kr.or.dduk.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JacksonInject.Value;

import kr.or.dduk.notice.service.NoticeService;
import kr.or.dduk.vo.NoticeVO;

//게시글 목록
@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	//전체목록 조회
	@GetMapping("/list")
	public String list(Model model) throws Exception {
		
		  List<NoticeVO> list = noticeService.list();
		  model.addAttribute("list", list);
		  
		  return "notice/notice";
	}
	//글 작성 란
	@GetMapping("/write")
	public String write() {
		
		return "notice/write";
		
	}
    // 공지사항 작성 처리
    @PostMapping("/write")
    public String write(NoticeVO notice) {
        noticeService.createNotice(notice);
        
        return "redirect:/notice/list";
    }
	
}

