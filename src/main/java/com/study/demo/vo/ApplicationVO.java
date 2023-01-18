package com.study.demo.vo;

public class ApplicationVO {
	private int applNo;
	private String employeeId;
	private String applselect;
	private String startDate;
	private String endDate;
	private String emergencyTell;
	private String reason;
	
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
	
	@Override
	public String toString() {
		return "ApplicationVO [applNo=" + applNo + ", employeeId=" + employeeId + ", applselect=" + applselect
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", emergencyTell=" + emergencyTell + ", reason="
				+ reason + ", employeeName=" + employeeName + ", emploNo=" + emploNo + ", departmentId=" + departmentId
				+ ", positionId=" + positionId + "]";
	}
	
	
}
