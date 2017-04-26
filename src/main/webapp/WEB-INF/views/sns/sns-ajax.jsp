<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var dialogDeleteForm = null;
var isEnd = false;
var page = 0;
var render = function( vo ) {
	var html = "<tr><th> postSeq </th>" +
			   "<td>" + vo.postSeq + "</td></tr>" +
			   "<tr><th> 내용  </th>" +
			   "<td>" + vo.contents + "</td></tr>" +
			   "<tr><th> 작성일  </th>" +
			   "<td>" + vo.crtDate + "</td></tr>";
	   
	 
		   $( "#my-sns-list" ).append(html);
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
			
			if( response.result != "success" ) {
				return 
			}
			
			if( response.data.length == 0 ) {
				isEnd = true;
				return;
			}
			++page;
			$( response.data ).each( function( index, vo) {
					render( vo );
			});
			return;

		},
		error: function( XHR, status, error ) {
			console.error( status + " : " + error );
		}
});
};

$(function() {
	$("#write-form").submit(function(event) {
		event.preventDefault();
		
		/* ajax 입력 */
		$.ajax( {
			url : "sns/post/upload",
			type: "post",
		    dataType: "json",
		    data: "title=" + $("input[title='title']").val() + "&" + 
		          "content=" + $('textarea').val() + "&" + 
		          "reviewPubYn=" + $("input[name='reviewPubYn']").val() + "&" +
		          "trvSeq=" + $("input[name='trvSeq1']").val() + "&" + 
		          "file=" + $("input[name='file']").val() + "&" +
		          "hidden=" + $("input[name='hidden']").val(),
		          
		    success: function( response ){
				console.log( response );
				render( response.data, true );
		    },
		    error: function( XHR, status, error ){
		       console.error( status + " : " + error );
		   	}
	    });
		
		return false;
	});
	
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