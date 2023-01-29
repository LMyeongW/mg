package com.study.demo.vo;

import java.util.Date;

public class ApplicationVO {
	private int applNo;
	private String employeeId;
	private String applselect;
	private String startDate;
	private String endDate;
	private String regDate;
	private String emergencyTell;
	private String reason;
	private String status;
	
	//회원정보
	private String employeeName; //이름
	private int emploNo; //사원넘버
	private String departmentId; //부서
	private String positionId; //직급
	
	
	public int getApplNo() {
		return applNo;
	}
	public void setApplNo(int applNo) {
		this.applNo = applNo;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getApplselect() {
		return applselect;
	}
	public void setApplselect(String applselect) {
		this.applselect = applselect;
		if(applselect.equals("A1")) {
			this.applselect = "휴가";
		}
		if(applselect.equals("A2")) {
			this.applselect = "연차";
		}
		if(applselect.equals("A3")) {
			this.applselect = "월차";
		}
		if(applselect.equals("A4")) {
			this.applselect = "반차(오전)";
		}
		if(applselect.equals("A4-1")) {
			this.applselect = "반차(오후)";
		}
		if(applselect.equals("A5")) {
			this.applselect = "휴직";
		}
		if(applselect.equals("A6")) {
			this.applselect = "기타";
		}

	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEmergencyTell() {
		return emergencyTell;
	}
	public void setEmergencyTell(String emergencyTell) {
		this.emergencyTell = emergencyTell;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public int getEmploNo() {
		return emploNo;
	}
	public void setEmploNo(int emploNo) {
		this.emploNo = emploNo;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
		if(status.equals("1A")) {
			this.status = "승인";
		}
		if(status.equals("2A")) {
			this.status = "거부";
		}
		if(status.equals("3A")) {
			this.status = "승인대기";
		}
		if(status.equals("4A")) {
			this.status = "취소됨";
		}
	}
	@Override
	public String toString() {
		return "ApplicationVO [applNo=" + applNo + ", employeeId=" + employeeId + ", applselect=" + applselect
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", regDate=" + regDate + ", emergencyTell="
				+ emergencyTell + ", reason=" + reason + ", status=" + status + ", employeeName=" + employeeName
				+ ", emploNo=" + emploNo + ", departmentId=" + departmentId + ", positionId=" + positionId + "]";
	}


	
	
}
