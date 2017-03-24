package com.spring.camsns.dto;

public class LoginlogDTO {
	private String LoginSeq;
	private String LoginTime;
	private String LoginStat;
	private String UserEmailIdFk;
	public String getLoginSeq() {
		return LoginSeq;
	}
	public void setLoginSeq(String loginSeq) {
		LoginSeq = loginSeq;
	}
	public String getLoginTime() {
		return LoginTime;
	}
	public void setLoginTime(String loginTime) {
		LoginTime = loginTime;
	}
	public String getLoginStat() {
		return LoginStat;
	}
	public void setLoginStat(String loginStat) {
		LoginStat = loginStat;
	}
	public String getUserEmailIdFk() {
		return UserEmailIdFk;
	}
	public void setUserEmailIdFk(String userEmailIdFk) {
		UserEmailIdFk = userEmailIdFk;
	}

}
