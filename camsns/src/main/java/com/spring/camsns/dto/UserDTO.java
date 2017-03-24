package com.spring.camsns.dto;

public class UserDTO {
	String userEmailId;
	String userRegdate;
	String userLevel;
	String universitySeqFk;
	
	public String getUserEmailId() {
		return userEmailId;
	}
	public void setUserEmailId(String userEmailId) {
		this.userEmailId = userEmailId;
	}
	public String getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(String userRegdate) {
		this.userRegdate = userRegdate;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public String getUniversitySeqFk() {
		return universitySeqFk;
	}
	public void setUniversitySeqFk(String universitySeqFk) {
		this.universitySeqFk = universitySeqFk;
	}
	
	
}
