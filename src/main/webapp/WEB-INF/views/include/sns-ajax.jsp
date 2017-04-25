<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var fetchList = function() {
	if( isEnd == true ) {
		return;
	}
	console.log("!");
	++page;
	$ajax( {
		url : "/sns/main",
		type : "get",
		dataType: "json",
		data : "",
		success: function( response ) {
			if( response.result != "success" ); {
				console.log( response.message );
				return;
			}
			
			if( response.data.length == 0 ) {
				isEnd = true;
				return;
			}
		
			$( response.data ).each( function(index, postVo) {
				var html = "<p>" + postVo.title +
						   "<p>" + postVo.title +
						   "<p>" + postVo.title +
						   "<p>" + postVo.title +
						   "<p>" + postVo.title +
						   "<p>";
				   
				 $("#my-sns-list").append(html);
			});
		},
		error: function( XHR, status, error ) {
			console.error( status + " : " + error );
		}
	});
}
</script>