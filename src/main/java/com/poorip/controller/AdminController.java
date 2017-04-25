package com.poorip.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.poorip.dto.FileMeta;
import com.poorip.dto.JSONResult;
import com.poorip.security.AuthUser;
import com.poorip.service.AdminService;
import com.poorip.vo.CityVo;
import com.poorip.vo.CountryVo;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoPicVo;
import com.poorip.vo.TravelInfoVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	LinkedList<FileMeta> files = new LinkedList<FileMeta>();
	FileMeta fileMeta = null;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/basic")
	public String adminBasic( Model model) {
		model.addAttribute( "travelinfoVo", adminService.getTravelInfo() );
		model.addAttribute( "postVo", adminService.getPost() );
		model.addAttribute( "postPicVo", adminService.getPostPic() );
		model.addAttribute( "countryVo", adminService.getCountry() );
		model.addAttribute( "cityVo", adminService.getCity() );
		return "/admin/admin-basic";
	}
	
	@RequestMapping("/addInfo")
	public String addTravelInfoForm( Model model ) {
		
		model.addAttribute( "cateVo", adminService.getCategoryName() );
		model.addAttribute( "cityVo", adminService.getCityName()) ;
		model.addAttribute( "travelVo", adminService.getTravelName() );
		model.addAttribute( "baseURL", adminService.BASE_URL );
		return "/admin/admin-add";
	}
	
	@RequestMapping("/upload/travel")
	public String addTravelInfo( @ModelAttribute TravelInfoVo travelInfoVo,
								 @RequestParam("file") MultipartFile multipartFile,
								 Model model ) {
		adminService.addtarvelInfo( travelInfoVo, multipartFile );
		
		return "redirect:/admin/basic";
	}
	
	@RequestMapping("/upload/travelPic")
	public String addTravelPic( @ModelAttribute TravelInfoPicVo travelInfoPicVo,
								@RequestParam ("trvSeq1") int trvSeq,
								MultipartHttpServletRequest request,
								Model model) throws IOException {
		System.out.println(travelInfoPicVo);
		travelInfoPicVo.setTrvSeq( trvSeq );
		System.out.println(trvSeq);
		List< MultipartFile > Travelfiles = request.getFiles( "travelfile" );
		System.out.println(Travelfiles);
		System.out.println(travelInfoPicVo);
		adminService.addTravelPic( travelInfoPicVo, Travelfiles );
		
		return "redirect:/admin/basic";
	}
	
	@ResponseBody
	@RequestMapping( "/deleteInfo" )
	public JSONResult deleteInfo( @ModelAttribute TravelInfoVo travelInfoVo ){
		boolean result = adminService.deleteInfo( travelInfoVo );
		if (result)
			return JSONResult.success( travelInfoVo.getTrvSeq());
		else
			return JSONResult.fail("DB error");
	}
	
	@RequestMapping("/upload/post")
	public String addPost( @ModelAttribute PostVo postVo,
						   @RequestParam("trvSeq1") int trvSeq,
						   @AuthUser UserVo authUser,
						   MultipartHttpServletRequest request,
						   Model model ) throws IOException {
//		postVo.setUsrSeq( authUser.getUsrSeq() );
		postVo.setUsrSeq( 14 );
		postVo.setTrvSeq( trvSeq );
		List< MultipartFile > files = request.getFiles( "file" );
		adminService.addPost( postVo, files );
		
		return "redirect:/admin/basic";
	}
	
	public void saveFileToServer( List<MultipartFile> multipartFiles ) throws IOException {
		String directory = "D:/postupload/";
		File file = new File( directory );
		if(file.isDirectory() == false)
			file.mkdirs();
		for( MultipartFile multipartFile : multipartFiles ) {
			file = new File( directory + multipartFile.getOriginalFilename() );
			IOUtils.copy( multipartFile.getInputStream(), new FileOutputStream(file) );
		}
	}
	
	@ResponseBody
	@RequestMapping( "/deletePost" )
	public JSONResult deletePost( @ModelAttribute PostVo postVo ){
		boolean result = adminService.deletePost( postVo );
		if (result)
			return JSONResult.success( postVo.getPostSeq());
		else
			return JSONResult.fail("DB error");
	}
	
	@ResponseBody
	@RequestMapping( "/deletePostPic" )
	public JSONResult deletePostPic( @ModelAttribute PostPicVo postPicVo ){
		
		boolean result = adminService.deletePostPic( postPicVo );
		if (result)
			return JSONResult.success( postPicVo.getPostPicSeq() );
		else
			return JSONResult.fail("DB error");
	}
	
	@ResponseBody
	@RequestMapping( "/deleteCountry" )
	public JSONResult deleteCountry( @ModelAttribute CountryVo countryVo ){
		boolean result = adminService.deleteCountry( countryVo );
		if (result)
			return JSONResult.success( countryVo.getCtrSeq() );
		else
			return JSONResult.fail("DB error");
	}
	
	@RequestMapping("/upload/city")
	public String addCity( @ModelAttribute CityVo cityVo,
						   @RequestParam ( "ctrSeq2" ) String ctrSeq1,
						   Model model ) {
		
		int ctrSeq = Integer.parseInt(ctrSeq1);
		cityVo.setCtrSeq( ctrSeq );
		adminService.addCity( cityVo );
		
		return "redirect:/admin/basic";
	}

	@ResponseBody
	@RequestMapping( "/deleteCity" )
	public JSONResult deleteCity( @ModelAttribute CityVo cityVo ){
		
		boolean result = adminService.deleteCity( cityVo );
		if (result)
			return JSONResult.success( cityVo.getCtySeq() );
		else
			return JSONResult.fail("DB error");
	}

}
