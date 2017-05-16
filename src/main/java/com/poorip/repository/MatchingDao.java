package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSurvey() {
		return sqlSession.insert("");
	}

}
