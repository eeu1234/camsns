package com.spring.camsns.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.camsns.dto.SnsboardCategoryDTO;

@Repository
public class SnsboardDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	
	public List<SnsboardCategoryDTO> boardList(){
		
		return sql.selectList("boardList");
	} 
}
