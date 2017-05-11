<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container col-md-12">
<!-- 글 작성 -->
	<form class="form-horizontal"
		action="${pageContext.request.contextPath}/poolparty/post" method="post" enctype="multipart/form-data">
		<input class="ignore" type="hidden" id="authuser" name="usrSeq" value="${authUser.usrSeq}">
		<input class="ignore" type="hidden" name="poolSeq" value="${pool.poolSeq}">
		<div class="col-sm-1 img_inline menu_links" onclick="showWrite();">
			<img alt="글쓰기" src="${pageContext.request.contextPath}/assets/images/post_write.png">
		</div>
		<div class="write-main block" id="post-write" style="display: none;">
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목 : </label>
				<div class='col-sm-7'>
					<input type="text" class="form-control" id="title" name="title" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="contents">contents : </label>
				<div class='col-sm-7'>
					<textarea class="form-control" id="contents" name="contents" rows="5"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="selectbox">
					<label class="control-label col-sm-3" for="trvSeq">관련 여행지 선택</label>
					<div class='col-sm-7'>
						<select class="form-control" name="trvSeq">
							<option value="-1" selected>관련 여행지 선택</option>
							<c:forEach items="${travelVo }" var="travelVo" varStatus="status">
								<option value="${travelVo.trvSeq }">${travelVo.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
					<div>
						<label class="control-label col-sm-3" for="file">사진 올리기</label>
						<div class='col-sm-7'>
							<input type="file" name="file" multiple="multiple" style="vertical-align: bottom;">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="checks">
						<label class="control-label col-sm-3" for="reviewPubYn">후기 공개 여부 : </label>
						<div class='col-sm-7 text-center'>
							<label for="reviewPubYn">공개</label> 
							<input type="radio"	id="reviewPubYn" name="reviewPubYn" value="Y" checked data-toggle="toggle">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<label for="reviewPubYn">비공개&nbsp;&nbsp;</label> 
						<input type="radio"	id="reviewPubYn" name="reviewPubYn" value="N" data-toggle="toggle">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="checks">
					<label class="control-label col-sm-3" for="reviewPubYn">개인 SNS 등록 여부 : </label>
					<div class='col-sm-7 text-center'>
						<label for="hidden">등록</label> 
						<input type="radio" id="hidden"	name="hidden" value="N" checked data-toggle="toggle">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<label	for="hidden">미등록</label> 
						<input type="radio" id="hidden" name="hidden" value="Y" data-toggle="toggle">
					</div>
				</div>
			</div>
			<div class="form-group-button">
				<div class="col-md-12" style="padding-left: 40%">
					<button type="submit" class="btn btn-default col-lg-6 center-block">게시글 올리기</button>
				</div>
			</div>
		</div>

	</form>
<!-- 글 수정 -->
<div style="display: none;">
<div id="modifyform" style="display: none;">
<form class="form-horizontal"
		action="${pageContext.request.contextPath}/poolparty/update" method="post" enctype="multipart/form-data">
		<input class="ignore" type="hidden" name="usrSeq" value="${authUser.usrSeq}">
		<input class="ignore" type="hidden" name="poolSeq" value="${pool.poolSeq}">
		<input class="ignore" type="hidden" id="update-postSeq" name="postSeq" value="">
		<div class="write-main block" id="post-modify">
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목 : </label>
				<div class='col-sm-7'>
					<input type="text" class="form-control" id="update-title" name="title" value=""/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="contents">contents : </label>
				<div class='col-sm-7'>
					<textarea class="form-control" id="update-contents" name="contents" rows="5"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="selectbox">
					<label class="control-label col-sm-3" for="trvSeq">관련 여행지 선택</label>
					<div class='col-sm-7'>
						<select class="form-control" id="update-trv-seq" name="trvSeq">
							<option value="-1" selected>관련 여행지 선택</option>
							<c:forEach items="${travelVo }" var="travelVo" varStatus="status">
								<option value="${travelVo.trvSeq }">${travelVo.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
					<div>
						<label class="control-label col-sm-3" for="file">사진 올리기</label>
						<div class='col-sm-7'>
							<input type="file" name="file" multiple="multiple" style="vertical-align: bottom;">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="checks">
						<label class="control-label col-sm-3" for="reviewPubYn">후기 공개 여부 : </label>
						<div class='col-sm-7 text-center'>
							<label for="reviewPubYn">공개</label> 
							<input type="radio"	id="update-reviewPubYn-y" name="reviewPubYn" value="Y" checked data-toggle="toggle">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<label for="reviewPubYn">비공개&nbsp;&nbsp;</label> 
						<input type="radio"	id="update-reviewPubYn-n" name="reviewPubYn" value="N" data-toggle="toggle">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="checks">
					<label class="control-label col-sm-3" for="reviewPubYn">개인 SNS 등록 여부 : </label>
					<div class='col-sm-7 text-center'>
						<label for="hidden">등록</label> 
						<input type="radio" id="update-hidden-n" name="hidden" value="N" checked data-toggle="toggle">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<label	for="hidden">미등록</label> 
						<input type="radio" id="update-hidden-y" name="hidden" value="Y" data-toggle="toggle">
					</div>
				</div>
			</div>
			<div class="form-group-button">
				<div class="col-md-12" style="padding-left: 40%">
					<button type="submit" class="btn btn-default col-lg-6 center-block">게시글 수정</button>
				</div>
			</div>
		</div>

	</form>
</div>
</div>
</div>