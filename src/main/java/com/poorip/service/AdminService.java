package com.poorip.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.poorip.exception.GalleryUploadException;
import com.poorip.repository.AdminDao;
import com.poorip.repository.CountryDao;
import com.poorip.vo.CategoryVo;
import com.poorip.vo.CityVo;
import com.poorip.vo.CountryVo;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoPicVo;
import com.poorip.vo.TravelInfoVo;
import com.poorip.web.util.WebUtil;

@Service
public class AdminService {
	private static final String TRAVEL_SAVE_PATH = "/upload";
	private static final String POST_SAVE_PATH = "/postupload";
	public static final String BASE_URL = "/list/";
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private CountryDao countryDao;
	private CommonsMultipartFile[] files;

	public void addtarvelInfo(TravelInfoVo travelInfoVo, MultipartFile multipartFile, int ctrSeq) {
		CityVo cityVo = new CityVo();
		try {
			if (multipartFile.isEmpty() != true) {
//				throw new GalleryUploadException( "MultipartFile is Empty" );
			
			
				// 폴더가 없으면 폴더 생성
				String pathName = TRAVEL_SAVE_PATH + "/" + travelInfoVo.getTrvSeq();
				String saveFile = WebUtil.saveFile(multipartFile, pathName);
				
				// DB에 저장
				travelInfoVo.setPicture(pathName+"/"+saveFile);
			}
		} catch (IOException ex) {
			//1.log 남기기
			//2.runtime exception 전환 
			throw new GalleryUploadException( "save file uploded" );
		}
		cityVo.setCtyName(travelInfoVo.getName());
		cityVo.setCtrSeq(ctrSeq);
		
		adminDao.addInfo(travelInfoVo);
	}
	public void modifytarvelInfoPic(TravelInfoVo travelInfoVo, MultipartFile multipartFile) {
		try {
			if (multipartFile != null){
				if (multipartFile.isEmpty() != true) {
	//				throw new GalleryUploadException( "MultipartFile is Empty" );
				
				
					// 폴더가 없으면 폴더 생성
					String pathName = TRAVEL_SAVE_PATH + "/" + travelInfoVo.getTrvSeq();
					String saveFile = WebUtil.saveFile(multipartFile, pathName);
					
					// DB에 저장
					travelInfoVo.setPicture(pathName+"/"+saveFile);
				}
			}
		} catch (IOException ex) {
			//1.log 남기기
			//2.runtime exception 전환 
			throw new GalleryUploadException( "save file uploded" );
		}
		
		adminDao.modifyInfoPic(travelInfoVo);
	}
	

	public boolean addTravelPic(TravelInfoPicVo travelInfoPicVo, List<MultipartFile> travelfiles) throws IOException {
		
		boolean travelPicReturn = true;
		
		String pathName = TRAVEL_SAVE_PATH + "/" + travelInfoPicVo.getTrvSeq();
		
		for ( MultipartFile travelfile : travelfiles){
			
			String saveFile = WebUtil.saveFile(travelfile, pathName);
			travelInfoPicVo.setFileName( saveFile );
			travelInfoPicVo.setPath( pathName );
			
			travelPicReturn =  adminDao.addTravelPic( travelInfoPicVo );
		}
		
		return travelPicReturn;
		
	}

	public boolean addPost(PostVo postVo, List<MultipartFile> files) throws IOException {
		
		//Post 저장
		boolean postReturn = adminDao.addPost( postVo );
		boolean postPicReturn = true;
		String pathName = POST_SAVE_PATH + "/" + postVo.getTrvSeq();
		
		for ( MultipartFile file : files){
			
			String saveFile = WebUtil.saveFile(file, pathName);
			
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
		
		
		return adminDao.addCity(cityVo);
	}
	
	public boolean addCountry(CountryVo countryVo) {
		return countryDao.insert(countryVo);
	}
		
	public CommonsMultipartFile[] getFiles() {
		return files;
	}
	
	public void setFiles(CommonsMultipartFile[] files) {
		this.files = files;
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
