package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PoolLikeVo;

@Repository
public class PoolLikeDao {

	@Autowired
	SqlSession sqlSession;
	
	public boolean insert( PoolLikeVo poolLikeVo ) {
		return 1 == sqlSession.insert( "poollike.insert", poolLikeVo );
	}
	
	public boolean delete( PoolLikeVo poolLikeVo ) {
		return 1 == sqlSession.delete( "poollike.delete", poolLikeVo );
	}
	
	public boolean isExisted(PoolLikeVo poolLikeVo) {
		return 1 == (Integer)sqlSession.selectOne("poollike.select", poolLikeVo );
	}
	
	public int likeCount(PoolLikeVo poolLikeVo) {
		return sqlSession.selectOne("poollike.selectlike", poolLikeVo );
	}
	
	public boolean deleteByPostSeq( int postSeq ) {
		return 1 <= sqlSession.delete( "poollike.deletebypostseq", postSeq );
	}
	
}
