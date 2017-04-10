package com.spring.camsns.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.camsns.dao.LoginDAO;
import com.spring.camsns.dto.UniversityDTO;
import com.spring.camsns.dto.UserDTO;

@Controller("loginController")
public class LoginController {
	@Autowired
	private LoginDAO dao;
	
	//네이버 로그인 콜백 페이지
	@RequestMapping(value = "/maindata.action", method = {RequestMethod.GET})
	public String maindata(HttpServletRequest request,HttpServletResponse response) {
		
		
		return "maindata";
	}
	
	
	@RequestMapping(value = "/checkId.action", method = {RequestMethod.GET})
	public void checkId(HttpServletRequest request,HttpServletResponse response, String userEmailId) {
		//System.out.println("checkId");
		HttpSession session = request.getSession();
		
		
		
		int check = dao.checkId(userEmailId);
		
		//테스트용
		//check=0;
		//System.out.println(check);
		if(check==1){
			session.removeAttribute("universitySeq");
			int result = dao.insertLogin(userEmailId);
			UserDTO udto = dao.getUser(userEmailId);
			session.setAttribute("udto", udto);
			session.setAttribute("check", check);
			session.setAttribute("universitySeq", udto.getUniversitySeqFk());
		}else{
			session.setAttribute("check", check);
			session.setAttribute("userEmailId", userEmailId);
		}

	}
	
	//학교 선택 페이지
	@RequestMapping(value = "/selectUniversity.action", method = {RequestMethod.GET})
	public String selectUniversity(HttpServletRequest request,HttpServletResponse response) {
		String check = request.getParameter("joinCheck");
		//System.out.println(check);
		if(check.equals("first")){
			//처음 페이지에 들어왔을 때 (no uniSeq, emailSeq)
			//뷰포트 메타태그
			//여기는 단순 학교seq만 
			request.setAttribute("check", "first");
		}
		
		List<UniversityDTO> uniList = dao.getUniversity();
		//System.out.println(uniList.size());
		request.setAttribute("uniList", uniList);
		
		return "login/selectUniversity";
	}
	
	
	//학교데이터 들고오는 페이지
	@RequestMapping(value = "/updateUniversity.action", method = {RequestMethod.GET})
	public String updateUniversity(HttpServletRequest request,HttpServletResponse response,String universitySeq,String userEmailId) {
		HashMap<String,String> map = new HashMap<String,String>();
		
		System.out.println(universitySeq);
		System.out.println(userEmailId);
		map.put("universitySeq", universitySeq);
		map.put("userEmailId", userEmailId);
		int result = dao.updateUniversity(map);
		
		return "updateUniversity";
	}
	
	//한글자당 쿼리
	@RequestMapping(value = "/searchUniversity.action", method = {RequestMethod.GET})
	public String searchUniversity(HttpServletRequest request,HttpServletResponse response,String word) {
		System.out.println(word);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("word", word);
		List<UniversityDTO> uniList = dao.searchUniversity(map);
		
		
		/*
		//  String으로 던지면 에러남
		List<UniversityDTO> uniList = dao.searchUniversityString(word);
		*/
		
		
		
		if(word==null || word.equals("") ){
			
		}else{
			request.setAttribute("uniList", uniList);
		}
			
		
		
		return "login/selectUniversityData";
	}
	
}	
