package com.poorip.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.poorip.exception.GalleryUploadException;
import com.poorip.repository.AdminDao;
import com.poorip.vo.CategoryVo;
import com.poorip.vo.CityVo;
import com.poorip.vo.CountryVo;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoPicVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class AdminService {
	private static final String TRAVEL_SAVE_PATH = "/upload";
	private static final String POST_SAVE_PATH = "/postupload";
	public static final String BASE_URL = "/list/";
	
	@Autowired
	private AdminDao adminDao;
	private CommonsMultipartFile[] files;

	public void addtarvelInfo(TravelInfoVo travelInfoVo, MultipartFile multipartFile) {
		try {
			if (multipartFile.isEmpty() == true) {
				throw new GalleryUploadException( "MultipartFile is Empty" );
			}
			// 폴더가 없으면 폴더 생성
			String pathName = TRAVEL_SAVE_PATH + "/" + travelInfoVo.getTrvSeq();
			File file = new File( pathName );
			if( file.isDirectory() == false )
				file.mkdirs();
			
			String orgFile = multipartFile.getOriginalFilename();
			String fileExtName = orgFile.substring( orgFile.lastIndexOf('.') + 1, orgFile.length() );
			String saveFile = generateSaveFileName( fileExtName );
			
			// 파일 저장
			IOUtils.copy( multipartFile.getInputStream(), new FileOutputStream( pathName + "/" + saveFile ) );
			
			// DB에 저장
			travelInfoVo.setPicture(saveFile);
			
		} catch (IOException ex) {
			//1.log 남기기
			//2.runtime exception 전환 
			throw new GalleryUploadException( "save file uploded" );
		}
		adminDao.addInfo(travelInfoVo);
	}

	public boolean addTravelPic(TravelInfoPicVo travelInfoPicVo, List<MultipartFile> travelfiles) throws IOException {
		
		boolean travelPicReturn = true;
		
		String pathName = TRAVEL_SAVE_PATH + "/" + travelInfoPicVo.getTrvSeq();
		for (int i=0; i < travelfiles.size(); i++) {
			File file = new File( pathName );
			
			// 폴더가 없으면 폴더 생성
			if( file.isDirectory() == false )
				file.mkdirs();
			
			// 서버 저장용 파일이름 변경
			String orgFile = travelfiles.get(i).getOriginalFilename();
			String fileExtName = orgFile.substring( orgFile.lastIndexOf( '.' ) + 1, orgFile.length() );
			String saveFile = generateSaveFileName( fileExtName );
			
			// 서버에 저장
			IOUtils.copy( travelfiles.get(i).getInputStream(), new FileOutputStream( pathName + "/" + saveFile) );
			travelInfoPicVo.setFileName( saveFile );
			travelInfoPicVo.setPath( pathName );
			
			//addTravelPic 저장
			travelPicReturn =  adminDao.addTravelPic( travelInfoPicVo );
		}
		return travelPicReturn;
		
	}

	public boolean addPost(PostVo postVo, List<MultipartFile> files) throws IOException {
		
		//Post 저장
		boolean postReturn = adminDao.addPost( postVo );
		boolean postPicReturn = true;
		String pathName = POST_SAVE_PATH + "/" + postVo.getTrvSeq();
		for (int i=0; i < files.size(); i++) {
			File file = new File( pathName );
			
			// 폴더가 없으면 폴더 생성
			if(file.isDirectory() == false)
				file.mkdirs();

			// 서버 저장용 파일이름 변경
			String orgFile = files.get(i).getOriginalFilename();
			String fileExtName = orgFile.substring( orgFile.lastIndexOf( '.' ) + 1, orgFile.length() );
			String saveFile = generateSaveFileName( fileExtName );
			
			// 서버에 저장
			IOUtils.copy( files.get(i).getInputStream(), new FileOutputStream(pathName+"/"+saveFile));
			PostPicVo postPicVo = new PostPicVo();
			postPicVo.setPostSeq(postVo.getPostSeq());
			postPicVo.setPath(pathName);
			postPicVo.setFileName(saveFile);

			//PostPic 저장
			postPicReturn = postPicReturn && adminDao.addPostPic(postPicVo);
		}
		
		return postReturn && postPicReturn; //adminDao.addPostAndPic( postVo, postPicVo );
	}


	public boolean addCity(CityVo cityVo) {
		return adminDao.addCity( cityVo );
		
	}
	
	public CommonsMultipartFile[] getFiles() {
		return files;
	}
	
	public void setFiles(CommonsMultipartFile[] files) {
		this.files = files;
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
	
	public List<TravelInfoVo> getTravelName() {
		return adminDao.getTravelName();
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
	
	public boolean deleteCountry(CountryVo countryVo) {
		return adminDao.deleteCountry( countryVo );
	}

	public boolean deleteCity(CityVo cityVo) {
		return adminDao.deleteCity( cityVo );
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
