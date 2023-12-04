package kr.or.dduk.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.NoticeMapper;
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

}
