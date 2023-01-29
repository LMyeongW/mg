package com.study.demo.vo;

public class MyprofileVO {
 
	private String profileLoadPath;
	private String profileUuid;
	private String profileName;
	private int employeeId;
	
	
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
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	@Override
	public String toString() {
		return "MyprofileVO [profileLoadPath=" + profileLoadPath + ", profileUuid=" + profileUuid + ", profileName="
				+ profileName + ", employeeId=" + employeeId + "]";
	}
	
	
}
