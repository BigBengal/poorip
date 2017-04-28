package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.CityVo;
import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.TravelInfoVo;

@Repository
public class PoolPartyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean join(PoolPartyVo poolPartyVo){
		return 1 == sqlSession.insert("poolparty.insert", poolPartyVo);
	}
	
	public boolean updatehit(int poolpartrySeq) {
		return 1 == sqlSession.update("poolparty.updatehit", poolpartrySeq);
	}
	
	public boolean delete(PoolPartyVo poolPartyVo){
		return 1 <= sqlSession.delete("poolparty.delete",poolPartyVo);
	}
	
	
	// 1개의 풀파티 정보 가져오기
	public PoolPartyVo select(int poolseq){
		return sqlSession.selectOne("poolparty.selectbyseq", poolseq);
	}
	
	// 내가 가입한 풀파티 리스트 가져오기
	public List<PoolPartyVo> getMyPoolList(int usrSeq) {
		return sqlSession.selectList("poolparty.selectlistbyusrseq", usrSeq);
	}
	
	// 내가 가입 대기 중인  풀파티 리스트 가져오기
	public List<PoolPartyVo> getMyWaitPoolList(int usrSeq) {
		return sqlSession.selectList("poolparty.selectwaitlistbyusrseq", usrSeq);
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
	
	public List<PoolPartyVo> selectTop10(){
		return sqlSession.selectList("poolparty.selecttop10");
	}
	
	public List<CityVo> getCityNames(String ctyName) {
		return sqlSession.selectList("travelInfo.getKwdData", ctyName);
	}


}
