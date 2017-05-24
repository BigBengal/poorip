package com.poorip.service;

import static org.mockito.Matchers.same;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.MatchingDao;
import com.poorip.repository.ScrapCityDao;
import com.poorip.repository.UserDao;
import com.poorip.vo.ScrapCityVo;
import com.poorip.vo.UserVo;

@Service
public class MatchingService {

	@Autowired
	private MatchingDao matchingDao;
	@Autowired
	private UserDao userDao;

	// 내가 스크랩한 시티 리스트 가져오기
	@Autowired
	private ScrapCityDao scrapCityDao;

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
		List<UserVo> matchingList = matchingDao.getMatchingList(userVo);

		return matchingList;
	}

	public List<UserVo> getSamePlanMember(
			UserVo myInfo,		// 내정보 
			List<ScrapCityVo> myCityList) throws Exception {

		List<UserVo> samePlanMember = new ArrayList<UserVo>();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		int overlapDaysScore = 0;
		int myusrSeq = myInfo.getUsrSeq();

		// 내 스크랩 도시 정보
		for (int x = 1; x < myCityList.size(); x++) {
			String targetDateFrom = myCityList.get(x).getDateFrom();
			String targetDateTo = myCityList.get(x).getDateTo();
			Date targetFrom = format.parse(targetDateFrom);
			Date targetTo = format.parse(targetDateTo);

			int ctySeq = myCityList.get(x).getCtySeq();
			List<ScrapCityVo> scrapCityVo = getUsersScrapInfoByCtySeq(ctySeq, myusrSeq);
			// 내가 스크랩한 도시를 같이 스크랩 한 사용자 스크랩 정보
			for (int y = 0; y < scrapCityVo.size(); y++) {
				if (scrapCityVo.get(y) != null) { // NULL 경우가 있음
					int matchingUsrSeq = scrapCityVo.get(y).getUsrSeq();

					String usersDateFrom = scrapCityVo.get(y).getDateFrom();
					String usersDateTo = scrapCityVo.get(y).getDateTo();
					Date usersFrom = format.parse(usersDateFrom);
					Date usersTo = format.parse(usersDateTo);

					Date maxFrom = new Date();
					Date minTo = new Date();

					// 앞에 변수가 크면 1, 작으면 -1, 같으면 0
					int fromResult = targetFrom.compareTo(usersFrom);
					int toResult = targetTo.compareTo(usersTo);

					if (fromResult == 1) {
						maxFrom = targetFrom;
					} else if (fromResult == -1) {
						maxFrom = usersFrom;
					} else {
						maxFrom = targetFrom;
					}

					if (toResult == 1) {
						minTo = usersTo;
					} else if (toResult == -1) {
						minTo = targetTo;
					} else {
						minTo = targetTo;
					}

					long diff = Math.abs(minTo.getTime() - maxFrom.getTime());
					long overlapDays = diff / (24 * 60 * 60 * 1000);
					overlapDaysScore = (int) (overlapDays ^ 2);

					// dateScore.setUsrSeq(scrapCityVo.get(y).getUsrSeq());
					// dateScore.setDateScore(overlapDaysScore);

					boolean isExistUsr = false;
					int listSize = samePlanMember.size();
					// 유저가 이미 리스트에 추가되어 있으면 값을 더해주고
					for (int z = 0; z < listSize; z++) {
						if (matchingUsrSeq == samePlanMember.get(z).getUsrSeq()) {
							int originalScore = samePlanMember.get(z).getDateScore();
							samePlanMember.get(z).setDateScore(originalScore + overlapDaysScore);
							isExistUsr = true;
						}
					}
					// 리스트에 없으면 리스트에 추가
					if (!isExistUsr) {
						UserVo dateScore = new UserVo(); // 유저 정보 저장용
						dateScore.setUsrSeq(matchingUsrSeq);
						dateScore.setDateScore(overlapDaysScore);
					}

				} // NULL 경우가 있음

			} // for(int y=0; y < scrapCityVo.size(); y++){

		} // for(int x=1; x < myCityList.size(); x++)

		return addUsrOtherInfo(samePlanMember);
	}


	public List<UserVo> getMatchingScore (
			UserVo myInfo,					// 내정보 
			List<ScrapCityVo> myCityList,	// 내 스크랩정보
			List<UserVo> matchingList,		// 나를 뺀 전체 유저 리스트
			List<UserVo> dateScoreList)		// 일정 매칭 스코어 리스트
					throws Exception{

		//-----------------카테고리별 배열을 선언------------------------------------------------
		// 이건 내꺼
		int myFoodHit = myInfo.getFoodHit();
		int mySightHit = myInfo.getSightHit();
		int myActivityHit = myInfo.getActivityHit();
		int myLuxuryHit = myInfo.getLuxuryHit();
		int mySumHit = myFoodHit + mySightHit + myActivityHit;

		List<UserVo> matchingScoreList = new ArrayList<UserVo>();

		for(int i=0; i<matchingList.size(); i++) {
			if( matchingList.get(i).getUsrSeq() != myInfo.getUsrSeq() ) {
				// 이거 사람들꺼
				int foodHit = matchingList.get(i).getFoodHit();
				int sightHit = matchingList.get(i).getSightHit();
				int activityHit = matchingList.get(i).getActivityHit();
				int luxuryHit = matchingList.get(i).getLuxuryHit();
				int sumHit = foodHit + sightHit + activityHit;

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
					userScore.setUsrSeq( usrSeq_survey );
					userScore.setUsrPref1( q1 );
					userScore.setUsrPref2( q2 );
					userScore.setUsrPref3( q3 );
					userScore.setUsrPref4( q4 );
					userScore.setUsrPref5( q5 );

					if(myInfo.getUsrPref1().equals(userScore.getUsrPref1()))
						surveyScore = surveyScore + 20; 
					if(myInfo.getUsrPref2().equals(userScore.getUsrPref2()))
						surveyScore = surveyScore + 20; 
					if(myInfo.getUsrPref3().equals(userScore.getUsrPref3()))
						surveyScore = surveyScore + 20; 
					if(myInfo.getUsrPref4().equals(userScore.getUsrPref4()))
						surveyScore = surveyScore + 20; 
					if(myInfo.getUsrPref5().equals(userScore.getUsrPref5()))
						surveyScore = surveyScore + 20;
					userScore.setUseriSurveyScore(surveyScore);
				} else {
					userScore.setUsrSeq( usrSeq_survey );
					userScore.setUseriSurveyScore(surveyScore);
				}
				int foodScore = 0;
				int sightScore = 0;
				int activityScore = 0;
				int luxuryScore = 0;

				if(foodHit != 0 && sightHit != 0 && activityHit != 0 && luxuryHit != 0 && sumHit != 0 
						&& myFoodHit != 0 && mySightHit != 0 && myActivityHit != 0  && myLuxuryHit != 0 && mySumHit != 0){
					
					//---------------------------------음식점 점수 계산-----------------------------------------------------			
					foodScore = (Math.abs((Math.abs(sumHit/foodHit))-(Math.abs(mySumHit/myFoodHit)))) * 100;
					userScore.setFoodScore(foodScore);

					//---------------------------------관광지 점수 계산-----------------------------------------------------
					sightScore = (Math.abs((Math.abs(sumHit/sightHit))-(Math.abs(mySumHit/mySightHit)))) * 100;
					userScore.setSightHit(sightScore);

					//--------------------------------activity 점수 계산-----------------------------------------------------
					activityScore = (Math.abs((Math.abs(sumHit/activityHit))-(Math.abs(mySumHit/myActivityHit/mySumHit)))) * 100;
					userScore.setActivityScore(activityScore);

					//---------------------------------럭셔리 점수 계산-----------------------------------------------------
					luxuryScore = (Math.abs((Math.abs(foodHit/luxuryHit))-(Math.abs(myFoodHit/myLuxuryHit)))) * 100;
					userScore.setLuxuryScore(luxuryScore);

				} else {
					foodScore = 0;
					sightScore = 0;
					activityScore = 0;
					luxuryScore = 0;
				}

				//---------------------------------총 매칭점수 계산-----------------------------------------------------
				int matcingScore = surveyScore + foodScore + sightScore + activityScore +luxuryScore;
				userScore.setMatchingScore(matcingScore);
				matchingScoreList.add(userScore);
			}
		}

		//----------------------------------다른 사용사와 겹치는 일정 계산-----------------------------------------------------
		// 일정 점수 추가
		for(int i=0; i<matchingScoreList.size();i++){

			for(int j=0; j<dateScoreList.size();j++){
				// usrSeq가 일치하면 
				if ( matchingScoreList.get(i).equals(dateScoreList.get(j)) ){
					// 기존 리스트에 일정 매칭 점수 추가
					int dateScore = dateScoreList.get(j).getDateScore();
					matchingScoreList.get(i).setDateScore(dateScore);

					// 기존 합계 점수에 일정 매칭 점수 추가
					int matchingScore = matchingScoreList.get(i).getDateScore();
					matchingScore += dateScore;
					matchingScoreList.get(i).setMatchingScore(matchingScore);

				}
			}
		}

		return getTopMatchingMember( matchingScoreList );
	}

	// List 정렬
	private List<UserVo> getTopMatchingMember(List<UserVo> matchingScoreList) {
		// 내림차순 정렬
		Descending descending = new Descending();
		int mininum = matchingScoreList.size();
		mininum = Math.min(mininum, 5);
		List<UserVo> top5 = matchingScoreList.subList(0, mininum);
		Collections.sort(top5, descending);
		return addUsrOtherInfo( top5 );
	}

	public List<UserVo> addUsrOtherInfo(List<UserVo> samePlanMember) {
		double memberScoreTotal = 0;
		double memberFoodTotal = 0;
		double memberSightTotal = 0;
		double memberActivityTotal = 0;
		double memberLuxuryTotal = 0;
		
		for(int i=0; i<samePlanMember.size(); i++) {
			memberScoreTotal += samePlanMember.get(i).getMatchingScore();
			memberFoodTotal += samePlanMember.get(i).getFoodScore();
			memberSightTotal += samePlanMember.get(i).getSightScore();
			memberActivityTotal += samePlanMember.get(i).getActivityScore();
			memberLuxuryTotal += samePlanMember.get(i).getLuxuryScore();
		}
		
		for(int j=0; j<samePlanMember.size(); j++) {
			double matchingScore = samePlanMember.get(j).getMatchingScore();
			double foodScore = samePlanMember.get(j).getFoodScore();
			double sightScore = samePlanMember.get(j).getSightScore();
			double activityScore = samePlanMember.get(j).getActivityScore();
			double luxuryScre  = samePlanMember.get(j).getLuxuryScore();
			
			double divScoretoTotal = matchingScore/memberScoreTotal;
			double divFoodtoTotal = foodScore/memberFoodTotal;
			double divSighttoTotal = sightScore/memberSightTotal;
			double divActivitytoTotal = activityScore/memberActivityTotal;
			double divLuxurytoTotal = luxuryScre/memberLuxuryTotal;
			
			int matchingPercentage = (int) (divScoretoTotal * 100);
			int foodPercentage = (int) (divFoodtoTotal * 100);
			int sightPercentage = (int) (divSighttoTotal * 100);
			int activityPercentage = (int) (divActivitytoTotal * 100);
			int luxuryPercentage = (int) (divLuxurytoTotal * 100);
			
			samePlanMember.get(j).setMatchingScore(matchingPercentage);
			samePlanMember.get(j).setFoodScore(foodPercentage);
			samePlanMember.get(j).setSightScore(sightPercentage);
			samePlanMember.get(j).setActivityScore(activityPercentage);
			samePlanMember.get(j).setLuxuryScore(luxuryPercentage);
		}
		return matchingDao.addUsrOtherInfo( samePlanMember );
	}

	public UserVo getUserInfo(int usrSeq) {
		return matchingDao.getUserInfo( usrSeq );
	}

	// 해당 유저의  스크랩 도시 정보
	public ScrapCityVo getScrapInfo(int usrSeq, int ctySeq) {
		return matchingDao.getScrapInfo( usrSeq, ctySeq );
	}

	// 나를 뺀거 스크랩 도시 정보
	public List<ScrapCityVo> getUsersScrapInfoByCtySeq(int ctySeq, int usrSeq) {
		return matchingDao.getUsersScrapInfoByCtySeq( ctySeq,usrSeq );
	}


	public List<ScrapCityVo> getMyCityList( int usrSeq) {
		return scrapCityDao.getMyCityList(usrSeq);
	}



}
