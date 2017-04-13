package com.poorip.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.UserDao;
import com.poorip.vo.UserVo;

@Service
public class UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	UserDao userDao;
	
	// 유저가 가입했는 지 확인
	public boolean isExistUser(UserVo userVo){
		return userDao.isExist(userVo);
	}
	
	// 유저 정보 가져오기
	public UserVo getUser(UserVo userVo) {
		// 회원 정보가 없으면 Null
		if ( isExistUser(userVo) == false){
			return null;
		}
		return userDao.select(userVo);
	}
	
	// 유저 가입 처리
	public boolean joinUser(UserVo userVo){
		return userDao.join(userVo);
	}
	
	//유저 가입 확인 및 자동 로그인
	public UserVo oneStep(UserVo userVo){
		UserVo vo = getUser(userVo);
		// 회원 정보가 없으면 가입 처리
		if ( vo == null ){
			if ( joinUser(userVo) ){
				vo = getUser(userVo);
			} else {
				//회원가입 오류
				logger.info("UserService.oneStep() 회원 가입 실패");
			}
		}
		return vo;
		
	}
	

}
