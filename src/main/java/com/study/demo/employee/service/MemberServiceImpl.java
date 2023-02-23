package com.study.demo.employee.service;

import java.io.File;
import java.util.HashMap;
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
	
	//이미지데이터저장
	@Override
	public void profileImgData(employeeVO employeevo) {
		memberDao.profileImgData(employeevo);
	}
	
	//이미지데이터반환
	@Override
	public List<MyprofileVO> profileImage(String employeeId) {
		return memberDao.profileImage(employeeId);
	}
	
	//이미지삭제
	@Override
	public void imgDatadelete(employeeVO employeevo) {
		memberDao.imgDatadelete(employeevo);		
	}
	
	//아이디찾기
	@Override
	public employeeVO searchId(employeeVO employeevo) {
		return memberDao.searchId(employeevo);
	}
	
	//비번찾기
	@Override
	public employeeVO searchPw(employeeVO employeevo) {
		return memberDao.searchPw(employeevo);
	}
	
	//비번변경
	@Override
	public void searchPwUpdate(employeeVO employeevo) {
		 memberDao.searchPwUpdate(employeevo);
	}
	
	//마이비번확인
	@Override
	public employeeVO mypwck(employeeVO employeevo) {
		return memberDao.mypwck(employeevo);
	}
	
	//마이비번변경
	@Override
	public void mypwch(employeeVO employeevo) {
		 memberDao.mypwch(employeevo);
	}









	
}
