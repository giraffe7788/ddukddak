package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.MmsFormVO;
import kr.or.dduk.vo.MmsHstrVO;

public interface MmsMapper {

	//모든 형식 가져오기
	public List<MmsFormVO> getAllForm();
	
	//양식 추가
	public int addForm(MmsFormVO form);

	//양식 수정
	public int updateForm(MmsFormVO mmsFormVO);

	//양식 삭제
	public int deleteForm(MmsFormVO mmsFormVO);

	//내역 추가
	public int addHstr(MmsHstrVO mmsHstrVO);

	//모든 문자 내역 가져오기
	public List<MmsHstrVO> getAllHstr();

}
