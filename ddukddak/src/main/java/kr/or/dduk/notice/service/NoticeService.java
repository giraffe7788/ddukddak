package kr.or.dduk.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.NoticeMapper;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	public List<Notice> list() {
		return noticeMapper.
	}
}
