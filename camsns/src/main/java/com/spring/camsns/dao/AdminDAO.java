package com.spring.camsns.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.camsns.dto.SearchDTO;
import com.spring.camsns.dto.SnsboardDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	
	
	public int getTotal(SearchDTO sdto){
		
		
		
		return sql.selectOne("countBoard",sdto);
		
	};

	public List<SnsboardDTO> boardlist(SearchDTO sdto) {
		
		
		return sql.selectList("adminBoardList", sdto);
	}


	
	
}
