package com.spring.camsns.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.camsns.dto.SnsboardCategoryDTO;
import com.spring.camsns.dto.SnsboardDTO;
import com.spring.camsns.dto.SnsboardfileDTO;

@Repository
public class SnsboardDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	public int countList(String universitySeq){
		
		return sql.selectOne("countList",universitySeq);
	}
	
	
	//글 로딩
	public List<SnsboardCategoryDTO> boardList(String universitySeq,String index){
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("universitySeq", universitySeq);
		map.put("index", index);
		// TODO Auto-generated method stub
		return sql.selectList("boardList",map);
	}


	
	
	
	//글 쓰기
	public int writeBoard(SnsboardDTO boardDto, ArrayList<SnsboardfileDTO> fileList) {
		int result=0;
		
		int writeResult = sql.insert("writeBoard",boardDto);
		//System.out.println("글쓰기 성공 : " + writeResult); 
		
		boardDto = sql.selectOne("writeSeq",boardDto.getUserEmailIdFk());
		//System.out.println("글번호" + boardDto.getSnsboardSeq());
		String boardSeq =  boardDto.getSnsboardSeq();
		
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		for(int i=0;i<fileList.size();i++){
			map.put("boardSeq", boardSeq);
			String fileName = fileList.get(i).getSnsboardfileName();
			map.put("fileName", fileName);
			
			
			
			int count = sql.insert("writeFile",map);
			result += count;
		}
		
		return result;
	}


	public SnsboardCategoryDTO boardOne(String boardSeq) {

		return sql.selectOne("boardOne",boardSeq);
	}






}
