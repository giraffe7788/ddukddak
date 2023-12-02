package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.MmsFormVO;

public interface MmsMapper {

	//양식 추가
	public int addForm(MmsFormVO form);

	//모든 형식 가져오기
	public List<MmsFormVO> getAllForm();

	//양식 수정
	public int updateForm(MmsFormVO mmsFormVO);

	//양식 삭제
	public int deleteForm(MmsFormVO mmsFormVO);

}
