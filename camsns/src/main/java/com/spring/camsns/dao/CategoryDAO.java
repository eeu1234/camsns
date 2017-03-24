package com.spring.camsns.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.camsns.dto.CategoryDTO;
import com.spring.camsns.dto.SnsboardCategoryDTO;

@Repository
public class CategoryDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	

	/*카테고리 리스트 불러오기*/
	public List<CategoryDTO> categoryList() {
		
		
		return sql.selectList("categoryList");
	}


	
}
