package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> list();
	
	public int insetNotice(NoticeVO noticeVO);
}
