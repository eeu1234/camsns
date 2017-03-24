package com.spring.camsns.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.camsns.dao.UserDAO;

@Controller("userController")
public class UserController {

	@Autowired
	private UserDAO dao;
	
}
	