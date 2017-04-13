<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoOrip에 오신것을 환영합니다!</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
	integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd"
	crossorigin="anonymous">
<style>
body {
	background-color: #f7f7f7;
}

.container {
	margin: 150px auto;
}
</style>
</head>
<body>
	<div id="jquery-script-menu">
	</div>
	<div class="container">
		<h1>♡가고싶은 여행지를 검색하세요♡</h1>
		<form id="search_form" action="${pageContext.request.contextPath}/poolparty/poolsearch" method="get">
			<input type="text" style="margin-bottom: 1em;" placeholder="Search..."
				class="form-control" id="kwd" name="kwd">
			<input type="submit" value="find">
			<ul class="list-group">
				<li class="item list-group-item list-group-item-success"
					data-type="Madrid Spain">Madrid, Spain</li>
				<!-- <li class="item list-group-item list-group-item-info"
					data-type="Edinburgh Scotland">Edinburgh, Scotland</li>
				<li class="item list-group-item list-group-item-warning"
					data-type="Paris France">Paris, France</li>
				<li class="item list-group-item list-group-item-danger"
					data-type="Prague Czech Republic">Prague, Czech Republic</li>
				<li class="item list-group-item list-group-item-success"
					data-type="Venice Italy">Venice, Italy</li>
				<li class="item list-group-item list-group-item-info"
					data-type="Istanbul Turkey">Istanbul, Turkey</li>
				<li class="item list-group-item list-group-item-warning"
					data-type="Budapest Hungary">Budapest, Hungary</li>
				<li class="item list-group-item list-group-item-danger"
					data-type="San Sebastián Spain">San Sebastián, Spain</li> -->
			</ul>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
	<script src="js/jsearch.js"></script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
</html>
