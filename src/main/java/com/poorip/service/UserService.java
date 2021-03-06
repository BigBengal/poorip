package com.poorip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.TravelInfoDao;
import com.poorip.repository.UserDao;
import com.poorip.vo.UserVo;

@Service
public class UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	TravelInfoDao travelInfoDao;
	
	// 유저가 가입했는 지 확인
	public boolean isExistUser(UserVo userVo){
		return userDao.isExist(userVo);
	}

	// 유저가 가입했는 지 확인
	public boolean isExistNick(UserVo userVo){
		return userDao.isNick(userVo);
	}
	
	// 닉네임으로 USER SEQ 가져오기 가 가입했는 지 확인
	public int getSeqByNick(String usrNick){
		return userDao.getSeqByNick(usrNick);
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
		// 성별 길이 처리
		String gender = userVo.getUsrGender();
		if ("male".equals(gender))
			userVo.setUsrGender("M");
		else if ("female".equals(gender))
			userVo.setUsrGender("F");
		
		
		// 언어 설정
		String locale = userVo.getUsrLang();
		if (locale != null){
			if (locale.indexOf("KR") >= 0 ){
				userVo.setUsrLang("KOR");
			} else {
				userVo.setUsrLang("ENG");
			}
		}
		
		//생일 설정
		String birthday = userVo.getUsrBd();
		if(birthday != null && birthday.isEmpty() == false){
			userVo.setUsrBd("STR_TO_DATE('"+birthday+"','%m/%d/%Y')");
			
		} else 
			userVo.setUsrBd("null");
		
		return userDao.join(userVo);
	}
	
	// 유저 로그인 시 로그인 시각 저장
	public boolean UpdateLoginTime(UserVo userVo){
		return userDao.updateLogin(userVo);
	}

	// 유저 필수 정보 수정
	public boolean UpdateRequiredInfo(UserVo userVo) {
		boolean isOk = true;
		/////////////////
		// 필수정보
		/////////////////
		
		// 언어 수정
		if( userVo.getUsrLang() != null)
			isOk = UpdateLang(userVo);
		
		// 성별 수정 (페북 연동은 성별이 필수항목)
		//if( userVo.getUsrGender() != null)
		//	userService.UpdateGender(userVo);
		
		// 닉네임 수정
		if( userVo.getUsrNick() != null)
			isOk = UpdateNick(userVo);
		// 생년월일 수정 (저장 형식은  년/월/일 )
		if( userVo.getUsrBd() != null)
			isOk = UpdateBirthday(userVo);
		
		return isOk;
	}
	
	
	// 유저 옵션 정보 수정
	public boolean UpdateOptionInfo(UserVo userVo) {
		boolean isOk = true;
		/////////////////
		// 옵션 정보
		/////////////////
		
		// 취향 수정
		if( userVo.getUsrPref1() != null || userVo.getUsrPref2() != null || userVo.getUsrPref3() != null || userVo.getUsrPref4() != null || userVo.getUsrPref5() != null )
			isOk = UpdatePrefer(userVo);
		
		// 프로필, 해쉬태그 수정
		if( userVo.getUsrInfo() != null || userVo.getUsrHashtag() != null)
			isOk = UpdateInfoHash(userVo);
		
		// 노티 수정
		if( userVo.getUsrNoti() == null)
			userVo.setUsrNoti("N");
			isOk = UpdateNoti(userVo);
		return isOk;
	}
	
	// 유저 언어 수정 
	public boolean UpdateLang(UserVo userVo) {
		return userDao.updateLang(userVo);
	}

	// 유저 성별 저장
	public boolean UpdateGender(UserVo userVo) {
		return userDao.updateGender(userVo);
	}

	// 유저 닉네임 저장
	public boolean UpdateNick(UserVo userVo) {
		return userDao.updateNick(userVo);
		
	}

	// 유저 생년월일 (저장 형식은 년/월/일)
	public boolean UpdateBirthday(UserVo userVo) {
		//생일 설정
		String birthday = userVo.getUsrBd();
		if(birthday != null && birthday.isEmpty() == false){
			userVo.setUsrBd("STR_TO_DATE('"+birthday+"','%Y/%m/%d/')");
		} else 
			userVo.setUsrBd("null");
		return userDao.updateBirthday(userVo);
		
	}

	// 유저 취향 정보 저장
	public boolean UpdatePrefer(UserVo userVo) {
		return userDao.updatePrefer(userVo);
	}
	
	// 유저 프로필, 해쉬태그 추가 정보 저장
	public boolean UpdateInfoHash(UserVo userVo) {
		return userDao.updateInfoHash(userVo);
	}
	
	// 유저 노티 알람 정보 저장
	public boolean UpdateNoti(UserVo userVo) {
		return userDao.updateNoti(userVo);
	}

	// 유저 블랙리스트 정보 저장
	public boolean UpdateBlack(UserVo userVo) {
		return userDao.updateBlack(userVo);
	}
	
	// 전체 유저 가져오기
	public List<UserVo> SearchPersonList(){
		return userDao.list();
	}
	
	// 유저 Seq로 유저 정보 가져오기
	public UserVo SearchPersonListbySeq(int usrSeq){
		return userDao.listByUsrSeq(usrSeq);
	}
	
	// 매칭알고리즘을 위한 update hit
	public boolean updateHit(int trvSeq1, int usrSeq, String luxuryY) {
		int catSeq = travelInfoDao.getCatSeq( trvSeq1 );
		if( catSeq == 2 ) {
			if(catSeq == 2 && luxuryY.equals( "Y" )) {
				boolean LuxuryHit = userDao.updateLuxuryHit( trvSeq1, usrSeq );
				boolean FoodHit = userDao.updateFoodHit( trvSeq1, usrSeq );
				return LuxuryHit && FoodHit;
			}
			return userDao.updateFoodHit( trvSeq1, usrSeq );
		}
	
		if( catSeq == 3 )
			return userDao.updateSightHit( trvSeq1, usrSeq );
		
		if( catSeq == 4 )
			return userDao.updateActivityHit( trvSeq1, usrSeq );
		
		return true;
	}

	public boolean updateScrapHit(int trvSeq1, int usrSeq, String luxuryY) {
		int catSeq = travelInfoDao.getCatSeq( trvSeq1 );
		if( catSeq == 2 ) {
			if(catSeq == 2 && luxuryY.equals( "Y" )) {
				boolean ScrapLuxuryHit = userDao.updateScrapLuxuryHit( trvSeq1, usrSeq );
				boolean ScrapFoodHit = userDao.updateScrapFoodHit( trvSeq1, usrSeq );
				return ScrapLuxuryHit && ScrapFoodHit;
			}
			return userDao.updateScrapFoodHit( trvSeq1, usrSeq );
		}
	
		if( catSeq == 3 )
			return userDao.updateScrapSightHit( trvSeq1, usrSeq );
		
		if( catSeq == 4 )
			return userDao.updateScrapActivityHit( trvSeq1, usrSeq );
		
		return true;	
	}

	public boolean updateDeleteScrapHit(int trvSeq1, int usrSeq, String luxuryY) {
		int catSeq = travelInfoDao.getCatSeq( trvSeq1 );
		if( catSeq == 2 ) {
			if(catSeq == 2 && luxuryY.equals( "Y" )) {
				boolean DeleteScrapLuxuryHit = userDao.updateDeleteScrapLuxuryHit( trvSeq1, usrSeq );
				boolean DeleteScrapFoodHit = userDao.updateDeleteScrapFoodHit( trvSeq1, usrSeq );
				return DeleteScrapLuxuryHit && DeleteScrapFoodHit;
			}
			return userDao.updateDeleteScrapFoodHit( trvSeq1, usrSeq );
		}
	
		if( catSeq == 3 )
			return userDao.updateDeleteScrapSightHit( trvSeq1, usrSeq );
		
		if( catSeq == 4 )
			return userDao.updateDeleteScrapActivityHit( trvSeq1, usrSeq );
		
		return true;
		
	}
	
}
