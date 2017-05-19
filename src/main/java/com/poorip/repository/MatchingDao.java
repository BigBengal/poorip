package com.poorip.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.CityVo;
import com.poorip.vo.ScrapCityVo;
import com.poorip.vo.UserVo;

@Repository
public class MatchingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
//	public int insertSurvey() {
//		return sqlSession.insert("");
//	}

	public String getusrPrefValue(int usrSeq) {
		return sqlSession.selectOne( "user.getusrPrefValue", usrSeq );
	}

	public boolean updateprefer(UserVo userVo) {
		int count = sqlSession.insert( "user.updateprefer", userVo );
		return (count == 1);
	}

	public List<UserVo> getMatchingList() {
		return sqlSession.selectList( "user.getMatchingList" );
	}

	public UserVo getUserInfo(int usrSeq) {
		return sqlSession.selectOne( "user.getListbyusrseq", usrSeq );
	}

	public ScrapCityVo getScrapInfo( int usrSeq, int ctySeq ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "usrSeq", usrSeq );
		map.put( "ctySeq", ctySeq );
		return sqlSession.selectOne( "scrapcity.getScrapCityInfobyUsrSeqAndCtySeq", map );
	}

	public List<ScrapCityVo> getUsersScrapCityInfo() {
		return sqlSession.selectList( "scrapcity.getUsersScrapCityInfo" );
	}

	public List<CityVo> getCity() {
		return sqlSession.selectList( "city.getList" );
	}

	public List<ScrapCityVo> getUsersScrapInfoByCtySeq(int ctySeq) {
		return sqlSession.selectList( "scrapcity.getUsersScrapInfoByCtySeq", ctySeq );
	}

}
