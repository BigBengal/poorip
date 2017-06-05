package com.poorip.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poorip.repository.PoolLikeDao;
import com.poorip.repository.PoolPostDao;
import com.poorip.repository.PostPicDao;
import com.poorip.repository.SNSDao;
import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.PoolPostVo;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class SNSService {
	
	private static final String POST_SAVE_PATH = "/postupload";
	
	@Autowired
	private SNSDao snsDao;
	
	@Autowired
	private PoolPostDao poolPostDao;
	
	@Autowired
	private PostPicDao postPicDao;
	
	@Autowired
	private PoolLikeDao poolLikeDao;
	

	
	public List<TravelInfoVo> getTravelInfo() {
		return snsDao.getTravelInfo();
	}
	
	public List<ReviewVo> getpostList(int usrSeq, int page) {
	
		List<ReviewVo> postlist = snsDao.getpostList( usrSeq, page );
		
		return postlist;
	}
	
	public List<PostPicVo> getpostPicList(int postSeq) {
		
		List<PostPicVo> postPicList = snsDao.getpostPicList( postSeq );
		return postPicList;
	}

	public boolean addPost(ReviewVo reviewVo, List<MultipartFile> postUploadFiles, int[] poolPostSeq) throws IOException {
		
		boolean postReturn = snsDao.addPost( reviewVo );
		boolean addPoolPostReturn = true;
		if( poolPostSeq != null ) {
			addPoolPostReturn = addPoolPost(poolPostSeq, reviewVo.getPostSeq());
		}
		boolean postPicReturn = true;
		
		String pathName = POST_SAVE_PATH + "/" + reviewVo.getUsrSeq() +"/" + reviewVo.getTrvSeq();
		
		for ( int i=0; i < postUploadFiles.size(); i++ ) {
			File file = new File( pathName );
			
			if( file.isDirectory() == false )
				file.mkdirs();
			
			String orgFile = postUploadFiles.get(i).getOriginalFilename();
			String fileExtName = orgFile.substring( orgFile.lastIndexOf( '.' ) + 1, orgFile.length() );
			String saveFile = generateSaveFileName( fileExtName );
			
			IOUtils.copy( postUploadFiles.get(i).getInputStream(), new FileOutputStream( pathName + "/" + saveFile ) );
			PostPicVo postPicVo = new PostPicVo();
			postPicVo.setPostSeq( reviewVo.getPostSeq() );
			postPicVo.setPath( pathName );
			postPicVo.setFileName( saveFile );
			
			postPicReturn = postPicReturn && snsDao.addPostPic( postPicVo );
		}
		
		return postReturn && postPicReturn && addPoolPostReturn;
	}
	
	public boolean addPostOnly(ReviewVo reviewVo, int[] poolPostSeq) {
		boolean addOnlyPostReturn = snsDao.addPostOnly(reviewVo);
		
		if(poolPostSeq == null) {
			return addOnlyPostReturn;
		} else {
			boolean addPoolPostReturn = addPoolPost(poolPostSeq, reviewVo.getPostSeq());
			return addOnlyPostReturn && addPoolPostReturn;
		}
		
	}
	
	public boolean addPoolPost( int[] poolPostSeq, int postSeq ) {
		if(poolPostSeq == null) {
			return true;
		}
		boolean count = true;
		PoolPostVo poolPostVo = new PoolPostVo();
		for(int i=0; i<poolPostSeq.length; i++) {
			int poolSeq = poolPostSeq[i];
			poolPostVo.setPoolSeq(poolSeq);
			poolPostVo.setPostSeq(postSeq);
			count = poolPostDao.write(poolPostVo);
		}
		return count;
	}
	
	public PostVo updatePost(ReviewVo reviewVo, List<MultipartFile> postUploadFiles) throws Exception, IOException{
		boolean postReturn = snsDao.updatePost( reviewVo );
		boolean postPicReturn = true;
		
		String pathName = POST_SAVE_PATH + "/" + reviewVo.getUsrSeq() +"/" + reviewVo.getTrvSeq();
		if(postUploadFiles!=null) {
			for ( int i=0; i < postUploadFiles.size(); i++ ) {
				
				if (postUploadFiles.get(i).getSize() == 0)
					continue;
				
				File file = new File( pathName );
				
				if( file.isDirectory() == false )
					file.mkdirs();
				
				String orgFile = postUploadFiles.get(i).getOriginalFilename();
				String fileExtName = orgFile.substring( orgFile.lastIndexOf( '.' ) + 1, orgFile.length() );
				String saveFile = generateSaveFileName( fileExtName );
				
				IOUtils.copy( postUploadFiles.get(i).getInputStream(), new FileOutputStream( pathName + "/" + saveFile ) );
				PostPicVo postPicVo = new PostPicVo();
				postPicVo.setPostSeq( reviewVo.getPostSeq() );
				postPicVo.setPath( pathName );
				postPicVo.setFileName( saveFile );
				
				postPicReturn = postPicReturn && snsDao.addPostPic( postPicVo );
				
			}
		}
		return snsDao.showEditedPost(reviewVo);
	}
	
	public PostVo updatePost(ReviewVo reviewVo, List<MultipartFile> postUploadFiles, List<Integer> postPicSeqArray) throws FileNotFoundException, IOException {
		boolean postReturn = snsDao.updatePost( reviewVo );
		boolean postPicReturn = true;
		
		String pathName = POST_SAVE_PATH + "/" + reviewVo.getUsrSeq() +"/" + reviewVo.getTrvSeq();
		if(postUploadFiles!=null) {
			for ( int i=0; i < postUploadFiles.size(); i++ ) {
				File file = new File( pathName );
				
				if( file.isDirectory() == false )
					file.mkdirs();
				
				String orgFile = postUploadFiles.get(i).getOriginalFilename();
				String fileExtName = orgFile.substring( orgFile.lastIndexOf( '.' ) + 1, orgFile.length() );
				String saveFile = generateSaveFileName( fileExtName );
				
				IOUtils.copy( postUploadFiles.get(i).getInputStream(), new FileOutputStream( pathName + "/" + saveFile ) );
				PostPicVo postPicVo = new PostPicVo();
				postPicVo.setPostSeq( reviewVo.getPostSeq() );
				postPicVo.setPath( pathName );
				postPicVo.setFileName( saveFile );
				
				if(postPicSeqArray.get(0)==-1) {
					snsDao.addPostPic( postPicVo );
					return snsDao.showEditedPost(reviewVo);
				}
				
//				snsDao.deletePicture(postPicSeqArray);
				postPicReturn = postPicReturn && snsDao.addPostPic( postPicVo );
				
			}
		}
		return snsDao.showEditedPost(reviewVo);
	
	}

	private String generateSaveFileName(String fileExtName) {
		String fileName = "";
		Calendar calendar = Calendar.getInstance();
		
		fileName += calendar.get( Calendar.YEAR );
		fileName += calendar.get( Calendar.MONTH );
		fileName += calendar.get( Calendar.DATE );
		fileName += calendar.get( Calendar.HOUR );
		fileName += calendar.get( Calendar.MINUTE );
		fileName += calendar.get( Calendar.SECOND );
		fileName += calendar.get( Calendar.MILLISECOND );
		fileName += ( "." + fileExtName );

		return fileName;
		
	}

	public List<ReviewVo> getAddPostList(int usrSeq) {
		return snsDao.getAddPostList( usrSeq );
	}
	
	public List<ReviewVo> getPostListbyPoolSeq( int poolSeq, int page) {
		return snsDao.getPostListbyPoolSeq( poolSeq, page );
	}
	
	public boolean increasePostLike(int postSeq, int usrSeq) {
		return snsDao.increaseLike(postSeq, usrSeq);
	}
	
	public Integer checkPostLike(int postSeq, int usrSeq) {
		return snsDao.checkPostLike(postSeq, usrSeq);
	}
	
	public boolean decreasePostLike(int postSeq, int usrSeq) {
		return snsDao.decreaseLike(postSeq, usrSeq);
	}
	
	public List<PostVo> showPostLike(int trvSeq, int usrSeq) {
		return snsDao.showPostLike(trvSeq, usrSeq);
	}
	
	public List<PostVo> showAllPostSeqsofTravel(int trvSeq) {
		return snsDao.showAllPostSeqsofTravel(trvSeq);
	}

	public boolean deletePost(PostVo postVo) {
		int postSeq = postVo.getPostSeq();
		boolean delPostLike = snsDao.deletePostLikeByPostSeq(postSeq);		
		boolean delPostPic = postPicDao.deleteByPostSeq(postSeq);
		boolean delPoolPost = poolPostDao.deleteByPostSeq(postSeq);
		boolean delPost = snsDao.deletePost( postVo );
		
		return delPost || delPostPic || delPostLike || delPoolPost;
	}

	public String getHidden(int usrSeq, int postSeq) {
		return snsDao.getHidden( usrSeq, postSeq);
	}
	
	public List<PoolPartyVo> getPoolListByUsrSeq(int usrSeq) {
		return snsDao.getPoolListByUsrSeq(usrSeq);
	}
	

}
