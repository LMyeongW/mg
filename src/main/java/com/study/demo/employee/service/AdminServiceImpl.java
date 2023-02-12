package com.study.demo.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.demo.employee.dao.AdminDAO;
import com.study.demo.vo.employeeVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO employeeDao;
	
	
	//회원가입 승인
	@Override
	public List<employeeVO> listPage(int sqlPostNum, int postNum, String searchKeyword) {
		return employeeDao.listPage(sqlPostNum, postNum, searchKeyword);
	}
	
	//회원가입 상세페이지
	@Override
	public Object joinDetail(String employeeId) {
		return employeeDao.joinDetail(employeeId);
	}

	//회원가입 승인
	@Override
	public void joinAppr(employeeVO employeevo) {
		employeeDao.joinAppr(employeevo);
		
	}
	
	//사원정보 조회
	@Override
	public employeeVO employeeSelect(int emploNo) {
		return employeeDao.employeeSelect(emploNo);
	}
	
	//사원정보 수정
	@Override
	public void employeeUpdatePOST(employeeVO employeevo) {
		employeeDao.employeeUpdatePOST(employeevo);
		
	}
	
	//사원정보 수정
	@Override
	public void employeeDetailPOST(employeeVO employeevo) {
		employeeDao.employeeUpdate(employeevo);
		
		/*if(employeevo.getImageList() == null || employeevo.getImageList().size() <= 0) {
			return;
		}
		
		employeevo.getImageList().forEach(attach ->{
			
			attach.setEmploNo(employeevo.getEmploNo());
			employeeDao.employeeImageUpdate(attach);
		});*/
		
	}
	
	//사원관리 전체페이징 갯수
	@Override
	public int emploTotalCount(String searchKeyword, String statusIdSelect) {
		return employeeDao.emploTotalCount(searchKeyword, statusIdSelect);
	}
	
	//회원가입 승인 전체페이징 갯수
	@Override
	public int jointotalCount(String searchKeyword) {
		return employeeDao.jointotalCount(searchKeyword);
	}
	
	//회원가입 승인 삭제
	@Override
	public void joindelete(String employeeId) {
		 employeeDao.joindelete(employeeId);
		
	}
	
	//회원가입 팝업 거절목록
	@Override
	public List<employeeVO> refusalList(int sqlPostNum, int postNum) {
		return employeeDao.refusalList(sqlPostNum, postNum);
	}
	
	//회원가입 팝업 거절 페이징갯수
	@Override
	public int refusaltotalCount() {
		
		return employeeDao.refusaltotalCount();
	}
	
	//회원가입거부
	@Override
	public void refusalUpdate(employeeVO employeevo) {
		employeeDao.refusalUpdate(employeevo);
		
	}
	
	//회원가입거부 취소
	@Override
	public void cencelRefusal(employeeVO employeevo) {
		employeeDao.cencelRefusal(employeevo);
		
	}
	
	//체크박스삭제
	@Override
	public void selectDelete(List<String> employeeIdArray) {
		for(int i=0; i<employeeIdArray.size(); i++) {
			employeeDao.selectDelete(employeeIdArray.get(i));
		}
	}
	

	@Override
	public void refusalSelectCancel(List<String> employeeIdArray) {
		for(int i=0; i<employeeIdArray.size(); i++) {
			employeeDao.refusalSelectCancel(employeeIdArray.get(i));
		}
		
	}

	@Override
	public List<employeeVO> emploListSort(String orderType, int sqlPostNum, int postNum, String searchKeyword, String statusIdSelect) {
		return employeeDao.emploListSort(orderType, sqlPostNum, postNum, searchKeyword, statusIdSelect);
	}

	//퇴사자 list
	@Override
	public List<employeeVO> resignationList(int sqlPostNum, int postNum, String orderType, String searchKeyword) {
		return employeeDao.resignationList(sqlPostNum, postNum, orderType, searchKeyword);
	}
	
	//퇴사자 총 갯수
	@Override
	public int resignationTotalCount(String searchKeyword) {
		return employeeDao.resignationTotalCount(searchKeyword);
	}
	
	//퇴사자정보 조회
	@Override
	public Object resignationDetail(int emploNo) {
		return employeeDao.resignationDetail(emploNo);
	}
	
	//퇴사자정보 수정
	@Override
	public void resignationDetailUpdate(employeeVO employeevo) {
		employeeDao.resignationDetailUpdate(employeevo);
	}
	
	//퇴사자삭제
	@Override
	public void resignationDelete(employeeVO employeevo) {
		employeeDao.resignationDelete(employeevo);
	}
	
	//퇴사자 선택삭제
	@Override
	public void resignationSelectDelete(List<String> employNoArray) {
		for(int i=0; i<employNoArray.size(); i++) {
			employeeDao.resignationSelectDelete(employNoArray.get(i));
		}
	}

	@Override
	public List<employeeVO> statusSelect(String statusType) {
		return employeeDao.statusSelect(statusType);
	}

	@Override
	public void applicationSelectDelete(List<String> applNoArray) {
		for(int i=0; i<applNoArray.size(); i++) {
			employeeDao.applicationSelectDelete(applNoArray.get(i));
		}
		
	}



	
	

	
	//오름차순
	/*@Override
	public void employeeSort(String asc) {
		employeeDao.employeeSort(asc);
		
	}*/








	


}
