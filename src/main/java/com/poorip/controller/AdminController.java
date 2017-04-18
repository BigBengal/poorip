package com.poorip.controller;

import java.util.List;

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
import com.poorip.service.AdminService;
import com.poorip.vo.PostVo;
//import com.poorip.vo.CategoryVo;
//import com.poorip.vo.CityVo;
//import com.poorip.vo.CountryVo;
import com.poorip.vo.TravelInfoVo;

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
		adminService.addInfo( travelInfoVo, multipartFile );
		
		return "redirect:/admin/basic";
	}
	
	@ResponseBody
	@RequestMapping( "/deleteInfo" )
	public JSONResult deleteInfo(
			@ModelAttribute TravelInfoVo travelInfoVo ){
		logger.info("/deleteInfo");
		boolean result = adminService.deleteInfo( travelInfoVo );
		if (result)
			return JSONResult.success( travelInfoVo.getTrvSeq());
		else
			return JSONResult.fail("DB error");
	}
	
	
	
	@ResponseBody
	@RequestMapping( "/deletePost" )
	public JSONResult deletePost(
			@ModelAttribute PostVo postVo ){
		logger.info("/deleteInfo");
		boolean result = adminService.deletePost( postVo );
		if (result)
			return JSONResult.success( postVo.getPostSeq());
		else
			return JSONResult.fail("DB error");
	}
	


}
