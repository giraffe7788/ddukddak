package kr.or.dduk.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.NoticeMapper;
import kr.or.dduk.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> list();

	public int insetNotice(NoticeVO noticevo);

}
