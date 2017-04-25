package com.poorip.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.poorip.dto.JSONResult;
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.SNSService;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/sns")
public class SNSController {
	
	@Autowired SNSService snsService;
	
	@Auth
	@ResponseBody
	@RequestMapping("/main/{page}")
	public JSONResult mySNS( @AuthUser UserVo userVo,
							 @PathVariable ( "page" ) Integer page,
							 @ModelAttribute PostVo postVo,
							  Model model ) {
		int usrSeq = userVo.getUsrSeq();
		page = page * 3;
		List<PostVo> map = snsService.getpostList(usrSeq, page);
		
		System.out.println(page);
		return JSONResult.success(map);
	}
	
	@RequestMapping("/post/upload")
	public JSONResult mySNSadd( @AuthUser UserVo userVo,
								@ModelAttribute PostVo postVo,
								@RequestParam("trvSeq1") int trvSeq,
								MultipartHttpServletRequest request,
								Model model ) throws IOException {
		
		postVo.setUsrSeq( userVo.getUsrSeq() );
		postVo.setTrvSeq( trvSeq );
		List<MultipartFile> postUploadFiles = request.getFiles( "postUploadFiles" );
		snsService.addPost( postVo, postUploadFiles );
		List<ReviewVo> review = snsService.getAddPostList( postVo.getUsrSeq() );
		
		return JSONResult.success( review );
	}
	
	

}
