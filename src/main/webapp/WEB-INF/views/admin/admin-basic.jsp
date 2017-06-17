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
<script src="/poorip/assets/plugins/jquery.form.js"></script>

<script type="text/javascript">

function travelUpdate(trvSeq){
	$("#travel-"+trvSeq).ajaxForm({
		url: "/poorip/admin/modify/travelMainPic",
		enctype: "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
		success: function(result){
			console.log(result);
		}
	});
	// 여기까지는 ajax와 같다. 하지만 아래의 submit명령을 추가하지 않으면 백날 실행해봤자 액션이 실행되지 않는다.
	$("#travel-"+trvSeq).submit();
		
}
function travelPicInsert(trvSeq){
	$("#travelpic-"+trvSeq).ajaxForm({
		url: "/poorip/admin/upload/travelPicAjax",
		enctype: "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
		success: function(result){
			console.log(result);
		}
	});
	// 여기까지는 ajax와 같다. 하지만 아래의 submit명령을 추가하지 않으면 백날 실행해봤자 액션이 실행되지 않는다.
	$("#travelpic-"+trvSeq).submit();
		
}

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
<div style="position:fixed;top: 5px; left:10px">
<button onclick="location.href='${pageContext.request.contextPath}/admin/addInfo'">추가하기</button>
<button onclick="location.href='${pageContext.request.contextPath}/admin/basic#posi1'">여행정보로</button>
<button onclick="location.href='${pageContext.request.contextPath}/admin/basic#posi2'">후기로</button>
<button onclick="location.href='${pageContext.request.contextPath}/admin/basic#posi3'">후기사진</button>
<button onclick="location.href='${pageContext.request.contextPath}/admin/basic#posi4'">나라</button>
</div>
<table id="posi1">
	<tr>
		<th colspan="3"><h1>여행정보LIST</h1></th>
		<th>
		<button onclick="location.href='${pageContext.request.contextPath}/admin/addInfo'">추가하기</button> 
		</th>
		
	<tr>
	<tr>
		<th>seq</th>
		<th>이름</th>
		<th>여행지 사진</th>
		<th>여행지 내용</th>
		<th>시간</th>
		<th>가격</th>
		<th>catSeq</th>
		<th>도시</th>
		<th>나머지 주소</th>
		<th>mapURL</th>
		<th>연락처 정보</th>
		<th>삭제</th>
	</tr>
	<c:forEach items="${travelinfoVo }" var="travelinfoVo" varStatus="status">
		<tr id="deleteInfo-${travelinfoVo.trvSeq}">
			
			<td>${travelinfoVo.trvSeq }
			<form action="${pageContext.request.contextPath}/admin/upload/travelPicAjax" id="travelpic-${travelinfoVo.trvSeq}" method="post" enctype="multipart/form-data">
				<input type="hidden" name="trvSeq1" value="${travelinfoVo.trvSeq}">
				<input type="file" name="travelfile" multiple="multiple">
				<input type="button" value="사진추가" onclick="travelPicInsert(${travelinfoVo.trvSeq})">
			</form>
			</td>
			<form action="${pageContext.request.contextPath}/admin/modify/travelMainPic" id="travel-${travelinfoVo.trvSeq}" method="post" enctype="multipart/form-data">
			<td><input type="text" name="name" value="${travelinfoVo.name}"></td>
			<td>${travelinfoVo.picture } <br/>
					<input type="hidden" name="trvSeq" value="${travelinfoVo.trvSeq}"> 
					<input type="file" name="file">
					<input type="button" value="수정" onclick="travelUpdate(${travelinfoVo.trvSeq})">
			</td>
			<td><textarea cols="45" rows="5" name="contents">${travelinfoVo.contents}</textarea></td>
			<td><textarea cols="25" rows="5" name="hours">${travelinfoVo.hours}</textarea></td>
			<td><textarea cols="18" rows="5" name="price">${travelinfoVo.price}</textarea></td>
			<td><input type="text" name="catSeq" size="1"  value="${travelinfoVo.catSeq }"></td>
			<td><input type="text" name="ctySeq" size="1"  value="${travelinfoVo.ctySeq }"></td>
			<td><input type="text" name="location"         value="${travelinfoVo.location }"></td>
			<td><input type="text" name="mapURL" size="15" value="${travelinfoVo.mapURL }"></td>
			<td><input type="text" name="contact"          value="${travelinfoVo.contact }"></td>
			<td>
				<input type="button" value="delete" 
						onclick="travelDelete(${travelinfoVo.trvSeq})"/>
			</td>
			</form>
		</tr>
	</c:forEach>
</table>


	<table id="posi2">
		<tr>
			<th><h1>후기 LIST</h1></th>
			<th><button onclick="location.href='${pageContext.request.contextPath}/admin/addInfo'">추가하기</button> </th>
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


	<table id="posi3">
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

	<table id="posi4">
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


	<table>
		<tr>
			<th><h1>도시 LIST</h1></th>
			<th><button onclick="location.href='${pageContext.request.contextPath}/admin/addInfo'">추가하기</button> </th>
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

</body>
</html>