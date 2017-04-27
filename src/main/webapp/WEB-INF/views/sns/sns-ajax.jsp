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
	var post_html = "<tr id='title-" + vo.postSeq + "'><td style='width: 20%'>" + vo.postSeq + "</td>" +
			   		"<td style='width: 80%'>" + vo.title + "</td></tr>";

		 		    $( "#my-sns-list" ).append(post_html);
}

var postPic_render = function(vo2, vo) {
	var postPic_html = "<tr id='post-pic-" + vo.postSeq + "'><td colspan='2'>" + vo2.fileName + "</td></tr>";

					   $( "#title-"+vo.postSeq ).append(postPic_html);
}

var last_render = function(vo) {
	var last_html = "<tr><td colspan='2'>" + vo.contents + "</td></tr>" +
					"<tr><td colspan='2' style='text-align: right;'>" + vo.crtDate + "</td></tr>" +
	   				"<tr><td colspan='2' style='text-align: right;'><a href='' title='삭제' data-no=' " + vo.postSeq + "'>삭제</a></td></tr>";

					$("#post-pic-"+vo.postSeq).append(last_html);
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