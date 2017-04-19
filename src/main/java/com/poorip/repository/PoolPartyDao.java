package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.TravelInfoVo;

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

	public List<TravelInfoVo> getPoolKwd(String keyword) {
		return sqlSession.selectList( "travelInfo.getKwdData", keyword );
	}
	
	public List<PoolPartyVo> getPoolList(PoolPartyVo poolPartyVo) {
		return sqlSession.selectList("poolparty.selectbycty", poolPartyVo);
	}
	
}
