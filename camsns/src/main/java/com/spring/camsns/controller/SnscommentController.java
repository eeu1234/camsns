package com.spring.camsns.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.camsns.dao.SnscommentDAO;
import com.spring.camsns.dto.SnscommentDTO;

@Controller("snscommentController")
public class SnscommentController {

	@Autowired
	private SnscommentDAO dao;

	String path = "";
	
	
	@RequestMapping(method={RequestMethod.POST}, value = "/snsboard/addComment.action")
	public String addComment(HttpServletRequest request) {
		path = request.getRealPath("/images/comment/");
		String fileName ="";
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

		try {

			MultipartFile mfile = multi.getFile("snscommentFilename");
			String temp = getFileName(mfile.getOriginalFilename());
			fileName = temp;//  등록
			System.out.println(path+temp);
			// 첨부 파일 참조
			File file = new File(path + temp);
			mfile.transferTo(file); // 파일 업로드 실행

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		
		
		
		
		HttpSession session = request.getSession();
		String boardSeq = request.getParameter("snsboardSeqFk");
		String content = request.getParameter("snscommentContent");
		
		
		
		SnscommentDTO cdto = new SnscommentDTO();

		cdto.setSnscommentFilename(fileName);
		cdto.setSnscommentContent(content);
		cdto.setUserEmailIdFk("eeu1234@naver.com"); // 세션으로 변경할것 session.getId()
		cdto.setSnsboardSeqFk(boardSeq);

		int cResult = dao.addComment(cdto);

		request.setAttribute("boardSeq", boardSeq);
		request.setAttribute("cResult", cResult);

		return "snsboard/commentwriteok";
	}

	
	
	//중복되지 않는 파일명 얻어오기
		public String getFileName(String filename) {
			
			int n = 1;
			int index = filename.lastIndexOf(".");
			String name = filename.substring(0,index);
			String ext = filename.substring(index);//.txt
			
				while(true){
				File file = new File(path+filename);
				
				if(file.exists()){
					//홍길동.txt
					filename= name +"_" + n + ext;	//홍길동_1.txt
					n++;
					
				} else {
					
					return file.getName();
					
				}
			
			}
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/snsboard/listComment.action")
	public String listComment(HttpServletRequest request, String boardSeq) {

		List<SnscommentDTO> clist = dao.listComment(boardSeq);

		System.out.println(clist.size());
		request.setAttribute("clist", clist);

		return "snsboard/commentview";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/snsboard/delComment.action")
	public String delComment(HttpServletRequest request, String seq) {

		int dcResult = dao.delComment(seq);

		request.setAttribute("dcResult", dcResult);

		return "main";
	}

}
