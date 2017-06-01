package com.poorip.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PoolMemberVo;
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

	public List<UserVo> getMatchingList(UserVo userVo) {
		return sqlSession.selectList( "user.getMatchingList", userVo);
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

	public List<ScrapCityVo> getUsersScrapInfoByCtySeq(int ctySeq, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "usrSeq", usrSeq );
		map.put( "ctySeq", ctySeq );
		return sqlSession.selectList( "scrapcity.getUsersScrapInfoByCtySeq", map );
	}

	public List<UserVo> addUsrOtherInfo(List<UserVo> samePlanMember) {
		for(int i=0; i<samePlanMember.size(); i++) {
			int usrSeq = samePlanMember.get(i).getUsrSeq();
			UserVo member = sqlSession.selectOne( "user.getListbyusrseq", usrSeq );
			samePlanMember.get(i).setUsrEmail(member.getUsrEmail());
			samePlanMember.get(i).setUsrGender(member.getUsrGender());
			samePlanMember.get(i).setUsrProfile(member.getUsrProfile());
			samePlanMember.get(i).setUsrNick(member.getUsrNick());
			samePlanMember.get(i).setUsrInfo(member.getUsrInfo());
			samePlanMember.get(i).setUsrHashtag(member.getUsrHashtag());
		}
		return samePlanMember;
	}

	public List<PoolMemberVo> getMyPoolListMember(int usrSeq) {
		return sqlSession.selectList( "poolmember.isPoolMemeber", usrSeq);
	}

	public List<ScrapCityVo> getUsersScrapInfoByUserSeq(int usersSeq) {
		return sqlSession.selectList( "scrapcity.getScrapCityInfobyUsrSeq", usersSeq );
	}

}
