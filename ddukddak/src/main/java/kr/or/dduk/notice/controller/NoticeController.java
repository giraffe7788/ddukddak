package kr.or.dduk.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dduk.employee.controller.EmployeeController;
import kr.or.dduk.notice.service.NoticeService;
import kr.or.dduk.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

//게시글 목록
@Slf4j
@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
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
    @PostMapping("/write/insertNotice")
    public String write(NoticeVO noticeVO,HttpServletRequest request, HttpServletResponse response) {
        /*
         * 1. 화면단에서 받은 데이터 가공
         * 2. SERVICE 호출 
         * 3. INSERT 됐는지 확인 
         */
    	//NoticeVO(noticeNo=null, empNo=test1, noticeTitle=카드 취소했는데 돈은 언제 들어오나요?, 
    	//noticeCont=<p>이것은 샘플 내용입니다.ㄴㅇㄹㄴ</p>, noticeDt=null, noticeViews=0, atchFileCd=null
    	//, RW=null, notification=[원무과, 치료사], file=org.springframewo..
    	log.info("insertNotice : " + noticeVO);
        
        NoticeVO vo = new NoticeVO();
//        vo.put("NOTICE_TITLE",request.getParameter("subject"));
        
        
        int result = noticeService.insetNotice(noticeVO);
//        int result = 1;
        if(result > 0) {
        	log.info("성공");
        	return "redirect:/notice/list";
        }else if(result <0 ){
        	log.info("실패");
        }
        
        return "redirect:/notice/write";
    }
	
}

