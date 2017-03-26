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

	// 글 갯수가져오기
	public int countList(String universitySeq, String word) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("universitySeq", universitySeq);
		map.put("word", word);// ?번째 부터 ?번째 글
		// System.out.println("행 갯수 :"+sql.selectOne("countList",map));
		return sql.selectOne("countList", map);
	}

	// 글 로딩
	public List<SnsboardCategoryDTO> boardList(String universitySeq, String index, String word) {
		// System.out.println(universitySeq +":"+index +":"+word);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("universitySeq", universitySeq);
		map.put("index", index);// ?번째 부터 ?번째 글
		map.put("word", word);// 검색어

		// 임시로 배열에 글 저장
		List<SnsboardCategoryDTO> tempBoard = sql.selectList("boardList", map);

		//List<List<SnsboardfileDTO>> fileDto = new ArrayList<List<SnsboardfileDTO>>();

		// 각 글 파일 담기
		for (int i = 0; i < tempBoard.size(); i++) {
			List<SnsboardfileDTO> file = sql.selectList("fileSelect", tempBoard.get(i).getSnsboardSeq());
			tempBoard.get(i).setFilelist(file);
		}

		return tempBoard;
	}

	

	// 글 쓰기
	public int writeBoard(SnsboardDTO boardDto, ArrayList<SnsboardfileDTO> fileList) {
		int result = 0;

		result = sql.insert("writeBoard", boardDto);
		// System.out.println("글쓰기 성공 : " + writeResult);

		boardDto = sql.selectOne("writeSeq", boardDto.getUserEmailIdFk());
		// System.out.println("글번호" + boardDto.getSnsboardSeq());
		String boardSeq = boardDto.getSnsboardSeq();

		HashMap<String, String> map = new HashMap<String, String>();

		for (int i = 0; i < fileList.size(); i++) {
			map.put("boardSeq", boardSeq);
			String fileName = fileList.get(i).getSnsboardfileFileName();
			map.put("fileName", fileName);

			int count = sql.insert("writeFile", map);
			result += count;
		}

		return result;
	}

	public SnsboardCategoryDTO boardOne(String boardSeq) {

		return sql.selectOne("boardOne", boardSeq);
	}

}
