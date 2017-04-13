package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public boolean isExist(UserVo uservo) {
		return 1 == (Integer)sqlSession.selectOne("user.isexistuser", uservo);
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
	
	public boolean updateProfile(UserVo uservo) {
		return 1 == sqlSession.update("user.updateprofile", uservo);
	}
	
	public boolean updateNoti(UserVo uservo) {
		return 1 == sqlSession.update("user.updatenoti", uservo);
	}
	
	public UserVo select(UserVo uservo) {
		UserVo vo = sqlSession.selectOne("user.selectbyemail", uservo);
		return vo;
	}

	
}
