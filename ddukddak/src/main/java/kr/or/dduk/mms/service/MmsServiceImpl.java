package kr.or.dduk.mms.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.MmsMapper;
import kr.or.dduk.vo.MmsFormVO;
import kr.or.dduk.vo.MmsHstrVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MmsServiceImpl implements MmsService{

	@Autowired
	MmsMapper mmsMapper;
	
	@Override
	public String sendMMS(String to) throws CoolsmsException {
		String api_key = "NCS42FKIBPDIKGW5";
		String api_secret = "M7JSW28ULSFPUA8TVAFI0LBXW2IVTEKO";
		Message coolsms = new Message(api_key, api_secret);

//		Random rand = new Random();
		String numStr = "";
//		for (int i = 0; i < 4; i++) {
//			String ran = Integer.toString(rand.nextInt(10));
//			numStr += ran;
//		}

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", to); // 수신전화번호 (ajax로 view 화면에서 받아온 값으로 넘김)
		params.put("from", "01023208258"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "sms");
		params.put("text", "문자내용");
		
		try {
			coolsms.send(params);  // 메시지 전송
		} catch (CoolsmsException e) {
			e.printStackTrace();
		}

		return numStr;
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

	@Override
	public int addHstr(MmsHstrVO mmsHstrVO) {
		return mmsMapper.addHstr(mmsHstrVO);
	}
}
