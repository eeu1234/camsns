package com.spring.camsns.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.camsns.dto.SnsboardCategoryDTO;
import com.spring.camsns.dto.SnsboardDTO;

@Repository
public class SnsboardDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	
	public List<SnsboardCategoryDTO> boardList(){
		
		return sql.selectList("boardList");
	}

	
	
	
	
	
	public int writeBoard(SnsboardDTO boardDto) {
		int writeResult = sql.insert("writeBoard",boardDto);
		System.out.println("글쓰기 성공 : " + writeResult); 
		
		boardDto = sql.selectOne("writeSeq",boardDto.getUserEmailIdFk());
		System.out.println("글번호" + boardDto.getSnsboardSeq());
		
		//int reuslt = sql.insert("writeFile",boardDto.getSnsboardSeq())
		
		return 0;
	}


	public SnsboardCategoryDTO boardOne(String boardSeq) {

		return sql.selectOne("boardOne",boardSeq);
	} 
}
