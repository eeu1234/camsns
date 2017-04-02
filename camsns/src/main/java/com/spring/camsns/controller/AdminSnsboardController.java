package com.spring.camsns.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.camsns.dao.AdminDAO;
import com.spring.camsns.dto.SearchDTO;
import com.spring.camsns.dto.SnsboardDTO;

@Controller("adminSnsboardController")
public class AdminSnsboardController {
	
	
	@Autowired
	private AdminDAO dao;
	
	//admin 관리 메인 페이지로 이동, 모든 대학 관리자 내역 가져옴
	@RequestMapping(method={RequestMethod.GET}
					, value="/admin/adminSnsboardList.action")
	public String adminSnsboardListlist(HttpServletRequest request
		,HttpSession session
		,String page
		,SearchDTO sdto){

		//학교번호 //세션으로변경하기
		String universitySeq ="1"; 
		
		
		//페이징 -> 게시판의 꽃
				int nowpage = 0;			//현재 페이지 번호
				int totalCount = 0;			//총 게시물 수
				int pageSize = 10;			//한 페이지에 보여줄 게시물 수(LIMIT의 2번째 인자값사용?)
				int totalPage = 0;			//총 페이지 수
				int start = 0;				//LIMIT 조건에 사용될 시작값
				
				int n = 0, loop = 0;		//페이지바에 사용
				int blockSize = 10;
				
				if (page == null) {
					nowpage = 1;		//그냥 들어오면 무조건 첫페이지를 보여주자.
				} else {
					nowpage = Integer.parseInt(page);
				}
				
				//nowpage -> start 범위 계산
				//1page -> 0, 10(LIMIT)
				//2page -> 10, 10
				start = ((nowpage - 1) * pageSize);
				//dto 에 시작값 넣기
				sdto.setStart(start);
				
				//검색했는지 확인
				String column = sdto.getColumn();
				String word = sdto.getWord();
				System.out.println("컬럼 : "+column+" 워드 : "+word);
				
				String where ="";
				if(universitySeq !=null){
					 where = String.format("WHERE UNIVERSITY_SEQ = '%s'",universitySeq);
					//페이징 때문에 검색이 없으면 null 로 넘어감.
					if ((column != null && word != null) &&
							(!column.equals("null") && !word.equals("null"))) {
						
						where += String.format("AND %s like '%%%s%%'", column, word);
						sdto.setWhereWord(where);
						
					}
				
					System.out.println(where);
				}else{
					//페이징 때문에 검색이 없으면 null 로 넘어감.
					if ((column != null && word != null) &&
							(!column.equals("null") && !word.equals("null"))) {
						
						where = String.format("WHERE %s like '%%%s%%'", column, word);
						sdto.setWhereWord(where);
						
					}
					System.out.println(where);
				}
				//페이징 하기위한 토탈 수
				totalCount = dao.getTotal(sdto);
				
				totalPage = (int)Math.ceil((double)totalCount / pageSize);
				
				//검색+시작값 DTO 넘김
				List<SnsboardDTO> boardlist = dao.boardlist(sdto);
				
				//페이지바 만들기
				String pagebar = "";
				
				loop = 1;	//페이지 번호를 만드는 루프 담당
				n = ((nowpage - 1) / blockSize) * blockSize + 1;	//페이지 번호 역할(시작 번호)
				
				pagebar += "<nav><ul class='pagination'>";
				if(n == 1) {
					pagebar += String.format("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
				} else {
					pagebar += String.format("<li><a href='/camsns/admin/adminSnsboardList.action?page=%d&column=%s&word=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>", n-1, column, word);
				}
				
				while (!(loop > blockSize || n > totalPage)) {
					//현재 보고 있는 페이지?
					if (n == nowpage) {
						pagebar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
					} else {
						pagebar += String.format("<li><a href='/camsns/admin/adminSnsboardList.action?page=%d&column=%s&word=%s'>%d</a></li>", n, column, word, n);
					}
					
					n++;
					loop++;
					
				}//페이지 번호 while
				
				if (n > totalPage) {
					pagebar += String.format("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
				} else {
					pagebar += String.format("<li><a href='/camsns/admin/adminSnsboardList.action?page=%d&column=%s&word=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>", n, column, word);
				}
				
				pagebar += "</ul></nav>";
				
				request.setAttribute("boardlist", boardlist);
				request.setAttribute("sdto", sdto);
				request.setAttribute("pagebar", pagebar);
				
				return "admin/adminSnsboardList";
	}
	
	
	
	
	//admin 계정 생성 시 대학 카테고리 가져오기
	@RequestMapping(method={RequestMethod.GET}
		, value="/admin/getUniversityList.action")
	public String getUniversityList(HttpServletRequest request
					,HttpSession session){
		
		//List<AdminDTO> alist = dao.alist();
		
		//request.setAttribute("alist", alist);
		
		return "admin/adminSnsboardList";
	}
}
	