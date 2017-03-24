package com.spring.camsns.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.camsns.dto.UniversityDTO;

@Repository
public class UniversityDAO {


	@Autowired
	SqlSessionTemplate sql;
	
	
	public List<UniversityDTO> list() {
		
		return sql.selectList("universityList");
	}

}
