package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.CategoryVo;

@Repository
public class CategoryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert( CategoryVo categoryVo ) {
		return 1 == sqlSession.insert( "category.insert", categoryVo );
	}
	
	public CategoryVo getList( int catSeq ) {
		return sqlSession.selectOne( "category.getByNo", catSeq );
	}
	
	
	public boolean delete( CategoryVo categoryVo ) {
		return 1 == sqlSession.delete( "category.delete", categoryVo );
	}
	
}
