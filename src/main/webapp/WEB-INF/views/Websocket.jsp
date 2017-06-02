<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>
	<script
	src="${pageContext.request.contextPath }/assets/js/sockjs.min.js"></script>
	<script>

$(document).ready(function() {
	var sock = null;
	$(document).ready(function() {
		
		
		sock = new SockJS("/poorip/echo-ws");
		sock.onopen = function() {
			sock.send("반갑습니다");
		}
		
		sock.onmessage = function(evt) {
			$("#chatMessage").append(evt.data + "<br/>");
		}
		
		sock.onclose = function() {
			sock.send("퇴장");
		}
		
		$("#sendMessage").click(function() {
			if($("#message").val() != "") {
				sock.send($("#message").val());
				$("#chatMessage").append("나 -- >" + $("#message").val() + "<br/>");
				
				$("message").val("");
			}
			
		})
	});
});
</script>
</head>
<body>
<input type="text" id="message"/>
<input type="button" id="sendMessage" value="메세지 보낵"/>

<div id="chatMessage" style="overflow:auto; max-height:500px;"></div>


</body>
</html>
