package kr.or.dduk.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.ExampleMapper;
import kr.or.dduk.vo.ExampleVO;

@Service
public class ExampleServiceImpl implements ExampleService{

	@Autowired
	ExampleMapper exampleMapper;
	
	@Override
	public int insert(ExampleVO exampleVO) {
		return this.exampleMapper.insert(exampleVO);
	}
}
