<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var dialogDeleteForm = null;
var isEnd = false;
var page = 0;
var post_render = function( vo ) {
	var post_html = "<div class='form-group' id='first-html-" + vo.postSeq + "'>" + 
						"<p class='col-sm-2'>" + vo.postSeq + "</p>" +
				   		"<p class='col-sm-10 text-center' style='font-size: 20px'><strong>" + vo.title + "</strong></p>" +
			   		"</div>";

		 		    $( "#my-sns-list" ).append(post_html);
}

var postPic_render = function(vo2, vo) {
	var postPic_html = "<div class='form-group' id='middle-html-" + vo.postSeq + "'>" +
							"<div class='col-md-offset-4'>" +
						   		"<p class='col-md-12'>" + 
					   				"<img src='/poorip" + vo2.path + "/" + vo2.fileName + " 'width='500px'>" +
						   		"</p>" +
					   		"</div>" +
					   "</div>";

					   $( "#first-html-"+vo.postSeq ).after(postPic_html);
}

var last_render = function(vo) {
	var last_html = "<div class='form-group'>" +
						"<p class='col-md-12 text-center' style='font-size: 15px'>" + vo.contents + "</p>" +
					"</div>" + 
					"<div class='form-group'>" +
						"<p class='col-md-7'> </p>" +
						"<p class='col-md-5' align='left'>" + vo.crtDate + "</p>" +
					"</div>" +
					"<div class='form-group'>" +
						"<p class='col-md-2'><img alt='' src='''>삭제</p>" +
		   				"<p class='col-md-8'></p>" + 
		   				"<p class='col-md-2'><img alt='' src='''>공유</p>" +
	   				"</div>";

					$("#middle-html-"+vo.postSeq).after(last_html);
} 

var fetchList = function() {
	if( isEnd == true ) {
		return;
	}
	console.log("!");
	
	$.ajax( {
		url : "sns/main/" + page,
		type : "get",
		dataType: "json",
		data : "",
		success: function( response ) {
			//console.log(response);
			if( response.result != "success" ) {
				return 
			}
			
			if( response.data.length == 0 ) {
				isEnd = true;
				return;
			}
			++page;
			$( response.data.post ).each( function( index, vo) {
				//console.log(index + "  ++++"+ vo.title); 	
				post_render( vo );
				$( response.data.postPic[vo.postSeq]).each( function( index, vo2) {
					//console.log(index + " " + vo2.fileName); 
					postPic_render( vo2, vo );
				});
				last_render( vo );
			});
			
			return;

		},
		error: function( XHR, status, error ) {
			console.error( status + " : " + error );
		}
});
};

$(function() {
		
	$( window ).scroll(function(){
		var $window = $(this);
		var scrollTop = $window.scrollTop();
		var windowHeight = $window.height();
		var documentHeight = $(document).height();
		
		if( scrollTop + windowHeight + 10 > documentHeight ) {
			fetchList();
		}
	});
	fetchList();
});


</script>