package com.study.demo.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.demo.employee.dao.AttachDAO;
import com.study.demo.vo.AttachImageVO;
import com.study.demo.vo.employeeVO;

@Service
public class AttachServiceImpl implements AttachService{
	
	@Autowired
	private AttachDAO attachDao;

	//이미지반환(출력)
	@Override
	public List<AttachImageVO> AttachImage(int emploNo) {
		return  attachDao.AttachImage(emploNo);
	}
	
	//이미지 데이터삭제
	@Override
	public void imgDatedelete(AttachImageVO attachImagevo) {
		attachDao.imgDatedelete(attachImagevo);

	}
}
