package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PoolMemberVo;

@Repository
public class PoolMemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean join(PoolMemberVo poolmembervo){
		return 1 == sqlSession.insert("poolmember.insert", poolmembervo);
	}
	
	public boolean delete(PoolMemberVo poolmembervo){
		return 1 == sqlSession.delete("poolmember.delete",poolmembervo);
	}
	
	public PoolMemberVo select(int poolMemSeq){
		return sqlSession.selectOne("poolmember.selectbyno", poolMemSeq);
	}
}
