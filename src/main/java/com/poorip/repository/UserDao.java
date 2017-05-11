package com.poorip.repository;

import java.util.List;

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
		return 1 == (Integer)sqlSession.selectOne("user.isexistuser", uservo);
	}
	
	public boolean isNick(UserVo uservo) {
		return 1 == (Integer)sqlSession.selectOne("user.isexistnick", uservo);
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

	
}
