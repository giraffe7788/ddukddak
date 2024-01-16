package kr.or.dduk.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.dduk.mapper.AtchFileMapper;
import kr.or.dduk.vo.AtchFileDetailVO;
import kr.or.dduk.vo.AtchFileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FileController {
	
	@Autowired
	String uploadFolder;
	
	@Autowired
	AtchFileMapper atchFilelMapper;
	
	/**
	 * 파일 타입이 이미지인지 체크하는 메서드
	 * @param file
	 * @return 이미지 여부
	 */
	public boolean checkImageType(File file) {
		//MIME 타입 알아냄
		String contentType = "";
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			// .jpg의 MIME타입 : image/jpeg
			return contentType.startsWith("image");
		} catch (IOException e) {
			log.error(e.getMessage());
		}
		// 파일이 이미지가 아닐 경우
		return false;
	}
	
	
	/**
	 * 파일 업로드를 해주는 메소드 (로컬에 저장 + DB에 저장)
	 * @param uploadFile 업로드할 파일들
	 * @param folderName 저장시키고 싶은 폴더 이름
	 * @Param voObject 파일코드를 설정해줄 vo
	 * @return map(result = db에 insert 성공한 횟수, atchFileCd = db에들어간 파일코드 시퀀스)
	 */
	public Map<String, Object> uploadFile(MultipartFile[] uploadFiles, String folderName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 첨부파일 성공건수
		int result = 0;
		// 리턴시켜줄 fileCd(파일코드 시퀀스)
		String atchFileCd = "";
		// 
		String uploadFileNm = "";

		log.info("uploadFile->uploadFiles : " + uploadFiles);
		log.info("uploadFile->folderName : " + folderName);
		log.info("uploadFiles[0].getOriginalFilename().length() : " + uploadFiles[0].getOriginalFilename().length());
		
		// 파일 경로 설정
		//String uploadFolder = "src/main/resources/upload";
		File uploadPath = new File(uploadFolder, folderName);
		// 만약 존재하지 않는 파일 이름이면 새로 만듬
		if (!uploadPath.exists()) uploadPath.mkdirs();
		
		// DB에 AtchFile 넣기
		AtchFileVO atchFileVO = new AtchFileVO();
		result += this.atchFilelMapper.insertFile(atchFileVO);
		log.info("atchFileVO : " + atchFileVO);
		// ATCH_FILE_CD 얻기
		atchFileCd = atchFileVO.getAtchFileCd();
		log.info("atchFileCd머임 : " + atchFileCd);
		
		// 파일 업로드(로컬 + DB)
		for(MultipartFile multipartFile : uploadFiles) {
			
			// 파일의 원본이름을 가져온다음 무작위 문자열을 앞에 넢어주고 구분자로 _를 붙여줌
			String orgNm = multipartFile.getOriginalFilename();
			uploadFileNm = UUID.randomUUID().toString() + "_" + orgNm;
			
			// 파일경로+파일이름
			File saveFile = new File(uploadPath, uploadFileNm);
			
			try {
				// 로컬에 파일 저장
				multipartFile.transferTo(saveFile);
				
				AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
				atchFileDetailVO.setAtchFileCd(atchFileCd);
				atchFileDetailVO.setAtchFileDetailSeq(0);
				atchFileDetailVO.setAtchFileDetailSavenm(uploadFileNm);
				atchFileDetailVO.setAtchFileDetailPath(uploadFolder);
				atchFileDetailVO.setAtchFileDetailOrlng(multipartFile.getOriginalFilename()); // multipartFile.getOriginalFilename()
				atchFileDetailVO.setAtchFileDetailExt(uploadFileNm.substring(uploadFileNm.lastIndexOf(".") + 1));
				log.info("atchFileDetailVO : " + atchFileDetailVO);
				
				// 파일디테일 테이블에 insert
				result += this.atchFilelMapper.insertFileDetail(atchFileDetailVO);
				log.info("atchFileDetailVO : " + atchFileDetailVO);
				
				
			} catch (IllegalStateException | IOException e) {
	            log.error(e.getMessage());
	         }
	      }

		map.put("result", result);
		map.put("atchFileCd", atchFileCd);
		return map;
	}
	
	
	 public Map<String, Object> uploadPDF(MultipartFile[] uploadFiles, String folderName) {
	        Map<String, Object> map = new HashMap<>();
	        int result = 0;
	        String atchFileCd = "";
	        String uploadFileNm = "";

	        File uploadPath = new File(uploadFolder, folderName);
	        if (!uploadPath.exists()) uploadPath.mkdirs();

	        AtchFileVO atchFileVO = new AtchFileVO();
	        result += this.atchFilelMapper.insertFile(atchFileVO);
	        atchFileCd = atchFileVO.getAtchFileCd();

	        for (MultipartFile multipartFile : uploadFiles) {
	            String orgNm = multipartFile.getOriginalFilename();
	            uploadFileNm = UUID.randomUUID().toString() + "_" + orgNm;

	            File saveFile = new File(uploadPath, uploadFileNm);

	            try {
	                // MultipartFile을 byte 배열로 변환
	                byte[] fileBytes = multipartFile.getBytes();
	                // byte 배열을 ByteArrayInputStream으로 변환
	                ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileBytes);

	                // 로컬에 파일 저장
	                Files.write(saveFile.toPath(), fileBytes);

	                AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
	                atchFileDetailVO.setAtchFileCd(atchFileCd);
	                atchFileDetailVO.setAtchFileDetailSeq(0);
	                atchFileDetailVO.setAtchFileDetailSavenm(uploadFileNm);
	                atchFileDetailVO.setAtchFileDetailPath(uploadFolder);
	                atchFileDetailVO.setAtchFileDetailOrlng(multipartFile.getOriginalFilename());
	                atchFileDetailVO.setAtchFileDetailExt(uploadFileNm.substring(uploadFileNm.lastIndexOf(".") + 1));

	                result += this.atchFilelMapper.insertFileDetail(atchFileDetailVO);

	            } catch (IOException e) {
	                log.error("Error occurred: {}", e.getMessage());
	            }
	        }

	        map.put("result", result);
	        map.put("atchFileCd", atchFileCd);
	        return map;
	    }
		//파일 다운로드
	   //요청URI : /download?fileName=/2023/11/21/asdflksdfj_개똥이.jpg
	   //요청파라미터 : /2023/11/21/asdflksdfj_개똥이.jpg
	   //요청방식 : get
	   @RequestMapping(value="/download",produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	   public ResponseEntity<Resource> downloadFile(String fileName){
	      log.info("downloadFile->fileName : " + fileName);
	      //core.io
	      //파일의 경로(.../upload) + 파일명
	      Resource resource = new FileSystemResource(this.uploadFolder + fileName);
	      log.info("downloadFile->path : " + (this.uploadFolder + fileName));
	      
	      String resourceName = resource.getFilename();
	      log.info("resourceName : " + resourceName);
	      
	      //sprintframework.http
	      //헤더를 통해서 파일을 보냄
	      HttpHeaders headers = new HttpHeaders();
	      
	      try {
	         //파일명이 한글일 때 한글처리
	         headers.add("Content-Disposition",
	               "attachment;filename="+new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
	      } catch (UnsupportedEncodingException e) {
	         log.error(e.getMessage());
	      }
	      //resource : 파일 / header : 파일명 등 정보 / HttpStatus.OK : 상태200(성공)
	      return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	   }
	}
	


