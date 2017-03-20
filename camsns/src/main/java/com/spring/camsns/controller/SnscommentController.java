package com.spring.camsns.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.camsns.dao.SnscommentDAO;

@Controller("snscommentController")
public class SnscommentController {
	
	@Autowired
	private SnscommentDAO dao;
	
}
