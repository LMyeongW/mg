package com.study.demo.employee.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
