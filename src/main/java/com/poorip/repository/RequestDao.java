package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.RequestVo;

@Repository
public class RequestDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public boolean insert(RequestVo requestVo){
		return 1 == sqlSession.insert("request.insert", requestVo);
	}
}
