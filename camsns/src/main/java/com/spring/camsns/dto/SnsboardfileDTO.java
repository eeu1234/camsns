package com.spring.camsns.dto;

public class SnsboardfileDTO {
	private String snsboardfileSeq;
	private String snsboardfileFileName;
	private String snsboardSeqFk;
	public String getSnsboardfileSeq() {
		return snsboardfileSeq;
	}
	public void setSnsboardfileSeq(String snsboardfileSeq) {
		this.snsboardfileSeq = snsboardfileSeq;
	}

	public String getSnsboardfileFileName() {
		return snsboardfileFileName;
	}
	public void setSnsboardfileFileName(String snsboardfileFileName) {
		this.snsboardfileFileName = snsboardfileFileName;
	}
	public String getSnsboardSeqFk() {
		return snsboardSeqFk;
	}
	public void setSnsboardSeqFk(String snsboardSeqFk) {
		this.snsboardSeqFk = snsboardSeqFk;
	}
}
