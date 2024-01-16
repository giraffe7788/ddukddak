package kr.or.dduk.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.NoticeMapper;
import kr.or.dduk.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> list();

	public int insetNotice(NoticeVO noticevo);

	public NoticeVO detail(String noticeNo);

	public int delete(String noticeNo);

	public int update(NoticeVO noticeVO);

	public void noticeViews(String noticeNo);

	public int updateNotice(NoticeVO noticeVO);

//	public int listCount();

}
