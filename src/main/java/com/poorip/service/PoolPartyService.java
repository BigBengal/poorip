package com.poorip.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.PoolLikeDao;
import com.poorip.repository.PoolMemberDao;
import com.poorip.repository.PoolPartyDao;
import com.poorip.vo.CityVo;
import com.poorip.vo.PoolLikeVo;
import com.poorip.vo.PoolMemberVo;
import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.TravelInfoVo;
import com.poorip.vo.UserVo;

@Service
public class PoolPartyService {
	
	private static final Logger logger = LoggerFactory.getLogger(PoolPartyService.class);
	
	private static final String defaultPoolpartName = "님의 풀파티";
	private static final String defaultPublicYn = "Y";
	private static final String defaultPoolpartImage = "/poorip/assets/images/none.png";
	
	
	@Autowired
	private PoolPartyDao poolPartyDao;

	@Autowired
	private PoolMemberDao poolMemberDao;
	
	@Autowired
	private PoolLikeDao poolLikeDao;
	
	public List<TravelInfoVo> getPoolKwd(String keyword) {
		List<TravelInfoVo> travelInfoList = poolPartyDao.getPoolKwd( keyword );
		logger.info("travelInfoList:"+travelInfoList.toString());
		return travelInfoList;
	}
	
	public List<PoolPartyVo> getPoolList(PoolPartyVo poolPartyVo) {
		List<PoolPartyVo> poolList = poolPartyDao.getPoolList(poolPartyVo);
		return poolList;
	}
	
	public List<CityVo> getCityNames(String ctyName) {
		return poolPartyDao.getCityNames(ctyName);
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
		vo.setManagerUsrSeq(myUser.getUsrSeq());
		poolPartyDao.join(vo);
		
		
		logger.info("풀파티 맴버 생성 시작");
		
		// 방 생성자 insert
		enterPoolparty(vo.getPoolSeq(), myUser.getUsrSeq(), true);
		
		// 방 초대자 insert
		enterPoolparty(vo.getPoolSeq(), userSeq, false);
		
		logger.info("풀파티 맴버 생성 완료");
		
		return vo.getPoolSeq() ;
	}
	
	// 풀파티 참여/초대
	// int poolSeq : 풀파티 Seq, 
	// int usrSeq : 참여하는 사람
	// boolean owner : true = 방장, false = 초대받는 이
	public boolean enterPoolparty(int poolpartySeq, int usrSeq, boolean owner){
		PoolMemberVo poolMemberVo = new PoolMemberVo();
		poolMemberVo.setPoolSeq(poolpartySeq);
		poolMemberVo.setUsrSeq(usrSeq);
		if (owner){
			poolMemberVo.setApprove("Y");
		} else {
			poolMemberVo.setApprove("N");
		}
		return poolMemberDao.join(poolMemberVo);
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
	
	// 풀파티 좋아요/좋아요 취소 합침
	public boolean togglePoolparty(int poolpartySeq, UserVo myUser) {
		PoolLikeVo vo = new PoolLikeVo();
		vo.setPoolSeq(poolpartySeq);
		vo.setUsrSeq(myUser.getUsrSeq());
		
		// 추천한 내역이 있는지 확인 true면 이미 추천
		if ( poolLikeDao.isExisted(vo) ) {
			// 추천내역이 있는 경우
			return poolLikeDao.delete(vo);
		} else {
			// 추천내역이 없는 경우
			return poolLikeDao.insert(vo);
		}
	}
	
	
	//풀파티 초대 수락
	public boolean approvePoolparty(int poolpartySeq, int userSeq){
		PoolMemberVo poolmembervo = new PoolMemberVo();
		poolmembervo.setPoolSeq(poolpartySeq);
		poolmembervo.setUsrSeq(userSeq);
		return poolMemberDao.approve(poolmembervo);
		
	}
	
	
	//풀파티 초대 거절
	public boolean rejectPoolparty(int poolpartySeq, int userSeq){
		boolean rejectsuccess = false;
		boolean deleteMember = false;
		boolean deleteParty = false;
		PoolMemberVo poolmembervo = new PoolMemberVo();
		poolmembervo.setPoolSeq(poolpartySeq);
		poolmembervo.setUsrSeq(userSeq);
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
	
}
