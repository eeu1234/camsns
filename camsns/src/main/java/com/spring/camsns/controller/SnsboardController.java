package com.spring.camsns.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.camsns.dao.SnsboardDAO;
import com.spring.camsns.dto.SnsboardCategoryDTO;

@Controller("SnsboardController")
public class SnsboardController {

	@Autowired
	private SnsboardDAO dao;
	
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main(HttpServletRequest request,HttpServletResponse response) {
		
		List<SnsboardCategoryDTO> boardDtoList = dao.boardList();
		
		request.setAttribute("boardDtoList", boardDtoList);
		
		
		return "main";
	}
	
}
