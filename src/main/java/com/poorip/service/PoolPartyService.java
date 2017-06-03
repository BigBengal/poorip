package com.poorip.service;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poorip.repository.PoolLikeDao;
import com.poorip.repository.PoolMemberDao;
import com.poorip.repository.PoolPartyDao;
import com.poorip.vo.CityVo;
import com.poorip.vo.PoolLikeVo;
import com.poorip.vo.PoolMemberVo;
import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoVo;
import com.poorip.vo.UserVo;
import com.poorip.web.util.WebUtil;

@Service
public class PoolPartyService {
	
	private static final Logger logger = LoggerFactory.getLogger(PoolPartyService.class);
	
	private static final String defaultPoolpartName = "님의 PoolParty";
	private static final String defaultPublicYn = "Y";
	private static final String defaultPoolpartImage = "/assets/images/pool-party-default.jpg";
	private static final String POOLPARTY_SAVE_PATH = "/pool/";
	
	@Autowired
	private PoolPartyDao poolPartyDao;

	@Autowired
	private PoolMemberDao poolMemberDao;
	
	@Autowired
	private PoolLikeDao poolLikeDao;
	
	// ??
	public List<TravelInfoVo> getPoolKwd(String keyword) {
		List<TravelInfoVo> travelInfoList = poolPartyDao.getPoolKwd( keyword );
		logger.info("travelInfoList:"+travelInfoList.toString());
		return travelInfoList;
	}
	
	// 도시 정보 가져오기
	public List<CityVo> getCityNames(String ctyName) {
		return poolPartyDao.getCityNames(ctyName);
	}
	
	// 도시이름,날짜로 풀파티 검색 리스트 가져오기
	public List<PoolPartyVo> getPoolList(PoolPartyVo poolPartyVo) {
		List<PoolPartyVo> poolList = poolPartyDao.getPoolList(poolPartyVo);
		return poolList;
	}
	
	// 인기 TOP 10 풀 리스트 (조회수 기준)
	public List<PoolPartyVo> getPoolTop10List() {
		List<PoolPartyVo> poolList = poolPartyDao.selectTop10();
		return poolList;
	}

	
	// 1개의 해당 풀파티 정보 가져오기
	public PoolPartyVo getPoolInfo(int poolSeq){
		return poolPartyDao.select(poolSeq); 
	}
	
	// 해당 풀파티의 맴버 리스트 가져오기
	public List<PoolMemberVo> getPoolMembers(int poolSeq){
		return poolMemberDao.getListbyPoolSeq(poolSeq);
	}
	
	// 내가 가입한 풀파티 정보 리스트 가져오기
	public List<PoolPartyVo> getMyPoolList(int usrSeq){
		return poolPartyDao.getMyPoolList(usrSeq);
	}
	
	// 내가 가입 "대기 중"인 풀파티 정보 리스트 가져오기
	public List<PoolPartyVo> getMyWaitPoolList(int usrSeq){
		return poolPartyDao.getMyWaitPoolList(usrSeq);
	}
		
	// 사용자가 다른 사용자와 함께 풀 생성
	// 파라미터 UserVo myUser : 생성하는 사람
	//       String userSeq : Join 하는 유저 Seq 
	public Integer createPoolparty(UserVo myUser, int userSeq) {
	
		logger.info("풀파티 생성 시작");
		
		PoolPartyVo vo = new PoolPartyVo();
		vo.setPoolName(myUser.getUsrNick() + defaultPoolpartName);
		vo.setPoolPublicYn(defaultPublicYn);
		vo.setPoolPic(defaultPoolpartImage);
		vo.setPoolMainPic(defaultPoolpartImage);
		vo.setManagerUsrSeq(myUser.getUsrSeq());
		poolPartyDao.join(vo);
		
		
		logger.info("풀파티 맴버 생성 시작");
		
		// 방 생성자 insert
		enterPoolparty(vo.getPoolSeq(), myUser.getUsrSeq(), true, myUser.getUsrSeq());
		
		// 방 초대자 insert
		enterPoolparty(vo.getPoolSeq(), userSeq, false, userSeq);
		
		logger.info("풀파티 맴버 생성 완료");
		
		return vo.getPoolSeq() ;
	}
	
	// 풀파티 참여/초대
	// int poolSeq : 풀파티 Seq, 
	// int usrSeq : 참여하는 사람
	// boolean owner : true = 방장, false = 초대받는 이
	// aprvUsr : 승인하는 사람 
	public boolean enterPoolparty(int poolpartySeq, int usrSeq, boolean owner, int aprvUsr){
		PoolMemberVo poolMemberVo = new PoolMemberVo();
		poolMemberVo.setPoolSeq(poolpartySeq);
		poolMemberVo.setUsrSeq(usrSeq);
		
		//이미 참여하고 있으면 오류
		if (poolMemberDao.isMember(poolMemberVo)) {
			return false;
		}
		
		if (owner){
			poolMemberVo.setApprove("Y");
		} else {
			poolMemberVo.setApprove("N");
		}
		// 데이터 생성자가 방장이면 초대받는 이가 승인자
		// 데이터 생성자가 방장이 아니면 방장이 승인자
		poolMemberVo.setAprvUsr(aprvUsr);
		
		return poolMemberDao.join(poolMemberVo);
	}
	
	public boolean updateHit(int poolpartrySeq){
		return poolPartyDao.updatehit(poolpartrySeq);
	}
	// 풀파티 좋아요시 
	public boolean likePoolparty(int poolpartySeq, int userSeq) {
		PoolLikeVo vo = new PoolLikeVo();
		vo.setPoolSeq(poolpartySeq);
		vo.setUsrSeq(userSeq);
		
		return poolLikeDao.insert(vo);
	}
	
	// 풀파티 좋아요 취소시  
	public boolean unlikePoolparty(int poolpartySeq, int userSeq) {
		PoolLikeVo vo = new PoolLikeVo();
		vo.setPoolSeq(poolpartySeq);
		vo.setUsrSeq(userSeq);
		
		return poolLikeDao.delete(vo);
	}
	
	// 풀파티 좋아요 표시 (true면 좋아요 표시, false는 미표시)
		public boolean isLikePoolparty(int poolpartySeq, UserVo myUser) {
			PoolLikeVo vo = new PoolLikeVo();
			vo.setPoolSeq(poolpartySeq);
			vo.setUsrSeq(myUser.getUsrSeq());
			
			return poolLikeDao.isExisted(vo);
		}
	
	// 풀파티 좋아요/좋아요 취소 합침
	public int togglePoolparty(int poolpartySeq, UserVo myUser) {
		
		PoolLikeVo vo = new PoolLikeVo();
		vo.setPoolSeq(poolpartySeq);
		vo.setUsrSeq(myUser.getUsrSeq());
		
		// 추천한 내역이 있는지 확인 true면 이미 추천
		if ( poolLikeDao.isExisted(vo) ) {
			// 추천내역이 있는 경우
			poolLikeDao.delete(vo);
			return poolLikeDao.likeCount(vo);
		} else {
			// 추천내역이 없는 경우
			poolLikeDao.insert(vo);
			return poolLikeDao.likeCount(vo);
			
		}
	}
	
	// 풀파티 맴버 요청(수락/거절할) 리스트 가져오기 by 유저seq
	public List<PoolMemberVo> getRequestList(int userSeq) {
		return poolMemberDao.getRequestListbyUsrSeq(userSeq);
	}
	
	//풀파티 초대 수락
	public boolean approvePoolparty(int poolpartySeq, int userSeq, int aprvUsr){
		PoolMemberVo poolmembervo = new PoolMemberVo();
		poolmembervo.setPoolSeq(poolpartySeq);
		poolmembervo.setUsrSeq(userSeq);
		poolmembervo.setAprvUsr(aprvUsr);
		return poolMemberDao.approve(poolmembervo);
	}
	
	//풀파티 초대 거절
	public boolean rejectPoolparty(int poolpartySeq, int userSeq, int aprvUsr){
		boolean rejectsuccess = false;
		boolean deleteMember = false;
		boolean deleteParty = false;
		PoolMemberVo poolmembervo = new PoolMemberVo();
		poolmembervo.setPoolSeq(poolpartySeq);
		poolmembervo.setUsrSeq(userSeq);
		poolmembervo.setAprvUsr(aprvUsr);
		rejectsuccess = poolMemberDao.reject(poolmembervo);
		
		if (poolMemberDao.isDestoryPoolParty(poolmembervo) ){
			// 풀맴버 전체 삭제
			deleteMember = poolMemberDao.delete(poolmembervo);

			// 풀파티 삭제
			PoolPartyVo poolPartyVo = new PoolPartyVo();
			poolPartyVo.setPoolSeq(poolpartySeq);
			deleteParty = poolPartyDao.delete(poolPartyVo);
		}
		
		return (rejectsuccess && deleteMember && deleteParty);
	}

	// 풀파티 설정 저장
	public boolean postSetSave(PoolPartyVo poolPartyVo, MultipartFile file) {
		
		String pathName = POOLPARTY_SAVE_PATH;
		try {
			String saveFile = WebUtil.saveFile(file, pathName);
			if ( ! "".equals(saveFile) ) {
				logger.info("파일없음");
				poolPartyVo.setPoolPic(pathName + saveFile);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 시작 일자 셋팅
		String fromDate = poolPartyVo.getFromDate();
		if(fromDate != null && fromDate.isEmpty() == false){
			logger.info("fromDate existed");
			poolPartyVo.setFromDate("STR_TO_DATE('"+fromDate+"','%Y-%m-%d/')");
		} else 
			poolPartyVo.setFromDate("null");
		
		// 종료 일자 셋팅
		String toDate = poolPartyVo.getToDate();
		if(toDate != null && toDate.isEmpty() == false){
			logger.info("toDate existed");
			poolPartyVo.setToDate("STR_TO_DATE('"+toDate+"','%Y-%m-%d/')");
		} else 
			poolPartyVo.setToDate("null");
		
		// 공개여부 설정 (cause checkBox 이기 때문에
		String poolPublicYn = poolPartyVo.getPoolPublicYn();
		if (poolPublicYn == null) 
			poolPartyVo.setPoolPublicYn("N");
		
		poolPartyDao.update(poolPartyVo);
		
		return true;
	}
	
	public String changeMainPic (int usrSeq, MultipartFile file, int poolSeq) {
		String pathName = POOLPARTY_SAVE_PATH;
		String fileName = null;
		PoolPartyVo poolPartyVo = new PoolPartyVo();
		try {
			String saveFile = WebUtil.saveFile(file, pathName);
			if ( ! "".equals(saveFile) ) {
				logger.info("파일없음");
				poolPartyVo.setPoolMainPic(pathName + saveFile);
				fileName = pathName+ saveFile;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		poolPartyVo.setPoolSeq(poolSeq);
		
		if(poolPartyDao.changeMainPic(poolPartyVo)==true){
			return fileName;
		};
		
		return "No Changed";
		
	}
	
	public boolean sharePostToMySNS(PostVo postVo) {
		
		return  poolPartyDao.sharePost(postVo);
	}
	
	public boolean leaveParty(PoolMemberVo poolMemberVo) {
		return poolMemberDao.leaveParty(poolMemberVo);
	}
	
}
