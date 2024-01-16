package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> list();
	
	public int insetNotice(NoticeVO noticeVO);

	public NoticeVO detail(String noticeNo);

	public int delete(String noticeNo);

	public int update(NoticeVO noticeVO);

	public void noticeViews(String noticeNo);

	public int updateNotice(NoticeVO noticeVO);

//	public int listCount();
}