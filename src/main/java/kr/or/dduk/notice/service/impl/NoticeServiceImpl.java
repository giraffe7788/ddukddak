package kr.or.dduk.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.NoticeMapper;
import kr.or.dduk.notice.service.NoticeService;
import kr.or.dduk.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeMapper noticeMapper;

	@Override
	public List<NoticeVO> list() {
		return this.noticeMapper.list();
	}

	@Override
	public int insetNotice(NoticeVO noticeVO) {
		int result = this.noticeMapper.insetNotice(noticeVO);
		
		
		return result;
		
	}

	@Override
	public NoticeVO detail(String noticeNo) {
		return noticeMapper.detail(noticeNo);
	}

	@Override
	public int delete(String noticeNo) {
		return noticeMapper.delete(noticeNo);
	}

	@Override
	public int update(NoticeVO noticeVO) {
		return noticeMapper.update(noticeVO);
	}

	@Override
	public void noticeViews(String noticeNo) {
		noticeMapper.noticeViews(noticeNo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return noticeMapper.updateNotice(noticeVO);
	}

//	@Override
//	public int listCount() {
//		return noticeMapper.listCount();
//	}

}
