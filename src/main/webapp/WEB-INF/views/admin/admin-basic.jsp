<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
th,td{padding: 5px;}
table {
	border-spacing: 5px;
	border: 1px solid #bcbcbc;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

function travelDelete(trvSeq){
	$.ajax( {
		url : "/poorip/admin/deleteInfo",
		type: "post",
	    dataType: "json",
	    data: "trvSeq="+trvSeq,
	    success: function( response ){
	    	if( response.result != "success" ) {
	    		console.log( response.message );
	    		return;
	    	} else {
	    		$("#deleteInfo-"+response.data).remove();
	    		return;
	    	} 
	    },
	    error: function( XHR, status, error ){
	       console.error("Error" );
	   	}
    });
}

function postDelete(postSeq){
	$.ajax( {
		url : "/poorip/admin/deletePost",
		type: "post",
	    dataType: "json",
	    data: "postSeq="+postSeq,
	    success: function( response ){
	    	if( response.result != "success" ) {
	    		console.log( response.message );
	    		return;
	    	} else {
	    		$("#deletePost-"+response.data).remove();
	    		return;
	    	} 
	    },
	    error: function( XHR, status, error ){
	       console.error("Error" );
	   	}
    });
}

function postPicDelete(postPicSeq){
	$.ajax( {
		url : "/poorip/admin/deletePostPic",
		type: "post",
	    dataType: "json",
	    data: "postPicSeq="+postPicSeq,
	    success: function( response ){
	    	if( response.result != "success" ) {
	    		return;
	    	} else {
	    		$("#deletePostPic-"+response.data).remove();
	    		return;
	    	} 
	    },
	    error: function( XHR, status, error ){
	       console.error("Error" );
	   	}
    });
}

function countryDelete(ctrSeq){
	$.ajax( {
		url : "/poorip/admin/deleteCountry",
		type: "post",
	    dataType: "json",
	    data: "ctrSeq="+ctrSeq,
	    success: function( response ){
	    	if( response.result != "success" ) {
	    		console.log( response.message );
	    		return;
	    	} else {
	    		$("#deleteCountry-"+response.data).remove();
	    		return;
	    	} 
	    },
	    error: function( XHR, status, error ){
	       console.error("Error" );
	   	}
    });
}

function cityDelete(ctySeq){
	$.ajax( {
		url : "/poorip/admin/deleteCity",
		type: "post",
	    dataType: "json",
	    data: "ctySeq="+ctySeq,
	    success: function( response ){
	    	if( response.result != "success" ) {
	    		console.log( response.message );
	    		return;
	    	} else {
	    		$("#deleteCity-"+response.data).remove();
	    		return;
	    	} 
	    },
	    error: function( XHR, status, error ){
	       console.error("Error" );
	   	}
    });
}

</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/addInfo" id="travelList">
	<table>
		<tr>
			<th><h1>여행정보LIST</h1></th>
			<th><input type="submit" value="추가하기"></th>
		<tr>
		<tr>
			<th>seq</th>
			<th>이름</th>
			<th>여행지 사진</th>
			<th>여행지 내용</th>
			<th>영업/개장시간</th>
			<th>가격</th>
			<th>여행지 테마</th>
			<th>여행지 위치(도시)</th>
			<th>나머지 주소</th>
			<th>mapURL</th>
			<th>연락처 정보</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${travelinfoVo }" var="travelinfoVo" varStatus="status">
			<tr id="deleteInfo-${travelinfoVo.trvSeq}">
				<td>${travelinfoVo.trvSeq }</td>
				<td>${travelinfoVo.name }</td>
				<td>${travelinfoVo.picture }</td>
				<td>${travelinfoVo.contents }</td>
				<td>${travelinfoVo.hours }</td>
				<td>${travelinfoVo.price }</td>
				<td>${travelinfoVo.catSeq }</td>
				<td>${travelinfoVo.ctySeq }</td>
				<td>${travelinfoVo.location }</td>
				<td>${travelinfoVo.mapURL }</td>
				<td>${travelinfoVo.contact }</td>
				<td>
				<input type="button" value="delete" 
						onclick="travelDelete(${travelinfoVo.trvSeq})"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</form>

<form action="${pageContext.request.contextPath}/admin/addInfo" id="travelList">
	<table>
		<tr>
			<th><h1>후기 LIST</h1></th>
			<th><input type="submit" value="추가하기"></th>
		<tr>
		<tr>
			<th>seq</th>
			<th>제목</th>
			<th>내용</th>
			<th>공개여부</th>
			<th>사용자 SEQ</th>
			<th>여행정보 SEQ</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${postVo }" var="postVo" varStatus="status">
			<tr id="deletePost-${postVo.postSeq}">
				<td>${postVo.postSeq }</td>
				<td>${postVo.title }</td>
				<td>${postVo.contents }</td>
				<td>${postVo.reviewPubYn }</td>
				<td>${postVo.usrSeq }</td>
				<td>${postVo.trvSeq }</td>
				<td>
				<input type="button" value="delete" 
						onclick="postDelete(${postVo.postSeq})"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</form>

<form action="" id="postPicList">
	<table>
		<tr>
			<th><h1>후기 사진 LIST</h1></th>
		<tr>
		<tr>
			<th>seq</th>
			<th>경로</th>
			<th>파일이름</th>
			<th>포스트seq</th>
			<th>생성일</th>
		</tr>
		<c:forEach items="${postPicVo }" var="postPicVo" varStatus="status">
			<tr id="deletePostPic-${postPicVo.postPicSeq}">
				<td>${postPicVo.postPicSeq }</td>
				<td>${postPicVo.path }</td>
				<td>${postPicVo.fileName }</td>
				<td>${postPicVo.postSeq }</td>
				<td>${postPicVo.crtDate }</td>
				<td>
				<input type="button" value="delete" 
						onclick="postPicDelete(${postPicVo.postPicSeq})"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</form>

<form action="${pageContext.request.contextPath}/admin/addCountry" id="countryList">
	<table>
		<tr>
			<th><h1>나라 LIST</h1></th>
		<tr>
		<tr>
			<th>seq</th>
			<th>나라이름</th>
		</tr>
		<c:forEach items="${countryVo }" var="countryVo" varStatus="status">
			<tr id="deleteCountry-${countryVo.ctrSeq}">
				<td>${countryVo.ctrSeq }</td>
				<td>${countryVo.ctrName }</td>
				<td>
				<input type="button" value="delete" 
						onclick="countryDelete(${countryVo.ctrSeq})"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</form>

<form action="${pageContext.request.contextPath}/admin/addInfo" id="cityList">
	<table>
		<tr>
			<th><h1>도시 LIST</h1></th>
			<th><input type="submit" value="추가하기"></th>
		<tr>
		<tr>
			<th>seq</th>
			<th>도시 이름</th>
 			<th>나라Seq</th>
		</tr>
		<c:forEach items="${cityVo }" var="cityVo" varStatus="status">
			<tr id="deleteCity-${cityVo.ctySeq}">
				<td>${cityVo.ctySeq }</td>
				<td>${cityVo.ctyName }</td>
 				<td>${cityVo.ctrSeq }</td> 
				<td>
				<input type="button" value="delete" 
						onclick="cityDelete(${cityVo.ctySeq})"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</form>

</body>
</html>