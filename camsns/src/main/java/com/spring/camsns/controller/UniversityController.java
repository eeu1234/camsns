package com.spring.camsns.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.camsns.dao.UniversityDAO;
import com.spring.camsns.dto.SearchDTO;
import com.spring.camsns.dto.UniversityDTO;


@Controller("universityController")
public class UniversityController {
	
	@Autowired
	private UniversityDAO dao;
	
	@RequestMapping(method={RequestMethod.GET},value="/admin/university/uniList.action")
	public String uniList(HttpServletRequest request, HttpSession session, HttpServletResponse response,
							String page,SearchDTO sdto){
		
		//페이징 -> 게시판의 꽃
		int nowPage = 0;			//현재 페이지 번호
		int totalCount = 0;			//총 게시물 수
		int pageSize = 10;			//한 페이지에 보여줄 게시물 수(LIMIT의 2번째 인자값사용?)
		int totalPage = 0;			//총 페이지 수
		int start = 0;				//LIMIT 조건에 사용될 시작값
		
		int n = 0, loop = 0;		//페이지바에 사용
		int blockSize = 10;
		
		if (page == null) {
			nowPage = 1;		//그냥 들어오면 무조건 첫페이지를 보여주자.
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		//nowPage -> start 범위 계산
		//1page -> 0, 10(LIMIT)
		//2page -> 10, 10
		start = ((nowPage - 1) * pageSize);
		//dto 에 시작값 넣기
		sdto.setStart(start);
		
		//검색했는지 확인
		String column = sdto.getColumn();
		String word = sdto.getWord();
		System.out.println("컬럼 : "+column+" 워드 : "+word);
		
		//페이징 때문에 검색이 없으면 null 로 넘어감.
		if ((column != null && word != null) &&
				(!column.equals("null") && !word.equals("null"))) {
			
			String where = String.format("WHERE %s like '%%%s%%'", column, word);
			sdto.setWhereWord(where);
			
		}
		
		//페이징 하기위한 토탈 수
		totalCount = dao.getUniversityTotal(sdto);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		//검색+시작값 DTO 넘김
		List<UniversityDTO> uniList = dao.getUniversityList(sdto);
		
		//페이지바 만들기
		String pageBar = "";
		
		loop = 1;	//페이지 번호를 만드는 루프 담당
		n = ((nowPage - 1) / blockSize) * blockSize + 1;	//페이지 번호 역할(시작 번호)
		
		pageBar += "<nav><ul class='pagination'>";
		if(n == 1) {
			pageBar += String.format("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		} else {
			pageBar += String.format("<li><a href='/spring/admin/adminManage.action?page=%d&column=%s&word=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>", n-1, column, word);
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			//현재 보고 있는 페이지?
			if (n == nowPage) {
				pageBar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
			} else {
				pageBar += String.format("<li><a href='/spring/admin/adminManage.action?page=%d&column=%s&word=%s'>%d</a></li>", n, column, word, n);
			}
			
			n++;
			loop++;
			
		}//페이지 번호 while
		
		if (n > totalPage) {
			pageBar += String.format("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		} else {
			pageBar += String.format("<li><a href='/spring/admin/adminManage.action?page=%d&column=%s&word=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>", n, column, word);
		}
		
		pageBar += "</ul></nav>";
		
		request.setAttribute("uniList", uniList);
		request.setAttribute("sdto", sdto);
		request.setAttribute("pageBar", pageBar);
		
		return "admin/university/universityList";
	}
	
	@RequestMapping(method={RequestMethod.GET},value="/admin/university/universityAdd.action")
	public String universityAdd(HttpServletRequest request, HttpSession session, HttpServletResponse response){
		
		
		
		return "admin/university/universityAdd";
	}
}
