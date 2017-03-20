package com.spring.camsns.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.camsns.dao.CategoryDAO;
import com.spring.camsns.dao.SnsboardDAO;
import com.spring.camsns.dto.CategoryDTO;
import com.spring.camsns.dto.SnsboardCategoryDTO;
import com.spring.camsns.dto.SnsboardDTO;

@Controller("SnsboardController")
public class SnsboardController {

	@Autowired
	private SnsboardDAO boardDao;
	
	@Autowired
	private CategoryDAO categoryDao;

	
	//메인페이지
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response) {
		List<SnsboardCategoryDTO> boardDtoList = boardDao.boardList();

		request.setAttribute("boardDtoList", boardDtoList);

		return "main";
	}
	
	
	
	
	//뷰페이지
		@RequestMapping(value = "/snsboard/snsboardview.action", method = RequestMethod.GET)
		public String boardView(HttpServletRequest request, HttpServletResponse response,String boardSeq) {

			System.out.println(boardSeq);
			SnsboardCategoryDTO boardDto = boardDao.boardOne(boardSeq);
			request.setAttribute("boardDto", boardDto);
			
			return "snsboard/boardview";
		}
		
		
		
		
		
	
	//글쓰기 페이지
	@RequestMapping(value = "/snsboard/writeBoard.action", method = RequestMethod.GET)
	public String writeBoard(HttpServletRequest request, HttpServletResponse response) {
		
		//카테고리 리스트 넘겨줌
		List<CategoryDTO> categoryDtoList = categoryDao.categoryList();
		request.setAttribute("categoryDtoList", categoryDtoList);

		return "snsboard/writeboard";
	}
	
	
	
	//글쓰기동작 페이지
	@RequestMapping(value = "/snsboard/writeBoardOk.action", method = RequestMethod.POST)
	public String writeBoardOk(HttpServletRequest request, HttpServletResponse response
																	,String categoryVal
																	,String subject
																	,String content //파일추가 ,String fileName
																	) {
		
		String userId="eeu1234@naver.com";
		
		SnsboardDTO boardDto = new SnsboardDTO();
		boardDto.setCategorySeqFk(categoryVal);
		boardDto.setSnsboardSubject(subject);
		boardDto.setSnsboardContent(content);
		boardDto.setUserEmailIdFk(userId);
		//boardDto.setSnsboardfileName(fileName);
		
		
		int result = boardDao.writeBoard(boardDto);

		request.setAttribute("result", result);

		return "snsboard/writeboardok";
	}

}
