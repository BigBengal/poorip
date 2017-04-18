<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/poorip/assets/bootstrap/css/bootstrap-datepicker.min.css" />
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="/poorip/assets/bootstrap/js/moment.js"></script>
<script src="/poorip/assets/bootstrap/js/transition.js"></script>
<script src="/poorip/assets/bootstrap/js/collapse.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/poorip/assets/bootstrap/js/bootstrap-datepicker.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker();
	});
</script>
<body>
닉네임 설정 및 추가 정보 저장
<br>
user/addinfosave 로 전송
<br>
<form class="navbar-form" role="search">
	<p class="navbar-text">성별</p>
	<div class="form-group">
		<input type="text" class="form-control" placeholder="Search">
	</div>
	
	<div class="btn-group" role="group" aria-label="...">
	<p class="navbar-text">언어(Language)</p>
	  <button type="button" class="btn btn-default">한국어</button>
	  <button type="button" class="btn btn-default">English</button>
	</div>

<div class="btn-group" data-toggle="buttons">
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="option1" autocomplete="off" checked> Radio 1 (preselected)
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="option2" autocomplete="off"> Radio 2
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="option3" autocomplete="off"> Radio 3
  </label>
</div>

<button type="submit" class="btn btn-default">Save</button>

</form>


<h2> asdfasdf </h2>

<form class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-sm-3" for="nickname">이름(NickName)</label>
		<div class="col-sm-8">
			<input type="text" class="form-control" id="nickname"
				placeholder="NickName">
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-3" for="language">언어(Lauguage)</label>
		<div class="btn-group col-sm-8" role="group" aria-label="language">
			<button type="button" class="btn btn-default">한국어</button>
			<button type="button" class="btn btn-default">English</button>
		</div>
	</div>
	
	<div class="container">
	    <div class="row">
	        <div class='col-sm-6'>
	            <div class="form-group">
	                <div class='input-group date' id='datetimepicker1'>
	                    <input type='text' class="form-control" />
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar" id="birthdate"></span>
	                    </span>
	                </div>
	            </div>
	        </div>
	        
	    </div>
	</div>

	<div class="form-group">
		<div class="col-sm-3"></div>
		<button type="submit" class="btn btn-default col-sm-3 center-block">Save</button>
	</div>
	</form>

</body>
</html>