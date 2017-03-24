package com.spring.camsns.dto;

public class SnscommentDTO {
	private String snscommentSeq;
	private String snscommentContent;
	private String snscommentRegdate;
	private String snscommentBlind;
	private String snscommentThread;
	private String snscommentDepth;
	private String snscommentFilename;
	private String userEmailIdFk;
	private String snsboardSeqFk;
	
	public String getSnscommentSeq() {
		return snscommentSeq;
	}
	public void setSnscommentSeq(String snscommentSeq) {
		this.snscommentSeq = snscommentSeq;
	}
	public String getSnscommentContent() {
		return snscommentContent;
	}
	public void setSnscommentContent(String snscommentContent) {
		this.snscommentContent = snscommentContent;
	}
	public String getSnscommentRegdate() {
		return snscommentRegdate;
	}
	public void setSnscommentRegdate(String snscommentRegdate) {
		this.snscommentRegdate = snscommentRegdate;
	}
	public String getSnscommentBlind() {
		return snscommentBlind;
	}
	public void setSnscommentBlind(String snscommentBlind) {
		this.snscommentBlind = snscommentBlind;
	}
	public String getSnscommentThread() {
		return snscommentThread;
	}
	public void setSnscommentThread(String snscommentThread) {
		this.snscommentThread = snscommentThread;
	}
	public String getSnscommentDepth() {
		return snscommentDepth;
	}
	public void setSnscommentDepth(String snscommentDepth) {
		this.snscommentDepth = snscommentDepth;
	}
	public String getSnscommentFilename() {
		return snscommentFilename;
	}
	public void setSnscommentFilename(String snscommentFilename) {
		this.snscommentFilename = snscommentFilename;
	}
	public String getSnsboardSeqFk() {
		return snsboardSeqFk;
	}
	public void setSnsboardSeqFk(String snsboardSeqFk) {
		this.snsboardSeqFk = snsboardSeqFk;
	}
	public String getUserEmailIdFk() {
		return userEmailIdFk;
	}
	public void setUserEmailIdFk(String userEmailIdFk) {
		this.userEmailIdFk = userEmailIdFk;
	}
	
	
}
