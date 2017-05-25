<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoOrip 임시 로그인</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<h1>Sign in/out</h1>
<hr>
<h2>${authUser.usrEmail} 님으로 로그인하고 있습니다.</h2>

<fieldset>
<legend>Select User</legend>
	<div class="controlgroup">
		<select id="email">
			<c:forEach var="loginList" items="${loginList}">
				<option>${loginList.usrEmail}</option>
			</c:forEach>
		</select>
		<button>Log in</button>
	</div>
</fieldset>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/plugins/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/plugins/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$( ".controlgroup" ).controlgroup();
	
	$('button').bind('click',function() {
		console.log("로그아웃 처리");
		$.ajax({
            url : "/poorip/user/logout",
            type : "post",
            dataType : "json",
//             data: "kwd="+$("#city-kwd").val(),
            success : function(data) {
            	console.log(data);
            }
        });
		
		console.log("로그인처리");
		$.ajax({
            url : "/poorip/user/login",
            type : "post",
            dataType : "json",
            data: "email="+$("#email").val(),
            success : function(data) {
            	console.log(data);
            }
        });
		
	});
});
</script>
</body>
</html>