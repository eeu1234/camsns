package com.spring.camsns.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.camsns.dao.UniversityDAO;

@Controller("universityController")
public class UniversityController {
	
	@Autowired
	private UniversityDAO dao;
}
