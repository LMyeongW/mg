package com.study.demo.employee.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.demo.employee.dao.MemberDAO;
import com.study.demo.vo.MyprofileVO;
import com.study.demo.vo.employeeVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;
	
	//회원가입
	@Override
	public void employeeJoin(employeeVO employeevo) {
		memberDao.employeeJoin(employeevo);
	}
	
	//아이디 중복체크
	@Override
	public int idCheck(String employeeId) {
		return memberDao.idCheck(employeeId);
	}
	
	//로그인실행
	@Override
	public employeeVO employeeLogin(employeeVO employeevo) {
		return memberDao.employeeLogin(employeevo);
	}

	@Override
	public void profileImgData(employeeVO employeevo) {
		memberDao.profileImgData(employeevo);
		
	}

	@Override
	public List<MyprofileVO> profileImage(String employeeId) {
		return memberDao.profileImage(employeeId);
	}

	@Override
	public void imgDatadelete(employeeVO employeevo) {
		memberDao.imgDatadelete(employeevo);
		
	}


	
}
