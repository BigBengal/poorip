package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PostPicVo;

@Repository
public class PostPicDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean write(PostPicVo postpicvo){
		return 1 == sqlSession.insert("postpic.insert", postpicvo);
	}
	
	public boolean delete(PostPicVo postpicvo){
		return 1 == sqlSession.delete("postpic.delete",postpicvo);
	}
	
	public PostPicVo select(int seq) {
		return sqlSession.selectOne("postpic.selectbyno", seq);
	}
}
