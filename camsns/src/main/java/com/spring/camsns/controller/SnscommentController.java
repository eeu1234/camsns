package com.spring.camsns.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.camsns.dao.SnscommentDAO;
import com.spring.camsns.dto.SnscommentDTO;

@Controller("snscommentController")
public class SnscommentController {
	
	@Autowired
	private SnscommentDAO dao;
	
	@RequestMapping(method={RequestMethod.POST}, value="/snsboard/addComment.action")
	public String addComment(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String boardSeq = request.getParameter("snsboardSeqFk");
		String content = request.getParameter("snscommentContent");
		String fileName = request.getParameter("snscommentFilename");
		
		SnscommentDTO cdto = new SnscommentDTO(); 

		cdto.setSnscommentFilename(fileName);
		cdto.setSnscommentContent(content);
		cdto.setUserEmailIdFk("eeu1234@naver.com");	//세션으로 변경할것 session.getId()
		cdto.setSnsboardSeqFk(boardSeq);
		
		int cResult = dao.addComment(cdto);
		
		
		request.setAttribute("cResult", cResult);
		
		return "main";
	}
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/snsboard/listComment.action")
	public String listComment(HttpServletRequest request, String boardSeq) {
		
		List<SnscommentDTO> clist = dao.listComment(boardSeq);
		
		request.setAttribute("clist", clist);
		
		return "snsboard/commentview";
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="/snsboard/delComment.action")
	public String delComment(HttpServletRequest request, String seq){
		
		int dcResult = dao.delComment(seq);
		
		request.setAttribute("dcResult", dcResult);
		
		return "main";
	}
	
	
}
