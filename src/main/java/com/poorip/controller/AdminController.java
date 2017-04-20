package com.poorip.controller;

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

import com.poorip.dto.JSONResult;
import com.poorip.security.AuthUser;
import com.poorip.service.AdminService;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
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
		
		model.addAttribute( "cateVo", adminService.getCategoryName());
		model.addAttribute( "cityVo", adminService.getCityName());
		model.addAttribute( "baseURL", adminService.BASE_URL );
		return "/admin/admin-add";
	}
	
	@RequestMapping("/upload/travel")
	public String addTravelInfo( @ModelAttribute TravelInfoVo travelInfoVo,
								 @RequestParam("file") MultipartFile multipartFile,
								 Model model ) {
		logger.info("travel");
		adminService.addInfo( travelInfoVo, multipartFile );
		
		return "redirect:/admin/basic";
	}
	
	@ResponseBody
	@RequestMapping( "/deleteInfo" )
	public JSONResult deleteInfo( @ModelAttribute TravelInfoVo travelInfoVo ){
		logger.info("/deleteInfo");
		boolean result = adminService.deleteInfo( travelInfoVo );
		if (result)
			return JSONResult.success( travelInfoVo.getTrvSeq());
		else
			return JSONResult.fail("DB error");
	}
	
	@RequestMapping("/upload/post")
	public String addPost( @ModelAttribute PostVo postVo,
						   @ModelAttribute PostPicVo postPicVo,
						   @RequestParam("trvSeq1") int trvSeq,
						   @RequestParam("file") MultipartFile multipartFile,
						   @AuthUser UserVo authUser,
						   Model model ) {
		postVo.setUsrSeq( 14 );
		postVo.setTrvSeq( trvSeq );
		String fileName = multipartFile.getOriginalFilename();
		postPicVo.setPath( "D:/postupload/" + fileName );
		adminService.addPost( postVo, postPicVo, multipartFile );
		
		return "redirect:/admin/basic";
	}
	
	@ResponseBody
	@RequestMapping( "/deletePost" )
	public JSONResult deletePost( @ModelAttribute PostVo postVo ){
		logger.info("/deletePost");
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
	
}
