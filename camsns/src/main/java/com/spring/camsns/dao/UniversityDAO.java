package com.spring.camsns.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.camsns.dto.SearchDTO;
import com.spring.camsns.dto.UniversityDTO;

@Repository
public class UniversityDAO {


	@Autowired
	SqlSessionTemplate sql;
	
	
	public List<UniversityDTO> list() {
		
		return sql.selectList("universityList");
	}


	public int getUniversityTotal(SearchDTO where) {
		// TODO Auto-generated method stub
		return sql.selectOne("adminUniversity.getUniversityTotal",where);
	}


	public List<UniversityDTO> getUniversityList(SearchDTO where) {
		// TODO Auto-generated method stub
		return sql.selectList("adminUniversity.getUniversityList",where);
	}

}
