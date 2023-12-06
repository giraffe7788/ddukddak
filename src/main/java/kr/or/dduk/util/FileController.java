package kr.or.dduk.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	AtchFileMapper atchFileMapper;
	
	/**
	 * 파일 타입이 이미지인지 체크하는 메서드
	 * @param file
	 * @return 이미지 여부
	 */
	public boolean checkImageType(File file) {
		//MIME 타입 알아냄
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			// .jpg의 MIME타입 : image/jpeg
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
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
	public Map<String, Object> uploadFile(MultipartFile[] uploadFile, String folderName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 첨부파일 성공건수
		int result = 0;
		// 리턴시켜줄 fileCd(파일코드 시퀀스)
		String atchFileCd = "";
		
		// 파일 설정
		File uploadPath = new File(uploadFolder, folderName);
		
		// 만약 존재하지 않는 파일 이름이면 새로 만듬
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		// DB에 AtchFile 넣기
		AtchFileVO atchFileVO = new AtchFileVO();
		result += this.atchFileMapper.insertFile(atchFileVO);
		log.info("atchFileVO : " + atchFileVO);
		// ATCH_FILE_CD 얻기
		atchFileCd = atchFileVO.getAtchFileCd();
		log.info("atchFileCd머임 : " + atchFileCd);
		
		// 파일 업로드(로컬 + DB)
		for(MultipartFile multipartFile : uploadFile) {
			String uploadFileNm = multipartFile.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			uploadFileNm = uuid.toString() + "_" + uploadFileNm;
			
			File saveFile = new File(uploadPath, uploadFileNm);
			
			try {
				multipartFile.transferTo(saveFile);
				
				AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
				atchFileDetailVO.setAtchFileCd(atchFileCd);
				atchFileDetailVO.setAtchFileDetailPath(uploadPath + "/" + uploadFileNm);
				atchFileDetailVO.setAtchFileDetailSavenm(folderName.replace("\\\\", "/") + "/" + uploadFileNm);
				atchFileDetailVO.setAtchFileDetailOrlng(multipartFile.getOriginalFilename());
				atchFileDetailVO.setAtchFileDetailExt(uploadFileNm.substring(uploadFileNm.lastIndexOf(".") + 1));
				
				log.info("atchFileDetailVO : " + atchFileDetailVO);
				
				result += this.atchFileMapper.insertFileDetail(atchFileDetailVO);
				
				
			} catch (IllegalStateException | IOException e) {
	            log.error(e.getMessage());
	         }
	      }

		map.put("result", result);
		map.put("atchFileCd", atchFileCd);
		return map;
	}
}
