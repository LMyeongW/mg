package com.study.demo.employee.service;

import java.util.List;

import com.study.demo.vo.AttachImageVO;
import com.study.demo.vo.employeeVO;


public interface AttachService {
	
	//이미지 반환(출력)
	List<AttachImageVO> AttachImage(int emploNo);
	
	//이미지데이터 삭제
	void imgDatedelete(AttachImageVO attachImagevo);

}
