package com.study.demo.vo;

import java.io.UnsupportedEncodingException;
import java.util.Date;

public class employeeVO extends Page{

	private String employeeId; //아이디	
	private String employeePw; //비밀번호
	private String employeeName; //이름
	private String employeeMail; //이메일
	private String employeeBirthday1; //생일 yyyy
	private String employeeBirthday2; //mm
	private String employeeBirthday3; //dd
	private String employeeGender; //성별
	private String employeePhone; //휴대번호
	private String employeeAddr1; //주소1
	private String employeeAddr2; //주소2
	private String employeeAddr3; //상세주소
	private int salary; //봉급
	private int bonusPercent; //상여금퍼센트
	private int bonus; //상여금퍼센트
	private int totalSalary;
	private int emploNo; //사원넘버
	private String departmentId; //부서
	private String positionId; //직급
	private int adminCk; //관리자권한
	private int login_appr;
	private Date regdate; //등록일
	private Date refusalregdate; //승인거절일
	private String comregdate; //입사일
	private String statusId; //고용형태
	private String uploadPath; //경로
	private String uuid; //uuid
	private String fileName; //파일 이름
	private String resignationdate;
	private String reason;
	private String salary2;
	private String profileLoadPath;
	private String profileUuid;
	private String profileName;
	
	private String searchKeyword;

	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	//private List<AttachImageVO> imageList;
	private String qustr;
	
    public String getQustr() {
		return qustr;
	} 
	public void setQustr() throws UnsupportedEncodingException {
	  	String qs = "";
	  	this.setQueryString();
	  	qs += this.getQueryString();
	  	this.qustr = qs;
	}
	
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeePw() {
		return employeePw;
	}
	public void setEmployeePw(String employeePw) {
		this.employeePw = employeePw;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeeMail() {
		return employeeMail;
	}
	public void setEmployeeMail(String employeeMail) {
		this.employeeMail = employeeMail;
	}
	public String getEmployeeBirthday1() {
		return employeeBirthday1;
	}
	public void setEmployeeBirthday1(String employeeBirthday1) {
		this.employeeBirthday1 = employeeBirthday1;
	}
	public String getEmployeeBirthday2() {
		return employeeBirthday2;
	}
	public void setEmployeeBirthday2(String employeeBirthday2) {
		this.employeeBirthday2 = employeeBirthday2;
	}
	public String getEmployeeBirthday3() {
		return employeeBirthday3;
	}
	public void setEmployeeBirthday3(String employeeBirthday3) {
		this.employeeBirthday3 = employeeBirthday3;
	}
	public String getEmployeeGender() {
		return employeeGender;
	}
	public void setEmployeeGender(String employeeGender) {
		this.employeeGender = employeeGender;
		if(employeeGender.equals("F")) {
			this.employeeGender = "여자";
		} else if(employeeGender.equals("M")) {
			this.employeeGender = "남자";
		}
	}
	public String getEmployeePhone() {
		return employeePhone;
	}
	public void setEmployeePhone(String employeePhone) {
		this.employeePhone = employeePhone;
	}
	public String getEmployeeAddr1() {
		return employeeAddr1;
	}
	public void setEmployeeAddr1(String employeeAddr1) {
		this.employeeAddr1 = employeeAddr1;
	}
	public String getEmployeeAddr2() {
		return employeeAddr2;
	}
	public void setEmployeeAddr2(String employeeAddr2) {
		this.employeeAddr2 = employeeAddr2;
	}
	public String getEmployeeAddr3() {
		return employeeAddr3;
	}
	public void setEmployeeAddr3(String employeeAddr3) {
		this.employeeAddr3 = employeeAddr3;
	}
	public int getEmploNo() {
		return emploNo;
	}
	public void setEmploNo(int emploNo) {
		this.emploNo = emploNo;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getBonusPercent() {
		return bonusPercent;
	}
	public void setBonusPercent(int bonusPercent) {
		this.bonusPercent = bonusPercent;
	}
	public int getBonus() {
		this.bonus = (int)(Math.ceil((((double)bonusPercent/100) * (double)salary) / 12));
		return bonus;
	}
	public void setBonus(int bonus) {
		this.bonus = bonus;
	}
	public int getTotalSalary() {
		this.totalSalary = (int)(Math.ceil((double)salary + (double)bonus));
		return totalSalary;
	}
	public void setTotalSalary(int totalSalary) {
		this.totalSalary = totalSalary;
	}
	/*this.realSalary = (int)(Math.ceil((3.0 * (double)salary) / 12));*/
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
		if(departmentId.equals("D00")) {
			this.departmentId = "미정";
		} else if(departmentId.equals("A1")) {
			this.departmentId = "회계팀";
		} else if(departmentId.equals("D1")) {
			this.departmentId = "디자인팀";
		} else if(departmentId.equals("D2")) {
			this.departmentId = "개발팀";
		} else if(departmentId.equals("M1")) {
			this.departmentId = "마케팅";
		} else if(departmentId.equals("P1")) {
			this.departmentId = "인사팀";
		} else if(departmentId.equals("P2")) {
			this.departmentId = "홍보팀";
		} else if(departmentId.equals("S1")) {
			this.departmentId = "서비스팀";
		} 
		
	}
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
		if(positionId.equals("00")) {
			this.positionId = "사장";
		} else if(positionId.equals("01")) {
			this.positionId = "이사";
		} else if(positionId.equals("02")) {
			this.positionId = "부장";
		} else if(positionId.equals("03")) {
			this.positionId = "과장";
		} else if(positionId.equals("04")) {
			this.positionId = "대리";
		} else if(positionId.equals("05")) {
			this.positionId = "주임";
		} else if(positionId.equals("06")) {
			this.positionId = "사원";
		} else if(positionId.equals("07")) {
			this.positionId = "인턴";
		} else if(positionId.equals("08")) {
			this.positionId = "차장";
		} else if(positionId.equals("P00")) {
			this.positionId = "미정"; 
		}
	}
	public int getAdminCk() {
		return adminCk;
	}
	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}
	public int getLogin_appr() {
		return login_appr;
	}
	public void setLogin_appr(int login_appr) {
		this.login_appr = login_appr;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public Date getRefusalregdate() {
		return refusalregdate;
	}
	public void setRefusalregdate(Date refusalregdate) {
		this.refusalregdate = refusalregdate;
	}
	public String getComregdate() {
		return comregdate;
	}
	public void setComregdate(String comregdate) {
		this.comregdate = comregdate;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
		if(statusId.equals("00")) {
			this.statusId = "미정";
		} else if(statusId.equals("01")) {
			this.statusId = "정규";
			
		} else if(statusId.equals("02")) {
			this.statusId = "계약";
		} else if(statusId.equals("03")) {
			this.statusId = "퇴사";
		} else if(statusId.equals("04")) {
			this.statusId = "퇴직";
		} else if(statusId.equals("05")) {
			this.statusId = "해고";
		} else if(statusId.equals("06")) {
			this.statusId = "계약완료";
		} 
	}
	
	
	/*public List<AttachImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}*/
	
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getResignationdate() {
		return resignationdate;
	}
	public void setResignationdate(String resignationdate) {
		this.resignationdate = resignationdate;
		if(resignationdate.equals("")) {
			this.resignationdate = null;
		}
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getSalary2() {
		return salary2;
	}
	public void setSalary2(String salary2) {
		this.salary2 = salary2;
	}
	public String getProfileLoadPath() {
		return profileLoadPath;
	}
	public void setProfileLoadPath(String profileLoadPath) {
		this.profileLoadPath = profileLoadPath;
	}
	public String getProfileUuid() {
		return profileUuid;
	}
	public void setProfileUuid(String profileUuid) {
		this.profileUuid = profileUuid;
	}
	public String getProfileName() {
		return profileName;
	}
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}
	@Override
	public String toString() {
		return "employeeVO [employeeId=" + employeeId + ", employeePw=" + employeePw + ", employeeName=" + employeeName
				+ ", employeeMail=" + employeeMail + ", employeeBirthday1=" + employeeBirthday1 + ", employeeBirthday2="
				+ employeeBirthday2 + ", employeeBirthday3=" + employeeBirthday3 + ", employeeGender=" + employeeGender
				+ ", employeePhone=" + employeePhone + ", employeeAddr1=" + employeeAddr1 + ", employeeAddr2="
				+ employeeAddr2 + ", employeeAddr3=" + employeeAddr3 + ", salary=" + salary + ", bonusPercent="
				+ bonusPercent + ", bonus=" + bonus + ", totalSalary=" + totalSalary + ", emploNo=" + emploNo
				+ ", departmentId=" + departmentId + ", positionId=" + positionId + ", adminCk=" + adminCk
				+ ", login_appr=" + login_appr + ", regdate=" + regdate + ", refusalregdate=" + refusalregdate
				+ ", comregdate=" + comregdate + ", statusId=" + statusId + ", uploadPath=" + uploadPath + ", uuid="
				+ uuid + ", fileName=" + fileName + ", resignationdate=" + resignationdate + ", reason=" + reason
				+ ", salary2=" + salary2 + ", profileLoadPath=" + profileLoadPath + ", profileUuid=" + profileUuid
				+ ", profileName=" + profileName + ", searchKeyword=" + searchKeyword + ", qustr=" + qustr + "]";
	}
	

	
}
	


	

	
	


	


	
	

	
	
	
	
	
	
