package com.spring.camsns.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.camsns.dto.SnscommentDTO;

@Repository
public class SnscommentDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	
	// 댓글 추가하기
	public int addComment(SnscommentDTO cdto) {
		
		return sql.insert("snsboard.cAdd",cdto);
	}

	// 댓글 리스트 불러오기
	public List<SnscommentDTO> listComment(String boardSeq) {
		
		return sql.selectList("snsboard.cList",boardSeq);
	}

	// 선택 댓글 삭제
	public int delComment(String seq) {

		return sql.delete("snsboard.cDel",seq);
	}

	
	
}
	