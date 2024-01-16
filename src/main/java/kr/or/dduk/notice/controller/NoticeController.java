package kr.or.dduk.notice.controller;

import java.io.File;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.dduk.notice.service.NoticeService;
import kr.or.dduk.util.FileController;
import kr.or.dduk.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

//게시글 목록
@Slf4j
@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	FileController fileController;

	@Autowired
	NoticeService noticeService;

	@GetMapping("/list")
	public String list(Model model, @RequestParam(defaultValue = "1") int currentPage) throws Exception {
		
		List<NoticeVO> list = noticeService.list();
		model.addAttribute("list", list);

		// 전체 행의 갯수
//		int total = this.noticeService.listCount();
//		ArticlePage article = new ArticlePage(total, currentPage, 5, 5, list);
		
//		log.info("total :" + total);
//
//		model.addAttribute("list", list);
//
//		model.addAttribute("data", article);

		return "notice/notice";
	}

	// 글 작성 란
	@GetMapping("/write")
	public String write() {

		return "notice/write";

	}

	// 공지사항 작성 처리
	@PostMapping("/write/insertNotice")
	public String write(NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response, Principal principal) {
		/*
		 * 1. 화면단에서 받은 데이터 가공 2. SERVICE 호출 3. INSERT 됐는지 확인
		 */
		// NoticeVO(noticeNo=null, empNo=test1, noticeTitle=카드 취소했는데 돈은 언제 들어오나요?,
		// noticeCont=<p>이것은 샘플 내용입니다.ㄴㅇㄹㄴ</p>, noticeDt=null, noticeViews=0,
		// atchFileCd=null
		// , RW=null, notification=[원무과, 치료사], file=org.springframewo..
		/*
		NoticeVO(noticeNo=null, empNo=test1, noticeTitle=배송지 변경, noticeCont=<p>개똥이</p><figure class="image"><img style="aspect-ratio:1200/1606;" src="http://localhost/resources/upload/notice/1ec4275f-6f69-4ce1-8840-dc24676c94fb_KakaoTalk_20230919_093540873.jpg" width="1200" height="1606"></figure>, noticeDt=null, noticeViews=0, atchFileCd=null, RM=0, notification=null, uploadFile=[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@50dfc17d])
		 */
		String empNo = principal.getName();
		noticeVO.setEmpNo(empNo);//empNo=test1,
		log.info("insertNotice : " + noticeVO);

		NoticeVO vo = new NoticeVO();
//        vo.put("NOTICE_TITLE",request.getParameter("subject"));
		
		// 파일 로컬+DB 저장, 파일코드 얻어오고 설정
		int result =0;
		MultipartFile[] uploadFile = noticeVO.getUploadFile();
		// 파일이 존재한다면
		if(!uploadFile[0].isEmpty()){ 
			Map<String, Object> map = this.fileController.uploadFile(noticeVO.getUploadFile(), "notice");
			result = (Integer)map.get("result"); // db에 insert 성공한 개수
			String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
			noticeVO.setAtchFileCd(atchFileCd);
		}
		
		result += noticeService.insetNotice(noticeVO);
//		int result = 1;
		
		if (result > 0) {
			log.info("성공");
			return "redirect:/notice/list";
		} else if (result < 0) {
			log.info("실패");
		}

		return "redirect:/notice/write";
	}

	// 게시글 상세보기
	@GetMapping("/detail")
	public String detail(String noticeNo, HttpServletRequest request, HttpServletResponse response, Model model) {

		log.info("noticeVO :" + noticeNo);
		
		noticeService.noticeViews(noticeNo);
		NoticeVO noticeVO = this.noticeService.detail(noticeNo);

		model.addAttribute("noticeVO", noticeVO);
		return "notice/detail";
	}

	// 게시글 삭제
	@GetMapping("/delete")
	public String delete(String noticeNo) {

		this.noticeService.delete(noticeNo);

		return "redirect:/notice/list";
	}

	// 게시글 수정, 기존 게시글 불러오기
	@RequestMapping("/update")
	public String update(Model model, @RequestParam HashMap<String, Object> param) {
		
		String noticeNo = param.get("noticeNo").toString();

		NoticeVO noticeVO = this.noticeService.detail(noticeNo);
		
		model.addAttribute("noticeVO", noticeVO);

		return "notice/update";
	}

	// 게시글 수정 후 페이지
	@PostMapping("/updateNotice")
	public String updatePost(NoticeVO noticeVO) throws Exception {
		log.info("noticeNo >>>>>>>>>>>>>>" + noticeVO);
		int result = noticeService.update(noticeVO);
		
		// 파일 로컬+DB 저장, 파일코드 얻어오고 설정
//				int result =0;
				MultipartFile[] uploadFile = noticeVO.getUploadFile();
				// 파일이 존재한다면
				if(!uploadFile[0].isEmpty()){ 
					Map<String, Object> map = this.fileController.uploadFile(noticeVO.getUploadFile(), "notice");
					//map : {result=2, atchFileCd=F0000000096}
					log.info("map : " + map);
					result = (Integer)map.get("result"); // db에 insert 성공한 개수
					String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
					//atchFileCd : F0000000096
					log.info("atchFileCd : " + atchFileCd);
					noticeVO.setAtchFileCd(atchFileCd);
				}
		//NoticeVO(noticeNo=442, empNo=test1, noticeTitle=ㄹㄹㅁㅁㅁㅁss, noticeCont=<p>ㄹㄹㄹㅁㅁㄴㄴsssss</p>, 
		//noticeDt=null, noticeViews=0, atchFileCd=null, atchFileNm=null, RM=0, notification=null, 
		//uploadFile=[org.springframework.web.multipart.support.StandardMul..], AtchFileDetailVOList=null)
		result += noticeService.updateNotice(noticeVO);
		log.info("result >>>>>>>>>>>>>>" + result);
//    	return "redirect:/notice/list";

		if (result > 0) {
			log.info("성공!!!!!!!!!!!!!!!!!!!!!!!");
			return "redirect:/notice/list";
		} else if (result < 0) {
			log.info("실패");
		}

		return "redirect:/notice/update";
	}

	@ResponseBody
	@PostMapping(value = "/image/upload")
	public Map<String, Object> image(MultipartHttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<>();

		MultipartFile uploadFile = request.getFile("upload");
		log.info("uploadFile : " + uploadFile);

		String originalFileName = uploadFile.getOriginalFilename();
		log.info("originalFileName : " + originalFileName);

		String newFileName = UUID.randomUUID() + "_" + originalFileName;

		// 현재 경로 가져오기
		String url = request.getRequestURL().toString();
		url = url.substring(0, url.indexOf("/", 7));
		log.info("url : " + url);

		// 파일 저장 경로
		String savePath = "C:\\finalProj\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ddukddak\\resources\\upload\\notice\\" + newFileName;
		log.info("savePath : " + savePath);

		// 상대 경로
		String uploadPath = "/resources/upload/notice/" + newFileName;

		// 파일 객체 생성
		File file = new File(savePath);

		// 파일 업로드
		uploadFile.transferTo(file);

		// 응답 데이터 설정
		map.put("uploaded", true);
		map.put("url", url + uploadPath);

		log.info("map : " + map);
		return map;
	}

}
