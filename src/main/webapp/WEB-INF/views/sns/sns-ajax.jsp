<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var dialogDeleteForm = null;
var isEnd = false;
var page = 0;
var globalPostSeq = 0;
var delta = 300;
var timer = null;

var post_render = function( vo ) {
		
	var post_html = "<div class='form-group' id='first-html-" + vo.postSeq + "'>" + 
						"<p class='col-sm-2'>" + vo.postSeq + "</p>" +
				   		"<p class='col-sm-10 text-center' style='font-size: 20px'><strong>" + vo.title + "</strong></p>" +
			   		"</div>" +
			   		"<div class='form-group' id='middle-html-" + vo.postSeq + "'>" +
					"<div class='col-md-offset-4'>" +
				   		"<p class='col-md-12'>" + 
				   			"<div class='cycle-slideshow'" +
					   			"data-cycle-fx='scrollHorz'" +
					   			"data-cycle-timeout='0'" +
					   			"data-cycle-prev='prev'" +
					   			"data-cycle-next='#next'" +
								">";

		 		    $( "#my-sns-list" ).append(post_html);
}

var postPic_render = function(vo2) {
	var postPic_html = "<img src='/poorip" + vo2.path + "/" + vo2.fileName + " 'width='500px'>" + vo2.postPicSeq;
					   $( "#my-sns-list" ).append(postPic_html);
}

var last_render = function(vo) {
	var last_html = "</div>" +
						"<div class='text-center'>" +
				   		"<a herf=# id='prev'> ! </a>" +
				   		"<a herf=# id='nexr'> < </a>" +
						"</div>" +
					"</p>" +
				"</div>" +
				"</div>" + 
		
		"<div class='form-group'>" +
						"<p class='col-md-12 text-center' style='font-size: 15px'>" + vo.contents + "</p>" +
					"</div>" + 
					"<div class='form-group'>" +
						"<p class='col-md-7'> </p>" +
						"<p class='col-md-5' align='left'>" + vo.crtDate + "</p>" +
					"</div>" +
					"<div class='form-group'>" +
						"<p class='col-md-4' align='left' data-postSeq='" + vo.postSeq + "'><img alt='삭제' src='/poorip/assets/images/delete-btn.png' style='width: 30px'></p>" +
		   				"<p class='col-md-4' align='center'><img alt='공유' src='/poorip/assets/images/share-btn.png' style='width: 30px'></p>" +
		   				"<p class='col-md-4' align='right'><img alt='수정' src='/poorip/assets/images/write-btn.png' style='width: 30px'></p>" + 
	   				"</div>";

					$("#my-sns-list").append(last_html);
} 

var fetchList = function() {
	if( isEnd == true ) {
		$("#loading").removeClass("lb-cancel");
		return;
	}
	
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
			
			$( response.data.post ).each( function( index, vo) {
				//console.log(index + "  ++++"+ vo.title);
				console.log(globalPostSeq + "," + vo.postSeq + ", page : "+ page);
				if ( globalPostSeq != 0 && globalPostSeq <= vo.postSeq ){
					return;
				}
				console.log("여기서 한번 시작")
				post_render( vo );
				
				$( response.data.postPic[vo.postSeq]).each( function( index, vo2) {
					console.log("여기서 사진")
					postPic_render(vo2);
// 					console.log(vo2);
// 					console.log("yyy"+ response.data.postPic[vo.postSeq][index].postPicSeq);
				});
				last_render( vo );
				console.log("여기서 한번 마지막")
				
				globalPostSeq = vo.postSeq;
			});
			page++;
			$("#loading").removeClass("lb-cancel");
			return;

		},
		error: function( XHR, status, error ) {
			console.error( status + " : " + error );
		}
});
};

$(function() {
	
	$( window ).on( 'scroll', function( ) {
		clearTimeout( timer );
	    
	    var $window = $(this);
		var scrollTop = $window.scrollTop();
		var windowHeight = $window.height();
		var documentHeight = $(document).height();
		
		if( scrollTop + windowHeight + 10 >= documentHeight ) {
			$("#loading").addClass("lb-cancel");
			timer = setTimeout( fetchList, delta );
		}
   
	} );

});


</script>