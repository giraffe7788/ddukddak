package kr.or.dduk.mms.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dduk.mapper.MmsMapper;
import kr.or.dduk.mms.service.MmsService;
import kr.or.dduk.vo.MmsFormVO;
import kr.or.dduk.vo.MmsHstrVO;
import kr.or.dduk.vo.MmsVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MmsServiceImpl implements MmsService{

	@Autowired
	MmsMapper mmsMapper;
	
	@Override
	public int sendMMS(List<MmsVO> list) throws CoolsmsException {
		System.out.println(list);
		
		String api_key = "NCS42FKIBPDIKGW5";
		String api_secret = "M7JSW28ULSFPUA8TVAFI0LBXW2IVTEKO";
		Message coolsms = new Message(api_key, api_secret);

		int result = 0;

		HashMap<String, String> params = new HashMap<String, String>();
		for(int i = 0; i < list.size(); i++) {
			params.put("to", list.get(i).getTo()); // 수신전화번호 (ajax로 view 화면에서 받아온 값으로 넘김)
			params.put("from", "01023208258"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
			params.put("type", "sms");
			params.put("text", list.get(i).getText());
			
			try {
				coolsms.send(params);  // 메시지 전송
			} catch (CoolsmsException e) {
				e.printStackTrace();
			}
		}
		

		return result;
	}

	//모든 양식 가져오기
	@Override
	public List<MmsFormVO> getAllForm() {
		return mmsMapper.getAllForm();
	}
	
	//양식 추가
	@Override
	public int addForm(MmsFormVO mmsFormVO) {
		return mmsMapper.addForm(mmsFormVO);
	}

	//양식 수정
	@Override
	public int updateForm(MmsFormVO mmsFormVO) {
		return mmsMapper.updateForm(mmsFormVO);
	}

	//양식 삭제
	@Override
	public int deleteForm(MmsFormVO mmsFormVO) {
		return mmsMapper.deleteForm(mmsFormVO);
	}

	//내역 추가
	@Transactional
	@Override
	public int addHstr(List<MmsHstrVO> mmsHstrVOList) {
		int result = 0;
		MmsHstrVO mmsHstrVO = new MmsHstrVO();
		for(int i = 0; i < mmsHstrVOList.size(); i++) {
			mmsHstrVO.setMmsFormCd(mmsHstrVOList.get(i).getMmsFormCd());
			mmsHstrVO.setMmsSent(mmsHstrVOList.get(i).getMmsSent());
			mmsHstrVO.setMmsRecv(mmsHstrVOList.get(i).getMmsRecv());
			mmsHstrVO.setMmsCont(mmsHstrVOList.get(i).getMmsCont());
			mmsMapper.addHstr(mmsHstrVO);
			result++;
		}
		return result;
	}

	@Override
	public List<MmsHstrVO> getAllHstr() {
		return mmsMapper.getAllHstr();
	}
}
