<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">
	<style>
/* 	body { */
/* 		background-color: #f7f7f7; */
/* 		font-family: 'Roboto'; */
/* 	} */
	
	.container {
		margin: 150px auto;
		max-width: 400px;
	}
	
	th, td {
		padding-bottom: 5px;
	}
	
	table {
		border-spacing: 5px;
		width: 100%;
		border: 1px solid #bcbcbc;
	}
	</style>
<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/plugins/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function()	{
	console.log("STARY");
	
	$("#travelCat").val(2);
	$("#travleCty").on("change", function(){
		// value 값으로 선택
		var ctySeq = $(this).val();
		
		$.ajax( {
		    url : "/poorip/admin/getCountySeq",
		    type: "post",
		    dataType: "json",
			data: "ctySeq="+ ctySeq,
		    success: function( response ){
		    	
		    	console.log	( response );
		    	if( response.result == "fail") {
		    	   console.log( response );
		    	   return;
		    	}
		    	$("#travelCtr").val(response.data.ctrSeq);
		    },
		    error: function( XHR, status, error ){
		       console.error("ERROR");
		    }
		});
		
	});
});

</script>
</head>
<body>
	<div id="container">
		<div id="wrapper">
		<!-------------------------------------------------- 여행 정보 추가 ---------------------------------------------------------->
			<div id="content" class="full-screen">
					<form action="${pageContext.request.contextPath}/admin/upload/travel" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
	 		      		<tr>
	 		      			<th><h3>여행 정보 추가</h3></th>
	 		      		</tr>
			      		<tr>
			      			<td class="t">여행정보이름</td>
			      			<td><input type="text" size="40" name="name"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td><input type="file" name="file" id="logo-file"></td>      			
			      		</tr>
			      		<tr>
			      			<td class="t">여행 정보 내용</td>
			      			<td>
			      			<textarea rows="4" cols="50" name="contents"></textarea>
			      			</td>
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
							<td><select name="catSeq" id="travelCat">
									<c:forEach items="${cateVo }" var="cateVo" varStatus="status">
										<option value="${cateVo.catSeq }">${cateVo.catName }</option>
									</c:forEach>
							</select>
							</td>
						</tr>
						<tr>
			      			<td class="t">여행지 위치(도시)</td>
			      			<td><select name="ctySeq" id="travleCty">
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
			      			<td class="t">력서리 여부</td>
			      			<td>
			      			<input type="radio" name="luxury" value="Y"> 력셔리 OK &nbsp;&nbsp;&nbsp;
							<input type="radio" name="luxury" value="N" checked> 가난 
  		      				</td>
			      		</tr>
			      		<tr style="display:none">
			      			<td class="t">나라 SEQ</td>
			      			<td>
			      			<select name="ctrSeq" id="travelCtr">
									<c:forEach items="${countryVo }" var="countryVo" varStatus="status">
										<option value="${countryVo.ctrSeq }">${countryVo.ctrName }</option>
									</c:forEach>
							</select>
			      			</td>
			      		</tr>
			      		<tr>
			      			<td class="t">추천 여부</td>
			      			<td>
			      			<input type="checkbox" id="Recommand_blog" name="recmdBlog" value="1"> 
			      			<label for="Recommand_blog">블로그 추천</label>&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="Recommand_emo" name="recmdEmoj" value="1"> 
			      			<label for="Recommand_emo">감정 추천</label>&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="Recommand_tripad" name="recmdTripAd" value="1"> 
			      			<label for="Recommand_tripad">트립 추천</label>&nbsp;&nbsp;&nbsp;
							</td>
			      		</tr>
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="여행지 추가"></td>      			
			      		</tr>           		
			      	</table>
				</form>
			</div>
			
			<!-------------------------------------------------- 여행지 사진 추가 ---------------------------------------------------------->
			<div id="content" class="full-screen">
				<form action="${pageContext.request.contextPath}/admin/upload/travelPic" id="travelPicUpload" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
	 		      		<tr>
	 		      			<th><h3>여행지 대표 사진 등록</h3></th>
	 		      		</tr>
			      		<tr>
			      			<td class="t">여행지 사진</td>
			      			<td><input type="file" name="travelfile" multiple="multiple"></td>   			
			      		</tr>
			      		<tr>
			      			<td class="t">여행지 정보</td>
			      			<td><select name="trvSeq1">
									<c:forEach items="${travelVo }" var="travelVo" varStatus="status">
										<option value="${travelVo.trvSeq }">${travelVo.name }</option>
									</c:forEach>
							</select>
							</td>
			      		</tr>
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="사진 등록" ></td>      			
			      		</tr>           		
			      	</table>
				</form>
			</div>
			
			<!-------------------------------------------------- 후기 추가 ---------------------------------------------------------->
			<div id="content" class="full-screen">
				<form action="${pageContext.request.contextPath}/admin/upload/post" id="postUpload" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
	 		      		<tr>
	 		      			<th><h3>후기 작성</h3></th>
	 		      		</tr>
			      		<tr>
			      			<td class="t">제목</td>
			      			<td><input type="text" size="40" name="title"></td>
			      		</tr>

			      		<tr>
			      			<td class="t">후기 사진</td>
			      			<td><input type="file" name="file" multiple="multiple"></td>   			
			      		</tr>
			      		<tr>
			      			<td class="t">후기 내용</td>
			      			<td><input type="text" name="contents" id="contents"></td>
			      		</tr>
						<tr>
			      			<td class="t">후기 공개 여부</td>
			      			<td><input type="text" size="40" name="reviewPubYn"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">여행지 정보</td>
			      			<td><select name="trvSeq1">
									<c:forEach items="${travelVo }" var="travelVo" varStatus="status">
										<option value="${travelVo.trvSeq }">${travelVo.name }</option>
									</c:forEach>
							</select>
							</td>
			      		</tr>
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="후기 추가"></td>      			
			      		</tr>           		
			      	</table>
				</form>
			</div>
			
			<!-------------------------------------------------- 도시 추가 ---------------------------------------------------------->
			<div id="content" class="full-screen">
					<form action="${pageContext.request.contextPath}/admin/upload/city" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
	 		      		<tr>
	 		      			<th><h3>도시 작성</h3></th>
	 		      		</tr>
			      		<tr>
			      			<td class="t">도시 이름</td>
			      			<td><input type="text" size="40" name="ctyName"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">나라 seq</td>
			      			<td>
			      			<select name="ctrSeq2">
									<c:forEach items="${countryVo }" var="countryVo" varStatus="status">
										<option value="${countryVo.ctrSeq }">${countryVo.ctrName }</option>
									</c:forEach>
							</select>
			      			</td>
			      		</tr>
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="도시 추가"></td>      			
			      		</tr>           		
			      	</table>
				</form>
			</div>
			<!-------------------------------------------------- 나라 추가 ---------------------------------------------------------->
			<div id="content" class="full-screen">
					<form action="${pageContext.request.contextPath}/admin/upload/country" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
	 		      		<tr>
	 		      			<th><h3>나라 추가</h3></th>
	 		      		</tr>
			      		<tr>
			      			<td class="t">나라 이름</td>
			      			<td><input type="text" size="40" name="ctrName"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="나라 추가"></td>      			
			      		</tr>           		
			      	</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>