<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>poorip</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<style>
body { background-color:#f7f7f7; font-family:'Roboto';}
.container { margin:150px auto; max-width:400px;}
</style>

<script>
var dialogDeleteForm = null;
var isEnd = false;
var render = function( vo, prepend ){
	var html = "<li id='li-"+ vo.trvSeq + "'>" +
			   "<strong>" + vo.name + "</strong>" +
			   "<strong>" + vo.picture + "</strong>" +
			   "<strong>" + vo.hours + "</strong>" +
			   "<strong>" + vo.ctySeq + "</strong>" +
			   "<strong>" + vo.location + "</strong>" +
			   "<strong>" + vo.price + "</strong>" +
			   "<p>" + vo.contents + "</p>" +
			   "<strong>" + vo.contact + "</strong>" +
			   "<strong>" + vo.mapURL + "</strong>" +
			   "<strong>" + vo.catSeq + "</strong>" +
			   "<a href='' title='삭제' data-no=' " + vo.trvSeq + "'>삭제</a>" +
			   "</li>";
	
	if( prepend == true ) {
		$( "#list" ).prepend( html );
	} else {
		$( "#list" ).append( html );
	}
}

var fetchList = function(){
	if( isEnd == true ) {
		return;
	}
	console.log( "!" );
	++page;
	$.ajax( {
		url : "/poorip/adminAJAX/list",
		type: "get",
	    dataType: "json",
	    data: "",
	    success: function( response ){
	    	if( response.result != "success" ) {
	    		console.log( response.message );
	    		return;
	    	} 
	    	
	    	if( response.data.length == 0 ) {
	    		isEnd = true;
	    		return;	
	    	}
	    	
	    	$( response.data ).each( function(index, vo){
	    		render( vo, false );
	    	});
	    },
	    error: function( XHR, status, error ){
	       console.error( status + " : " + error );
	   	}
  });
}

</script>

</head>
<body>
	<div id="container">
		<div id="wrapper">
			<div id="content" class="full-screen">
					<form action="${pageContext.request.contextPath}/admin/addTravel/upload" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
			      		<tr>
			      			<td class="t">여행정보이름</td>
			      			<td><input type="text" size="40" name="name"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">여행지 사진</td>
			      			<td><img src="${pageContext.request.contextPath}/list/${tvo.picture }"></td>      			
			      		</tr>      		
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td><input type="file" name="file" id="logo-file"></td>      			
			      		</tr>
			      		<tr>
			      			<td class="t">여행 정보 내용</td>
			      			<td><input type="text" size="40" name="contents"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">영업/개장 시간</td>
			      			<td><input type="text"size="40" name="hours"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">가격</td>
			      			<td><input type="text"size="40" name="price"></td>
			      		</tr>
						<tr>
							<td class="t">여행지 테마(카테고리)</td>
							<td><select name="catSeq">
									<c:forEach items="${cateVo }" var="cateVo" varStatus="status">
										<option value="${cateVo.catSeq }">${cateVo.catName }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
			      			<td class="t">여행지 위치(도시)</td>
			      			<td><select name="ctySeq">
									<c:forEach items="${cityVo }" var="cityVo" varStatus="status">
										<option value="${cityVo.ctySeq }">${cityVo.ctyName }</option>
									</c:forEach>
								</select>
							</td>
			      		</tr>
						<tr>
			      			<td class="t">나머지 주소</td>
			      			<td><input type="text" size="40" name="location"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">mapURL</td>
			      			<td><input type="text" size="40" name="mapURL"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">여행지 연락처 정보</td>
			      			<td><input type="text" size="40" name="contact"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="여행지 추가"></td>      			
			      		</tr>           		
			      	</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>