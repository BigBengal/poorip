package com.poorip.repository;

import java.util.List;

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
	
	public List<PoolMemberVo> getListbyUsrSeq(int usrSeq){
		return sqlSession.selectList("poolmember.selectbyusrseq", usrSeq);
	}
	
	public List<PoolMemberVo> getListbyPoolSeq(int poolSeq){
		return sqlSession.selectList("poolmember.selectbypoolseq", poolSeq);
	}
	
	public List<PoolMemberVo> getRequestListbyUsrSeq(int usrSeq){
		return sqlSession.selectList("poolmember.requestlist", usrSeq);
	}
		
	public boolean approve(PoolMemberVo poolmembervo){
		return 1 == sqlSession.update("poolmember.approve",poolmembervo);
	}
	
	public boolean reject(PoolMemberVo poolmembervo){
		return 1 == sqlSession.delete("poolmember.reject",poolmembervo);
	}
	
	public boolean isDestoryPoolParty(PoolMemberVo poolmembervo){
		// 0이면 폭파(방장빼고 가입수락한 사람 없는 경우)
		return 0 == (Integer)sqlSession.selectOne("poolmember.isdestorable",poolmembervo);
	}

	
}
