<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row object-non-visible" data-animation-effect="fadeIn">
	<div class="col-md-12">
		<div class="filters text-center">
			<form class="form-horizontal" name="write-form" action="${pageContext.request.contextPath}/sns/post/upload" id="postUpload" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label class="control-label col-sm-3" for="title">제목</label>
					<div class='col-sm-8'>
						<input type='text' class="form-control" id="title">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="contents">내용</label>
					<div class='col-sm-8'>
						<textarea class="form-control" id="contents" name="contents" rows="3">
						</textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="option">공개여부</label>
					<div class="btn-group col-sm-7" data-toggle="buttons">
						<input type="radio" name="reviewPubYn" value="Y" id="reviewPubYn1" autocomplete="off"> On
						<input type="radio" name="reviewPubYn" value="N" id="reviewPubYn2" autocomplete="off"> Off
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="trvSeq1">관련 여행지</label>
					<div class='col-sm-8' >
						<select name="trvSeq1" style="width: 100%;">
							<c:forEach items="${travelVo }" var="travelVo" varStatus="status">
								<option value="${travelVo.trvSeq }">${travelVo.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="file">사진 올리기</label>
					<div class='col-sm-8'>
						<input type="file" name="file" multiple="multiple">
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-3"></div>
					<button type="submit"
						class="btn btn-default col-lg-6">게시글 올리기</button>
					<div class="col-lg-3"></div>
				</div>
			</form>
			<table id="my-sns-list">
			</table>
			
		</div>
	</div>
</div>