package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PoolPostVo;

@Repository
public class PoolPostDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean write(PoolPostVo poolpostvo){
		return 1 == sqlSession.insert("poolpost.insert", poolpostvo);
	}
	
	public boolean delete(PoolPostVo poolpostvo){
		return 1 == sqlSession.delete("poolpost.delete",poolpostvo);
	}
	public PoolPostVo select(int seq){
		return sqlSession.selectOne("poolpost.selectbyno", seq);
	}
}
