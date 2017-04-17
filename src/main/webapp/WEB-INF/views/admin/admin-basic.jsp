<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="container">
<%-- 		<c:import url="/WEB-INF/views/include/blogheader.jsp" /> --%>
		<div id="wrapper">
			<div id="content" class="full-screen">
<%-- 				<c:import url="/WEB-INF/views/include/blognavigation.jsp" /> --%>
<%-- 				<form action="${pageContext.request.contextPath}/${authUser.userId}/admin/basic/upload" method="post" enctype="multipart/form-data"> --%>
	 		      	<form action="${pageContext.request.contextPath}/admin/basic/upload" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
			      		<tr>
			      			<td class="t">여행정보이름</td>
			      			<td><input type="text" value="${bvo.title }" size="40" name="title"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">로고이미지</td>
			      			<td><img src="${pageContext.request.contextPath}/list/${bvo.logo }"></td>      			
			      		</tr>      		
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td><input type="file" name="file" id="logo-file"></td>      			
			      		</tr>           		
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="기본설정 변경"></td>      			
			      		</tr>           		
			      	</table>
				</form>
			</div>
		</div>
<%-- 		<c:import url="/WEB-INF/views/include/footer.jsp" /> --%>
	</div>
</body>
</html>