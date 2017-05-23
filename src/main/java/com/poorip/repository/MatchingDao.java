package com.poorip.repository;

import java.util.ArrayList;
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
		return sqlSession.selectOne( "user.getMatchingListByUsrSeq", usrSeq );
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

	public List<ScrapCityVo> getUsersScrapInfoByCtySeq(int ctySeq, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "usrSeq", usrSeq );
		map.put( "ctySeq", ctySeq );
		return sqlSession.selectList( "scrapcity.getUsersScrapInfoByCtySeq", map );
	}

	public List<UserVo> getTop5Info(List<UserVo> top5) {
		
		for(int i=0; i < top5.size(); i++){
			int usrSeq = top5.get(i).getUsrSeq();
			UserVo member = sqlSession.selectOne( "user.getListbyusrseq", usrSeq );
			top5.get(i).setUsrEmail(member.getUsrEmail());
			top5.get(i).setUsrGender(member.getUsrGender());
			top5.get(i).setUsrProfile(member.getUsrProfile());
			top5.get(i).setUsrNick(member.getUsrNick());
			top5.get(i).setUsrInfo(member.getUsrInfo());
			
		}
		return top5;
	}

	public List<UserVo> getSamePlanMember(List<UserVo> samePlanMember) {
		for(int i=0; i<samePlanMember.size(); i++) {
			System.out.println(samePlanMember);
			int usrSeq = samePlanMember.get(i).getUsrSeq();
			UserVo member = sqlSession.selectOne( "user.getListbyusrseq", usrSeq );
			samePlanMember.get(i).setUsrEmail(member.getUsrEmail());
			samePlanMember.get(i).setUsrGender(member.getUsrGender());
			samePlanMember.get(i).setUsrProfile(member.getUsrProfile());
			samePlanMember.get(i).setUsrNick(member.getUsrNick());
			samePlanMember.get(i).setUsrInfo(member.getUsrInfo());
		}
		System.out.println("daodaodao"+samePlanMember);
		return samePlanMember;
	}

}
