package com.spring.camsns.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.camsns.dto.UniversityDTO;
import com.spring.camsns.dto.UserDTO;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	//id가지고 로그인 로그남김
	public int insertLogin(String userEmailId) {
		// TODO Auto-generated method stub
		//System.out.println(22222222);
		return sql.insert("login.insertLogin",userEmailId);
	}

	//id를 가지고 기존회원인지 신규회원인지 판단
	public int checkId(String userEmailId) {
		// TODO Auto-generated method stub
		return sql.selectOne("login.checkId",userEmailId);
	}

	//id를 가지고 해당 유저의 정보불러옴
	public UserDTO getUser(String userEmailId) {
		// TODO Auto-generated method stub
		return sql.selectOne("login.getUser",userEmailId);
	}
	
	//학교 전체 목록 불러옴
	public List<UniversityDTO> getUniversity() {
		// TODO Auto-generated method stub
		return sql.selectList("login.getUniversity");
	}
	
	//유저 정보에 선택한 학교 추가
	public int updateUniversity(HashMap<String, String> map) {
		
		return sql.update("login.updateUniversity",map);
	}
	
	//한글자당 쿼리
	public List<UniversityDTO> searchUniversity(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("login.searchUniversity",map);
	}
	
	//한글자당 쿼리 String으로 받아오면 에러뱉음 -> getter가 없어서라는데 뭔 개소리? 이건 갑자기 왜 또 됨?
	public List<UniversityDTO> searchUniversityString(String word) {
		// TODO Auto-generated method stub
		return sql.selectList("login.searchUniversityString",word);
	} 
}
