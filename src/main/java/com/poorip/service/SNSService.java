package com.poorip.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poorip.repository.SNSDao;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class SNSService {
	
	private static final String POST_SAVE_PATH = "/postupload";
	
	@Autowired
	private SNSDao snsDao;
	
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

	public boolean addPost(ReviewVo reviewVo, List<MultipartFile> postUploadFiles) throws IOException {
		
		boolean postReturn = snsDao.addPost( reviewVo );
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
		
		return postReturn && postPicReturn;
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
		System.out.println(usrSeq);
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

}
