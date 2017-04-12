package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.ScrapVo;
import com.poorip.vo.TravelInfoVo;

@Repository
public class TravelInfoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<TravelInfoVo> getInfo( int ctySeq ) {
		return sqlSession.selectList( "travelInfo.getInfo", ctySeq );
	}
	
	public List<TravelInfoVo> getMainInfo() {
		return sqlSession.selectList("travelInfo.getInfomain");
	}
	
	public List<ScrapVo> categoryList( String userEmail ) {
		return sqlSession.selectList( "travelInfo.getScrapInfo", userEmail );
	}
	
	public boolean insert( TravelInfoVo travelInfoVo ) {
		return 1 == sqlSession.insert( "travelInfo.insert", travelInfoVo );
	}
	
	public boolean update( TravelInfoVo travelInfoVo ) {
		return 1 == sqlSession.update( "travelInfo.update", travelInfoVo );
	}
	
	public boolean delete( TravelInfoVo travelInfoVo ) {
		return 1 == sqlSession.delete( "travelInfo.delete", travelInfoVo );
	}
	
}
