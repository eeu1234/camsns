package com.spring.camsns;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller("homecontroller10")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	HomeDAO dao; 
	
	@RequestMapping(value = "/home.action", method = RequestMethod.GET)
	public String home(HttpServletRequest request,HttpServletResponse response) {
		
		int temp = dao.m1();
		dao.test();
		List<HomeDTO> list = dao.m2();
		System.out.println(temp);
		
		
		
		request.setAttribute("temp", temp);
		request.setAttribute("list", list);
		
		
		
		
		return "home";
	}
	
}
