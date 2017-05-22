package com.poorip.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	// 내림차순
	public class Descending implements Comparator<UserVo> {

		@Override
		public int compare(UserVo o1, UserVo o2) {

			if(o2.getMatchingScore() < o1.getMatchingScore() )
				return -1;
			else if(o2.getMatchingScore() > o1.getMatchingScore())
				return 1;
			else
				return 0;
		}

	}

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

	public List<UserVo> getMatchingScore (
			UserVo target, List<UserVo> matchingList,
			List<ScrapCityVo> usersScrapCityInfo, List<CityVo> city, List<ScrapCityVo> getUsersScrapInfoByCtySeq)
					throws Exception{

		//-----------------카테고리별 배열을 선언------------------------------------------------
		// 이건 내꺼
		int targetFoodHit = target.getFoodHit();
		int targetSightHit = target.getSightHit();
		int targetActivityHit = target.getActivityHit();
		int targetLuxuryHit = target.getLuxuryHit();
		int targetSumHit = targetFoodHit + targetSightHit + targetActivityHit;
		
		System.out.println(targetSumHit);
		List<UserVo> matchingScoreList = new ArrayList<UserVo>();

		for(int i=0; i<matchingList.size(); i++) {
			if( matchingList.get(i).getUsrSeq() != target.getUsrSeq() ) {
				// 이거 사람들꺼
				int foodHit = matchingList.get(i).getFoodHit();
				int sightHit = matchingList.get(i).getSightHit();
				int activityHit = matchingList.get(i).getActivityHit();
				int luxuryHit = matchingList.get(i).getLuxuryHit();
				int sumHit = foodHit + sightHit + activityHit;
				System.out.println("aaaaaaaaaaaaaaaa"+sumHit);

				//-------------- 설문조사 점수 계산 --------------------------------------------
				UserVo userScore = new UserVo();
				int surveyScore = 0;
				int usrSeq_survey = matchingList.get(i).getUsrSeq();
				if( matchingList.get(i).getUsrPref1() != null && matchingList.get(i).getUsrPref2() != null 
								&& matchingList.get(i).getUsrPref3() != null && matchingList.get(i).getUsrPref4() != null 
								&& matchingList.get(i).getUsrPref5() != null ) {			
				String q1 = matchingList.get(i).getUsrPref1();
				String q2 = matchingList.get(i).getUsrPref2();
				String q3 = matchingList.get(i).getUsrPref3();
				String q4 = matchingList.get(i).getUsrPref4();
				String q5 = matchingList.get(i).getUsrPref5();
				System.out.println("wwwwwwwwwww"+q1 + q2 + q3 + q4 + q5);
					userScore.setUsrSeq( usrSeq_survey );
					userScore.setUsrPref1( q1 );
					userScore.setUsrPref2( q2 );
					userScore.setUsrPref3( q3 );
					userScore.setUsrPref4( q4 );
					userScore.setUsrPref5( q5 );

					if(target.getUsrPref1().equals(userScore.getUsrPref1()))
						surveyScore = surveyScore + 20; 
					if(target.getUsrPref2().equals(userScore.getUsrPref2()))
						surveyScore = surveyScore + 20; 
					if(target.getUsrPref3().equals(userScore.getUsrPref3()))
						surveyScore = surveyScore + 20; 
					if(target.getUsrPref4().equals(userScore.getUsrPref4()))
						surveyScore = surveyScore + 20; 
					if(target.getUsrPref5().equals(userScore.getUsrPref5()))
						surveyScore = surveyScore + 20;
					userScore.setUseriSurveyScore(surveyScore);
					System.out.println("dfsdfgsdgsdfg"+surveyScore);
				} else
					userScore.setUsrSeq( usrSeq_survey );
					userScore.setUseriSurveyScore(surveyScore);
				
				int foodScore = 0;
				int sightScore = 0;
				int activityScore = 0;
				int luxuryScore = 0;
				
				if(foodHit != 0 && sightHit != 0 && activityHit != 0 && luxuryHit != 0 && sumHit != 0 
						&& targetFoodHit != 0 && targetSightHit != 0 && targetActivityHit != 0  && targetLuxuryHit != 0 && targetSumHit != 0){

				//---------------------------------음식점 점수 계산-----------------------------------------------------			
				foodScore = (1-(Math.abs(foodHit/sumHit)-Math.abs(targetFoodHit/targetSumHit))) * 100;
				userScore.setFoodScore(foodScore);

				//---------------------------------관광지 점수 계산-----------------------------------------------------
				sightScore = (1-(Math.abs(sightHit/sumHit))-(Math.abs(targetSightHit/targetSumHit))) * 100;
				userScore.setSightHit(sightScore);

				//--------------------------------activity 점수 계산-----------------------------------------------------
				activityScore = (1-(Math.abs(activityHit/sumHit))-(Math.abs(targetActivityHit/targetSumHit))) * 100;
				userScore.setActivityScore(activityScore);

				//---------------------------------럭셔리 점수 계산-----------------------------------------------------
				luxuryScore = (1-(Math.abs(luxuryHit/foodHit))-(Math.abs(targetLuxuryHit/targetFoodHit))) * 100;
				userScore.setLuxuryScore(luxuryScore);
				
				} else {
					foodScore = 0;
					sightScore = 0;
					activityScore = 0;
					luxuryScore = 0;
				}
					
				//----------------------------------다른 사용사와 겹치는 일정 계산-----------------------------------------------------
				int overlapDaysScore = 0;
				for(int x=1; x<city.size(); x++) {  // 모든 도시의 정보
					int ctySeq = city.get(x).getCtySeq();
					int usrSeq = target.getUsrSeq();
					List<ScrapCityVo> scrapCityVo = getUsersScrapInfoByCtySeq( ctySeq, usrSeq );   // 모든 사용자의 해당 도시의 스크랩 정보 
					if( scrapCityVo != null ) {
						ScrapCityVo targetScrapCityInfo = getScrapInfo( usrSeq, ctySeq );	   // 나의 해당 도시의 스크랩 정보
						if(targetScrapCityInfo != null) {
							for(int y=0; y < scrapCityVo.size(); y++){
								if(scrapCityVo.get(y).getCtySeq() == targetScrapCityInfo.getCtySeq()){
									// 출발 날짜와 도착날짜를 비교할 것이다.
									if(scrapCityVo.get(y).getDateFrom() != null && scrapCityVo.get(y).getDateTo() != null) {
										String targetDateFrom = targetScrapCityInfo.getDateFrom();
										String usersDateFrom = scrapCityVo.get(y).getDateFrom();
										String targetDateTo = targetScrapCityInfo.getDateTo();
										String usersDateTo = scrapCityVo.get(y).getDateTo();

										Calendar calendar = Calendar.getInstance();
										SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

										Date targetFrom = format.parse(targetDateFrom);
										Date targetTo = format.parse(targetDateTo);
										Date usersFrom = format.parse(usersDateFrom);
										Date usersTo = format.parse(usersDateTo);

										Date maxFrom = new Date();
										Date minTo = new Date();

										//앞에 변수가 크면 1, 작으면 -1, 같으면 0
										int fromResult = targetFrom.compareTo(usersFrom);
										int toResult = targetTo.compareTo(usersTo);

										if( fromResult == 1 ) {
											maxFrom = targetFrom;
										} else if ( fromResult == -1 ) {
											maxFrom = usersFrom;
										} else {
											maxFrom = targetFrom;
										}

										if( toResult == 1 ) {
											minTo = usersTo;
										} else if ( toResult == -1 ) {
											minTo = targetTo;
										} else {
											minTo = targetTo;
										}

										long diff = minTo.getTime() - maxFrom.getTime();
										long overlapDays = diff / (24 * 60 * 60 * 1000);
										overlapDaysScore = (int) (overlapDays^2);
										userScore.setDateScore(overlapDaysScore);
									} else
										userScore.setDateScore(overlapDaysScore);

								} else
									userScore.setDateScore(overlapDaysScore);
							}
							
						} else
							userScore.setDateScore(overlapDaysScore);
						
					} else
						userScore.setDateScore(overlapDaysScore);
				}

				//---------------------------------총 매칭점수 계산-----------------------------------------------------
				int matcingScore = surveyScore + foodScore + sightScore + activityScore +luxuryScore + overlapDaysScore;
				userScore.setMatchingScore(matcingScore);
				matchingScoreList.add(userScore);
			}
		}

		return getTopMatchingMember( matchingScoreList );

	}

	// List 정렬
	private List<UserVo> getTopMatchingMember(List<UserVo> matchingScoreList) {
		// 내림차순 정렬
		Descending descending = new Descending();
		List<UserVo> top5 = matchingScoreList.subList(0, 5);
		Collections.sort(top5, descending);
		System.out.println(top5.size());
		return getTop5MemberInfo( top5 );
	}

	private List<UserVo> getTop5MemberInfo(List<UserVo> top5) {
		return matchingDao.getTop5Info( top5 );
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

	public List<ScrapCityVo> getUsersScrapInfoByCtySeq(int ctySeq, int usrSeq) {
		return matchingDao.getUsersScrapInfoByCtySeq( ctySeq,usrSeq );
	}

}
