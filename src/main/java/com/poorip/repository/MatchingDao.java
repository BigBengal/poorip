package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.UserVo;

@Repository
public class MatchingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSurvey() {
		return sqlSession.insert("");
	}

	public int getusrPrefValue(int usrSeq) {
		return sqlSession.selectOne( "user.getusrPrefValue", usrSeq );
	}

	public boolean updateprefer(UserVo userVo) {
		int count = sqlSession.insert( "user.updateprefer", userVo );
		return (count == 1);
	}

}
