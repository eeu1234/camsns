package com.spring.camsns;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO {

	@Autowired
	SqlSessionTemplate session;
	
	 public int m1() {
	      
	      return session.selectOne("m1");
	   }
	
	public void test() {
		String temp="";
		try {
			temp = session.getConnection().isClosed() + "";

			System.out.println(temp);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("exception : " + e.toString());
		}
	}

	public List<HomeDTO> m2() {
		// TODO Auto-generated method stub
		return session.selectList("m2");
	}


}
