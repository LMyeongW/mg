package com.study.demo.employee.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.demo.vo.AttachImageVO;
import com.study.demo.vo.employeeVO;


@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired 
	private SqlSession sql;
	
	private static String namespace="admin";


	//회원가입 리스트
	@Override
	public List<employeeVO> listPage(int sqlPostNum, int postNum, String searchKeyword) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("searchKeyword", searchKeyword);
		List<employeeVO> selectJoinList = sql.selectList(namespace+".listPage", data);
		return selectJoinList;
	}
	
	//회원가입 상세페이지
	@Override
	public Object joinDetail(String employeeId) {
		return sql.selectOne(namespace+".joinDetail", employeeId);
	}
	
	//회원가입 승인
	@Override
	public void joinAppr(employeeVO employeevo) {
		 sql.update(namespace+".joinAppr", employeevo);
	}
	
	
	//사원정보 조회
	@Override
	public employeeVO employeeSelect(int emploNo) {
		return sql.selectOne(namespace+".employeeSelect", emploNo);
	}
	
	//사원정보 수정
	@Override
	public void employeeUpdatePOST(employeeVO employeevo) {
		sql.update(namespace+".employeeUpdatePOST", employeevo);
	}
	
	//사원정보 수정
	@Override
	public void employeeUpdate(employeeVO employeevo) {
		sql.update(namespace+".employeeUpdate", employeevo);
	}
	
	//사진데이터등록
	@Override
	public void employeeImageUpdate(AttachImageVO vo) {
		sql.update(namespace+".employeeImageUpdate", vo);
	}
	
	//페이지전체갯수
	@Override
	public int emploTotalCount(String searchKeyword, String statusIdSelect) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchKeyword", searchKeyword);
		data.put("statusIdSelect", statusIdSelect);
		return sql.selectOne(namespace+".emploTotalCount", data);
	}
	
	//회원가입 전체페이징갯수
	@Override
	public int jointotalCount(String searchKeyword) {
		return sql.selectOne(namespace+".joinTotalCount", searchKeyword);
	}
	
	//회원가입삭제
	@Override
	public void joindelete(String employeeId) {
		sql.delete(namespace+".joindelete", employeeId);
	}
	
	//회원가입 승인 팝업 거절
	@Override
	public List<employeeVO> refusalList(int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		List<employeeVO> refusalList = sql.selectList(namespace+".refusalList", data);
		return refusalList;
	}
	
	//거절목록 총갯수
	@Override
	public int refusaltotalCount() {
		return sql.selectOne(namespace+".refusaltotalCount");
	}
	
	//회원가입 거절
	@Override
	public void refusalUpdate(employeeVO employeevo) {
		sql.update(namespace+".refusalUpdate",employeevo);
	}
	
	//회원가입 거절 취소
	@Override
	public void cencelRefusal(employeeVO employeevo) {
		sql.update(namespace+".cencelRefusal", employeevo);
	}
	
	//체크박스 삭제
	@Override
	public void selectDelete(String employeeIdArray) {
		sql.delete(namespace+".selectDelete", employeeIdArray);
	}
	
	//거절목록 선택 취소
	@Override
	public void refusalSelectCancel(String employeeIdArray) {
		sql.update(namespace+".refusalSelectCancel", employeeIdArray);
	}
	
	//직원관리 리스트
	@Override
	public List<employeeVO> emploListSort(String orderType, int sqlPostNum, int postNum, String searchKeyword, String statusIdSelect) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("orderType", orderType);
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("searchKeyword", searchKeyword);
		data.put("statusIdSelect", statusIdSelect);
		
		return sql.selectList(namespace+".emploListSort", data);
	}
	
	//퇴사자 list
	@Override
	public List<employeeVO> resignationList(int sqlPostNum, int postNum, String orderType, String searchKeyword) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("orderType", orderType);
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("searchKeyword", searchKeyword);
		
		return sql.selectList(namespace+".resignationList", data);
	}
	
	//퇴사자 총갯수
	@Override
	public int resignationTotalCount(String searchKeyword) {
		return sql.selectOne(namespace + ".resignationTotalCount", searchKeyword);
	}
	
	//퇴사자정보 조회
	@Override
	public Object resignationDetail(int emploNo) {
		return sql.selectOne(namespace + ".resignationDetail", emploNo);
	}
	
	//퇴사자정보 수정
	@Override
	public void resignationDetailUpdate(employeeVO employeevo) {
		sql.update(namespace+".resignationDetailUpdate", employeevo);
	}
	
	//퇴사자삭제
	@Override
	public void resignationDelete(employeeVO employeevo) {
		sql.delete(namespace+".resignationDelete", employeevo);
	}
	
	//퇴사자 선택삭제
	@Override
	public void resignationSelectDelete(String employNoArray) {
		sql.delete(namespace+".resignationSelectDelete", employNoArray);
	}
	
	//직원구분 셀렉트박스 검색
	@Override
	public List<employeeVO> statusSelect(String statusType) {
		return sql.selectList(namespace+".statusSelect", statusType);
	}
	
	//신청서 선택 삭제
	@Override
	public void applicationSelectDelete(String applNoArray) {
		sql.delete(namespace+".applicationSelectDelete", applNoArray);
	}


	

	
	//오름차순
	/*@Override
	public void employeeSort(String asc) {
	
		
	}*/






	

	



}
