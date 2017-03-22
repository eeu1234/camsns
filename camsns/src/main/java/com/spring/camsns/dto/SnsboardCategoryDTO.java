package com.spring.camsns.dto;

public class SnsboardCategoryDTO {
	private String snsboardSeq;
	private String snsboardSubject;
	private String snsboardContent;
	private String snsboardRegdate;
	private String snsboardBlind;
	private String snsboardStat;
	private String userEmailIdFk;
	private String categoryName;
	private String categoryType;
	private String snsboardfileSeq;
	private String snsboardfileFilename;
	private String snsboardSeqFk;
	
	
	
	public String getSnsboardfileFilename() {
		return snsboardfileFilename;
	}
	public void setSnsboardfileFilename(String snsboardfileFilename) {
		this.snsboardfileFilename = snsboardfileFilename;
	}
	public String getSnsboardfileSeq() {
		return snsboardfileSeq;
	}
	public void setSnsboardfileSeq(String snsboardfileSeq) {
		this.snsboardfileSeq = snsboardfileSeq;
	}
	
	public String getSnsboardSeqFk() {
		return snsboardSeqFk;
	}
	public void setSnsboardSeqFk(String snsboardSeqFk) {
		this.snsboardSeqFk = snsboardSeqFk;
	}
	
	public String getSnsboardSeq() {
		return snsboardSeq;
	}
	public void setSnsboardSeq(String snsboardSeq) {
		this.snsboardSeq = snsboardSeq;
	}
	public String getSnsboardSubject() {
		return snsboardSubject;
	}
	public void setSnsboardSubject(String snsboardSubject) {
		this.snsboardSubject = snsboardSubject;
	}
	public String getSnsboardContent() {
		return snsboardContent;
	}
	public void setSnsboardContent(String snsboardContent) {
		this.snsboardContent = snsboardContent;
	}
	public String getSnsboardRegdate() {
		return snsboardRegdate;
	}
	public void setSnsboardRegdate(String snsboardRegdate) {
		this.snsboardRegdate = snsboardRegdate;
	}
	public String getSnsboardBlind() {
		return snsboardBlind;
	}
	public void setSnsboardBlind(String snsboardBlind) {
		this.snsboardBlind = snsboardBlind;
	}
	public String getSnsboardStat() {
		return snsboardStat;
	}
	public void setSnsboardStat(String snsboardStat) {
		this.snsboardStat = snsboardStat;
	}
	public String getUserEmailIdFk() {
		return userEmailIdFk;
	}
	public void setUserEmailIdFk(String userEmailIdFk) {
		this.userEmailIdFk = userEmailIdFk;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryType() {
		return categoryType;
	}
	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

}
