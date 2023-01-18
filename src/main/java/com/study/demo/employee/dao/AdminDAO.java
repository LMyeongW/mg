package com.study.demo.employee.dao;

import java.util.List;

import com.study.demo.vo.AttachImageVO;
import com.study.demo.vo.employeeVO;

public interface AdminDAO {
	
	//회원가입 리스트
	List<employeeVO> listPage(int sqlPostNum, int postNum);

	//사원관리
	List<employeeVO> emploList(int sqlPostNum, int postNum);

	//회원상세페이지
	Object joinDetail(String employeeId);
	
	//회원가입 승인
	void joinAppr(employeeVO employeevo);
	
	//사원정보 조회
	employeeVO employeeSelect(int emploNo);
	
	//사원정보 수정
	void employeeUpdatePOST(employeeVO employeevo);
	
	//사원정보 수정
	void employeeUpdate(employeeVO employeevo);

	//이미지 등록
	void employeeImageUpdate(AttachImageVO vo);
	
	//사원관리 전체페이지갯수
	int emploTotalCount(String searchKeyword);
	
	//회원가입 승인 전체 페이지갯수
	int jointotalCount();
	
	//회원가입 삭제
	void joindelete(String employeeId);
	
	//회원가입 승인 팝업 거절
	List<employeeVO> refusalList(int sqlPostNum, int postNum);
	
	//회원가입 팝업 거절 페이징갯수
	int refusaltotalCount();
	
	//회원가입 거절
	void refusalUpdate(employeeVO employeevo);
	
	//회원가입 거절 취소
	void cencelRefusal(employeeVO employeevo);
	
	//체크박스삭제
	void selectDelete(String employeeIdArray);
	
	//list 정렬
	List<employeeVO> emploListSort(String orderType, int sqlPostNum, int postNum, String searchKeyword);
	
	//퇴사자 list
	List<employeeVO> resignationList(int sqlPostNum, int postNum, String orderType, String searchKeyword);
	
	//퇴사자 총갯수
	int resignationTotalCount(String searchKeyword);
	
	//퇴사자정보 조회
	Object resignationDetail(int emploNo);
	
	//퇴사자정보 수정
	void resignationDetailUpdate(employeeVO employeevo);
	
	//퇴사자삭제
	void resignationDelete(employeeVO employeevo);
	
	//퇴사자 선택삭제
	void resignationSelectDelete(String string);

	List<employeeVO> statusSelect(String statusType);

	

	//오름차순
	//void employeeSort(String asc);

	

	



	

}
