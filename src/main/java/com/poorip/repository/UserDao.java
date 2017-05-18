package com.poorip.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<UserVo> list(){
		return sqlSession.selectList("user.getList");
	}
	
	public UserVo listByUsrSeq(int usrSeq){
		return sqlSession.selectOne("user.getListbyusrseq", usrSeq);
	}
	
	public boolean isExist(UserVo uservo) {
		return 1 <= (Integer)sqlSession.selectOne("user.isexistuser", uservo);
	}
	
	public boolean isNick(UserVo uservo) {
		return 1 <= (Integer)sqlSession.selectOne("user.isexistnick", uservo);
	}
	
	public boolean join(UserVo uservo){
		return 1 == sqlSession.insert("user.insert", uservo);
	}
	
	public boolean updateBlack(UserVo uservo) {
		return 1 == sqlSession.update("user.addblack", uservo);
	}
	
	public boolean delete(UserVo uservo){
		return 1 == sqlSession.delete("user.delete",uservo);
	}
	
	public boolean updateLogin(UserVo uservo) {
		return 1 == sqlSession.update("user.updatelogin", uservo);
	}
	
	//필수 정보 저장
	public boolean updateLang(UserVo uservo) {
		return 1 == sqlSession.update("user.updatelang", uservo);
	}

	public boolean updateGender(UserVo uservo) {
		return 1 == sqlSession.update("user.updategender", uservo);
	}
	
	public boolean updateNick(UserVo uservo) {
		return 1 == sqlSession.update("user.updatenick", uservo);
	}
	
	public boolean updateBirthday(UserVo uservo) {
		return 1 == sqlSession.update("user.updatebirthday", uservo);
	}
	
	
	//옵션 정보 저장
	public boolean updatePrefer(UserVo uservo) {
		return 1 == sqlSession.update("user.updateprefer", uservo);
	}

	public boolean updateInfoHash(UserVo uservo) {
		return 1 == sqlSession.update("user.updateinfohash", uservo);
	}
	
	public boolean updateNoti(UserVo uservo) {
		return 1 == sqlSession.update("user.updatenoti", uservo);
	}
		
	public UserVo select(UserVo uservo) {
		UserVo vo = sqlSession.selectOne("user.selectbyemail", uservo);
		return vo;
	}

	public int getSeqByNick(String usrNick) {
		try {
				return sqlSession.selectOne("user.getseqbynick", usrNick);	
		}
		catch(Exception e){
			return 0;
		}
	}

//--------------------------------1점 추가 ------------------------------------------------//
	public boolean updateFoodHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateFoodHit", map);
		return count == 1;
		
	}
	
	public boolean updateSightHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateSightHit", map);
		return count == 1;
	}

	public boolean updateActivityHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateActivityHit", map);
		return count == 1;
	}

	public boolean updateLuxuryHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateLuxuryHit", map);
		return count == 1;
	}

//--------------------------------100점 추가 ------------------------------------------------//
	public boolean updateScrapFoodHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateScrapFoodHit", map);
		return count == 1;
	}
	
	public boolean updateScrapSightHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateScrapSightHit", map);
		return count == 1;
	}
	
	public boolean updateScrapActivityHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateScrapActivityHit", map);
		return count == 1;
	}
	
	public boolean updateScrapLuxuryHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateScrapLuxuryHit", map);
		return count == 1;
	}

//--------------------------------100점 감소------------------------------------------------//
	public boolean updateDeleteScrapFoodHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateDeleteScrapFoodHit", map);
		return count == 1;
	}

	public boolean updateDeleteScrapSightHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateDeleteScrapSightHit", map);
		return count == 1;
	}

	public boolean updateDeleteScrapActivityHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateDeleteScrapActivityHit", map);
		return count == 1;
	}

	public boolean updateDeleteScrapLuxuryHit(int trvSeq1, int usrSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usrSeq", usrSeq);
		map.put("trvSeq", trvSeq1);
		int count = sqlSession.update("user.updateDeleteScrapLuxuryHit", map);
		return count == 1;
	}

}
