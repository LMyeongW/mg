package com.study.demo.employee.dao;

import java.util.List;

import com.study.demo.vo.AttachImageVO;

public interface AttachDAO {
	
	//이미지 반환(출력)
	List<AttachImageVO> AttachImage(int emploNo);
	
	//이미지 데이터 삭제
	void imgDatedelete(AttachImageVO attachImagevo);

}
