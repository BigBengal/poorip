package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;

	public boolean write(PostVo postvo) {
		return 1 == sqlSession.insert("post.insert", postvo);
	}

	public boolean delete(PostVo postvo) {
		return 1 == sqlSession.delete("post.delete", postvo);
	}
	
	public PostVo select(int seq) {
		return sqlSession.selectOne("post.selectbyno", seq);
	}
	
	

}
