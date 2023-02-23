package com.study.demo.employee.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.demo.vo.MyprofileVO;
import com.study.demo.vo.employeeVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sql;
	
	private static String namespace="account";
	
	//회원가입
	@Override
	public void employeeJoin(employeeVO employeevo) {
		sql.insert(namespace+".employeeJoin", employeevo);
	}
	
	//아이디중복체크
	@Override
	public int idCheck(String employeeId) {
		return sql.selectOne(namespace+".idCheck", employeeId);
	}
	
	//로그인
	@Override
	public employeeVO employeeLogin(employeeVO employeevo) {
		return sql.selectOne(namespace+".employeeLogin", employeevo);
	}
	
	//이미지 데이터저장
	@Override
	public void profileImgData(employeeVO employeevo) {
		sql.update(namespace+".profileImgData", employeevo);
	}
	
	//이미지 반환
	@Override
	public List<MyprofileVO> profileImage(String employeeId) {
		return sql.selectList(namespace+".profileImage", employeeId);
	}
	
	//이미지삭제
	@Override
	public void imgDatadelete(employeeVO employeevo) {
		sql.update(namespace+".imgDatadelete", employeevo);
	}
	
	//아이디찾기
	@Override
	public employeeVO searchId(employeeVO employeevo) {
		return sql.selectOne(namespace+".searchId", employeevo);
	}
	
	//비번찾기
	@Override
	public employeeVO searchPw(employeeVO employeevo) {
		return sql.selectOne(namespace+".searchPw", employeevo);
	}
	
	//비번변경
	@Override
	public void searchPwUpdate(employeeVO employeevo) {
		sql.update(namespace+".searchPwUpdate", employeevo);
	}
	
	//마이비번확인
	@Override
	public employeeVO mypwck(employeeVO employeevo) {
		return sql.selectOne(namespace+".mypwck", employeevo);
	}
	
	//마이비번변경
	@Override
	public void mypwch(employeeVO employeevo) {
		sql.update(namespace+".mypwch", employeevo);
	}






}
