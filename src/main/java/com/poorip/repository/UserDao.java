package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public boolean join(UserVo uservo){
		return 1 == sqlSession.insert("user.insert", uservo);
	}
	
	public boolean delete(UserVo uservo){
		return 1 == sqlSession.delete("user.delete",uservo);
	}
	
	
}