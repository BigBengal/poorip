<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
function toggleFooter(){
	console.log('toggleFooter');
	var $footer = $('.footer.section'); 
	if( $footer.is('.footer_hide') ) {
		$footer.removeClass('footer_hide');
	} else {
		$footer.addClass('footer_hide');
	}
}
function showHelp(){
	console.log('showHelp');
}
</script>

<!-- .footer start -->
<!-- ================ -->
<div class="footer section footer_hide">
	<div class="container">
		<h1 class="title text-center" id="contact"><span style="color: #75ccff">의견</span>을 듣고 싶습니다</h1>
		<div class="space"></div>
		<div class="row">
			<div class="col-sm-6">
				<div class="footer-content">
					<p class="large">수정되야할 정보가 있거나 건의할 사항이 있으시면 여기에 전부 적어주세요. 고객님의 소리에 "귀" 기울이겠습니다.</p>
					<ul class="list-icons">
						<li><i class="fa fa-map-marker pr-10"></i> 서울시 강남구 비트빌</li>
						<li><i class="fa fa-phone pr-10"></i> +82 01011223344</li>
						<li><i class="fa fa-envelope-o pr-10"></i> your@email.com</li>
					</ul>
					<ul class="social-links">
						<li class="facebook"><a target="_blank"
							href="https://www.facebook.com"><i
								class="fa fa-facebook"></i></a></li>
						<li class="twitter"><a target="_blank"
							href="https://twitter.com/HtmlcoderMe"><i
								class="fa fa-twitter"></i></a></li>
						<li class="googleplus"><a target="_blank"
							href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
						<li class="skype"><a target="_blank"
							href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
						<li class="linkedin"><a target="_blank"
							href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
						<li class="youtube"><a target="_blank"
							href="http://www.youtube.com"><i class="fa fa-youtube"></i></a></li>
						<li class="flickr"><a target="_blank"
							href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
						<li class="pinterest"><a target="_blank"
							href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
					</ul>
				</div>
			</div>
			
				<div class="footer-content">
					<form action="${pageContext.request.contextPath }/comments" id="footer-form">
						<div class="form-group has-feedback" >
	
		
						<div class="btn-group col-sm-6"  style="margin-bottom:1.5em" data-toggle="buttons">
			
			
							 	<label class="btn btn-default" id="notiY">
						
							<input type="radio" name="kind" value="C" id="kind1" autocomplete="off"> 건의사항
							</label>
							 	<label class="btn btn-default active" id="notiN">
							
							<input type="radio" name="kind" value="E" id="kind2" autocomplete="off"> 수정요청
							</label>
			
						</div>
					</div>
						<div class="col-sm-6">
						<div class="form-group has-feedback">
							<label class="sr-only" for="name2">Name</label> <input
								type="text" class="form-control" id="name2" placeholder="제목"
								name="title" required> <i
								class="fa fa-user form-control-feedback"></i>
						</div>
					
						<div class="form-group has-feedback">
							<label class="sr-only" for="message2">Message</label>
							<textarea class="form-control" rows="8" id="message2"
								placeholder="건의/의견 사항을 기재해주세요" name="contents" required></textarea>
							<i class="fa fa-pencil form-control-feedback"></i>
						</div>
						<input type="submit" value="전송" class="btn btn-default">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- .footer end -->

<!-- .subfooter start -->
<!-- ================ -->
<div class="subfooter">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<span style="padding: 0px 10px;"><a href="javascript:showHelp();" target="_blank">Help</a></span>
				<span style="padding: 0px 10px;"><a href="javascript:toggleFooter();">Request</a></span>
				
			</div>
		</div>
		<div class="space"></div>
		<div class="row">
			<div class="col-md-12">
				<p class="text-center">
					Copyright © 2017 Created by <a target="_blank"
						href="https://www.facebook.com/groups/595682550640313/">BigBengal</a>.
				</p>
			</div>
		</div>
	</div>
</div>

<!-- .subfooter end -->

