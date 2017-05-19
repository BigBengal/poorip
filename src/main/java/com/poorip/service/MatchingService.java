package com.poorip.service;

import java.text.SimpleDateFormat;
import java.time.Month;
import java.time.Year;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.CityDao;
import com.poorip.repository.MatchingDao;
import com.poorip.repository.UserDao;
import com.poorip.vo.CityVo;
import com.poorip.vo.ScrapCityVo;
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
		List<UserVo> matchingList = matchingDao.getMatchingList();
		
		return matchingList;
	}

	public Map<String, Object> getMatchingScore(
				UserVo target, List<UserVo> matchingList,
				List<ScrapCityVo> usersScrapCityInfo, List<CityVo> city, List<ScrapCityVo> getUsersScrapInfoByCtySeq) {
		//-----------------카테고리별 배열을 선언------------------------------------------------
		int[] surveyScoreList = new int[matchingList.size()];
		int[] foodScoreList = new int[matchingList.size()];
		int[] sightScoreList = new int[matchingList.size()];
		int[] activityScoreList = new int[matchingList.size()];
		int[] luxuryScoreList = new int[matchingList.size()];
		int[] dateScoreList = new int[matchingList.size()];
		int[] matchingScoreList = new int[matchingList.size()];
		
		for(int i=0; i<matchingList.size(); i++) {
			int foodHit = matchingList.get(i).getFoodHit();
			int sightHit = matchingList.get(i).getSightHit();
			int activityHit = matchingList.get(i).getActivityHit();
			int luxuryHit = matchingList.get(i).getLuxuryHit();
			int sumHit = foodHit + sightHit + activityHit;
			
			int targetFoodHit = target.getFoodHit();
			int targetSightHit = target.getSightHit();
			int targetActivityHit = target.getActivityHit();
			int targetLuxuryHit = target.getLuxuryHit();
			int targetSumHit = targetFoodHit + targetSightHit + targetActivityHit;
			
			//-------------- 설문조사 점수 계산 --------------------------------------------
			int surveyScore = 0;
			int usrSeq_survey = matchingList.get(i).getUsrSeq(); 
			String q1 = matchingList.get(i).getUsrPref1();
			String q2 = matchingList.get(i).getUsrPref2();
			String q3 = matchingList.get(i).getUsrPref3();
			String q4 = matchingList.get(i).getUsrPref4();
			String q5 = matchingList.get(i).getUsrPref5();
			
			UserVo useriSurvey = new UserVo();
			useriSurvey.setUsrSeq( usrSeq_survey );
			useriSurvey.setUsrPref1( q1 );
			useriSurvey.setUsrPref2( q2 );
			useriSurvey.setUsrPref3( q3 );
			useriSurvey.setUsrPref4( q4 );
			useriSurvey.setUsrPref5( q5 );
			
			if(target.getUsrPref1().equals(useriSurvey.getUsrPref1()))
				surveyScore = surveyScore + 20; 
			if(target.getUsrPref2().equals(useriSurvey.getUsrPref2()))
				surveyScore = surveyScore + 20; 
			if(target.getUsrPref3().equals(useriSurvey.getUsrPref3()))
				surveyScore = surveyScore + 20; 
			if(target.getUsrPref4().equals(useriSurvey.getUsrPref4()))
				surveyScore = surveyScore + 20; 
			if(target.getUsrPref5().equals(useriSurvey.getUsrPref5()))
				surveyScore = surveyScore + 20;
			
			surveyScoreList[i] = surveyScore;
			
			//---------------------------------음식점 점수 계산-----------------------------------------------------			
			int foodScore = (1-(Math.abs(foodHit/sumHit)-Math.abs(targetFoodHit/targetSumHit))) * 100;
			foodScoreList[i] = foodScore;

			//---------------------------------관광지 점수 계산-----------------------------------------------------
			int sightScore = (1-(Math.abs(sightHit/sumHit))-(Math.abs(targetSightHit/targetSumHit))) * 100;
			sightScoreList[i] = sightScore;

			//--------------------------------activity 점수 계산-----------------------------------------------------
			int activityScore = (1-(Math.abs(activityHit/sumHit))-(Math.abs(targetActivityHit/targetSumHit))) * 100;
			activityScoreList[i] = activityScore;

			//---------------------------------럭셔리 점수 계산-----------------------------------------------------
			int luxuryScore = (1-(Math.abs(luxuryHit/foodHit))-(Math.abs(targetLuxuryHit/targetFoodHit))) * 100;
			luxuryScoreList[i] = luxuryScore;
			
			//----------------------------------다른 사용사와 겹치는 일정 계산-----------------------------------------------------
			for(int x=0; x<city.size(); x++) {  // 모든 도시의 정보
				int ctySeq = city.get(x).getCtySeq();
				int usrSeq = target.getUsrSeq();
				List<ScrapCityVo> scrapCityVo = getUsersScrapInfoByCtySeq( ctySeq );   // 모든 사용자의 해당 도시의 스크랩 정보 
				ScrapCityVo targetScrapCityInfo = getScrapInfo( usrSeq, ctySeq );	   // 나의 해당 도시의 스크랩 정보
				if(scrapCityVo.get(x).getUsrSeq() != target.getUsrSeq()){			   // 나를 제외한 사용자들 중
					if(scrapCityVo.get(x).getCtySeq() == targetScrapCityInfo.getCtySeq()){   // 만약 나와 도시Seq가 같다면
						// 출발 날짜와 도착날짜를 비교할 것이다.
						String targetDateFrom = targetScrapCityInfo.getDateFrom();
						String usersDateFrom = scrapCityVo.get(x).getDateFrom();
						String targetDateTo = targetScrapCityInfo.getDateTo();
						String usersDateTo = scrapCityVo.get(x).getDateTo();
						
//						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//						
//						
//						Date targetFrom = format.parse(targetDateFrom);
//						Date targetTo = format.parse(targetDateTo);
//					    Date usersFrom = format.parse(usersDateFrom);
//					    Date usersTo = format.parse(usersDateTo);
					    
						
					}
				}
			}
			
			//---------------------------------총 매칭점수 계산-----------------------------------------------------
			int matcingScore = surveyScore + foodScore + sightScore + activityScore +luxuryScore;
			matchingScoreList[i] = matcingScore;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("", surveyScoreList);
		map.put("", foodScoreList);
		map.put("", sightScoreList);
		map.put("", activityScoreList);
		map.put("", luxuryScoreList);
		map.put("", dateScoreList);
		
		return map;
	}

	public UserVo getUserInfo(int usrSeq) {
		return matchingDao.getUserInfo( usrSeq );
	}

	public ScrapCityVo getScrapInfo(int usrSeq, int ctySeq) {
		return matchingDao.getScrapInfo( usrSeq, ctySeq );
	}

	public List<ScrapCityVo> getUsersScrapInfo(UserVo userVo) {
		// 회원 정보가 없으면 Null
		if ( isExistUser(userVo) == false){
			return null;
		}
		List<ScrapCityVo> scrapCityList = matchingDao.getUsersScrapCityInfo();
		
		return scrapCityList;
	}

	public List<CityVo> getCity() {
		return matchingDao.getCity();
	}

	public List<ScrapCityVo> getUsersScrapInfoByCtySeq(int ctySeq) {
		return matchingDao.getUsersScrapInfoByCtySeq( ctySeq );
	}

}
