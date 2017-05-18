package com.poorip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.MatchingDao;
import com.poorip.repository.UserDao;
import com.poorip.vo.UserVo;

@Service
public class MatchingService {

	@Autowired
	private MatchingDao matchingDao;
	@Autowired
	private UserDao userDao;

	// 유저가 가입했는 지 확인
	public boolean isExistUser( UserVo userVo ){
		return userDao.isExist( userVo );
	}

	public int getusrPrefValue( int usrSeq ) {
		int surveyYN = matchingDao.getusrPrefValue( usrSeq );
		return surveyYN;
	}

	public boolean updateprefer( UserVo userVo ) {
		return matchingDao.updateprefer( userVo );
	}

	public List<UserVo> getMatchingList( UserVo userVo ) {
		// 회원 정보가 없으면 Null
		if ( isExistUser(userVo) == false){
			return null;
		}
		List<UserVo> matchingList = matchingDao.getMatchingList( userVo );
		
		return matchingList;
	}

}
