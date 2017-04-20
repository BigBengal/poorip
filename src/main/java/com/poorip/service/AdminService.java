package com.poorip.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poorip.exception.GalleryUploadException;
import com.poorip.repository.AdminDao;
import com.poorip.vo.CategoryVo;
import com.poorip.vo.CityVo;
import com.poorip.vo.CountryVo;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class AdminService {
	private static final String TRAVEL_SAVE_PATH = "/upload";
	private static final String POST_SAVE_PATH = "/postupload";
	public static final String BASE_URL = "/list/";
	
	@Autowired
	private AdminDao adminDao;

	public void addInfo(TravelInfoVo travelInfoVo, MultipartFile multipartFile) {
		try {
			if (multipartFile.isEmpty() == true) {
				throw new GalleryUploadException( "MultipartFile is Empty" );
			}
			
			String orgFile = multipartFile.getOriginalFilename();
			String fileExtName = orgFile.substring( orgFile.lastIndexOf('.') + 1, orgFile.length() );
			String saveFile = generateSaveFileName( fileExtName );
			// 파일 저장
			travelWriteFile(multipartFile, saveFile);
			// DB에 저장
			travelInfoVo.setPicture(saveFile);
		} catch (IOException ex) {
			//1.log 남기기
			//2.runtime exception 전환 
			throw new GalleryUploadException( "save file uploded" );
		}
		adminDao.addInfo(travelInfoVo);
	}
	
	public boolean addPost(PostVo postVo, PostPicVo postPicVo, MultipartFile multipartFile) {
		
		try {
			if (multipartFile.isEmpty() == true) {
				return adminDao.addPost( postVo );
			}
			
			String orgFile = multipartFile.getOriginalFilename();
			String fileExtName = orgFile.substring( orgFile.lastIndexOf('.') + 1, orgFile.length() );
			String saveFile = generateSaveFileName( fileExtName );
			// 파일 저장
			PostWriteFile(multipartFile, saveFile);
			// DB에 저장
			postPicVo.setFileName(saveFile);
		} catch (IOException ex) {
			//1.log 남기기
			//2.runtime exception 전환 
			throw new GalleryUploadException( "save file uploded" );
		}
		return adminDao.addPostAndPic( postVo, postPicVo );
	}
	
	public Map<Object, Object> getPostAndPicList(PostVo postVo, PostPicVo postPicVo) {
		
		return null;
	}
	
//	public boolean addPost( ReviewVo reviewVo, MultipartFile multipartFile ) {
//		try {
//			if (multipartFile.isEmpty() == true) {
//				return adminDao.addPost( reviewVo );
//			}
//			
//			String orgFile = multipartFile.getOriginalFilename();
//			String fileExtName = orgFile.substring( orgFile.lastIndexOf('.') + 1, orgFile.length() );
//			String saveFile = generateSaveFileName( fileExtName );
//			// 파일 저장
//			PostWriteFile(multipartFile, saveFile);
//			// DB에 저장
//			reviewVo.setFileName(saveFile);
//		} catch (IOException ex) {
//			//1.log 남기기
//			//2.runtime exception 전환 
//			throw new GalleryUploadException( "save file uploded" );
//		}
//		return adminDao.addPostAndPic( reviewVo );
//	}
	
//	public boolean addPost(ReviewVo reviewVo) {
//		return adminDao.addPost(reviewVo);
//	}
	
	private void travelWriteFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		byte[] fileData = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream( TRAVEL_SAVE_PATH + "/" + saveFileName );
		fos.write( fileData );
		fos.close();
	}
	
	private void PostWriteFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		byte[] fileData = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream( POST_SAVE_PATH + "/" + saveFileName );
		fos.write( fileData );
		fos.close();
	}
	
	
	
	private String generateSaveFileName(String extName) {
		String fileName = "";
		Calendar calendar = Calendar.getInstance();

		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += ("." + extName);

		return fileName;
	}

	public List<CityVo> getCityName() {
		return adminDao.getCityName();
	}

	public List<CategoryVo> getCategoryName() {
		return adminDao.getCategoryName();
	}

	public List<TravelInfoVo> getTravelList() {
		return adminDao.getList();
	}
	
	public boolean deleteInfo(TravelInfoVo travelInfoVo) {
		return adminDao.deleteInfo( travelInfoVo );
	}

	public boolean deletePost(PostVo postVo) {
		return adminDao.deletePost( postVo );
	}
	
	public boolean deletePostPic(PostPicVo postPicVo) {
		return adminDao.deletePostPic( postPicVo );
	}
	
	public TravelInfoVo getMessage(int trvSeq) {
		return adminDao.get( trvSeq );
	}

	public List<TravelInfoVo> getTravelInfo() {
		return adminDao.getList();
	}

	public List<PostVo> getPost() {
		return adminDao.getPostList();
	}

	public List<PostPicVo> getPostPic() {
		return adminDao.getPostPicList();
	}

	public List<CountryVo> getCountry() {
		return adminDao.getCountryList();
	}

	public List<CityVo> getCity() {
		return adminDao.getCityList();
	}

}
