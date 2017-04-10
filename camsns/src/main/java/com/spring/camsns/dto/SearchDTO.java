package com.spring.camsns.dto;

public class SearchDTO {
	//검색했는지 확인
	private String column;
	private String word;
	private boolean isSearch;
	//페이지용 시작값
	private int start;
	//검색했으면 검색에 넣을 where 변수 선언
	private String whereWord;
	
	public String getWhereWord() {
		return whereWord;
	}
	public void setWhereWord(String whereWord) {
		this.whereWord = whereWord;
	}
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public boolean isSearch() {
		return isSearch;
	}
	public void setSearch(boolean isSearch) {
		this.isSearch = isSearch;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
}
