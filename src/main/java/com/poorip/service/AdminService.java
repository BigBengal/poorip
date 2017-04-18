package com.poorip.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poorip.exception.GalleryUploadException;
import com.poorip.repository.AdminDao;
import com.poorip.vo.CategoryVo;
import com.poorip.vo.CityVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class AdminService {
	private static final String SAVE_PATH = "/upload";
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
			writeFile(multipartFile, saveFile);
			// DB에 저장
			travelInfoVo.setPicture(saveFile);
		} catch (IOException ex) {
			//1.log 남기기
			//2.runtime exception 전환 
			throw new GalleryUploadException( "save file uploded" );
		}
		adminDao.addInfo(travelInfoVo);
	}
	
	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		byte[] fileData = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream( SAVE_PATH + "/" + saveFileName );
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

	public TravelInfoVo getMessage(int trvSeq) {
		return adminDao.get( trvSeq );
	}

	public List<TravelInfoVo> getTravelInfo() {
		return adminDao.getList();
	}

	public List<PostVo> getPost() {
		return adminDao.getPostList();
	}

	public boolean deletePost(PostVo postVo) {
		return adminDao.deletePost( postVo );
	}

}
