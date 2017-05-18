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

	public String getusrPrefValue( int usrSeq ) {
		String surveyYN = matchingDao.getusrPrefValue( usrSeq );
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

	public int getSurveyScore(List<UserVo> matchingList) {
		for(int i=0; i<matchingList.size(); i++) {
			for(int j=0; j<matchingList.size(); j++) {
				String q1 = matchingList.get(j).getUsrPref1();
				String q2 = matchingList.get(j).getUsrPref2();
				String q3 = matchingList.get(j).getUsrPref3();
				String q4 = matchingList.get(j).getUsrPref4();
				String q5 = matchingList.get(j).getUsrPref5();
				UserVo usrQj = new UserVo();
				usrQj.setUsrPref1(q1);
				usrQj.setUsrPref2(q2);
				usrQj.setUsrPref3(q3);
				usrQj.setUsrPref4(q4);
				usrQj.setUsrPref5(q5);
			}
		
		}
		return 0;
	}

}
