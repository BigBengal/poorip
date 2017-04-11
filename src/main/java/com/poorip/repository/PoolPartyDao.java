package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PoolPartyVo;

@Repository
public class PoolPartyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean join(PoolPartyVo poolPartyVo){
		return 1 == sqlSession.insert("poolparty.insert", poolPartyVo);
	}
	
	public boolean delete(PoolPartyVo poolPartyVo){
		return 1 <= sqlSession.delete("poolparty.delete",poolPartyVo);
	}
	
	public PoolPartyVo select(int seq){
		return sqlSession.selectOne("poolparty.selectbyseq", seq);
	}
	
	public boolean update(PoolPartyVo poolPartyVo){
		return 1 <= sqlSession.update("poolparty.update", poolPartyVo);
	}
	
}
