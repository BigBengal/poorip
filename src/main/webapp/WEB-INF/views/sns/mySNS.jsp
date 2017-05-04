<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 글 수정 -->
<div class="row object-non-visible " data-animation-effect="fadeIn">
	<div class="container">
		<div class="block" style="padding-top: 30px" id="sns-edit-form">
			<form class="form-horizontal" id="sns-edit-ajax"
				action="${pageContext.request.contextPath}/sns/editPost"
				method="post" enctype="multipart/form-data">
				<input class="ignore" type="hidden" name="usrSeq" value="${authUser.usrSeq}">
				<input class="ignore" id="postSeq" type="hidden" name="postSeq" value=""> 
				<input class="ignore" id="postPicSeqArray" type="hidden" name="postPicSeqArray" value=""> 
				<a href="javascript:;">
				<img onclick="showWrite();" alt="글쓰기" src="${pageContext.request.contextPath}/assets/images/write-btn.png" style="width: 30px"></a>
				<div class="write-main block" id="sns-edit" style="display: none;">
					<div class="form-group">
						<label class="control-label col-sm-3" for="title">제목 : </label>
						<div class='col-sm-7'>
							<input type="text" class="form-control" id="edit-title"
								name="title" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="contents">contents
							: </label>
						<div class='col-sm-7'>
							<textarea class="form-control" id="edit-contents" name="contents"
								rows="5"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="selectbox">
							<label class="control-label col-sm-3" for="trvSeq">관련 여행지
								선택</label>
							<div class='col-sm-7'>
								<select class="form-control" id="sns-trv-seq" name="trvSeq">
									<option value="-1" selected>관련 여행지 선택</option>
									<c:forEach items="${travelVo }" var="travelVo"
										varStatus="status">
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
								<input type="file" name="fileName" multiple="multiple"
									style="vertical-align: bottom;">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="checks">
							<label class="control-label col-sm-3" for="reviewPubYn">후기
								공개 여부 : </label>
							<div class='col-sm-7 text-center'>
								<label for="reviewPubYn">공개</label> <input type="radio"
									id="reviewPubYn" name="reviewPubYn" value="Y" checked
									data-toggle="toggle">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
									for="reviewPubYn">비공개&nbsp;&nbsp;</label> <input type="radio"
									id="reviewPubYn" name="reviewPubYn" value="N"
									data-toggle="toggle">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="checks">
							<label class="control-label col-sm-3" for="reviewPubYn">그룹
								풀 공유 여부 : </label>
							<div class='col-sm-7 text-center'>
								<label for="hidden">공유</label> <input type="radio" id="hidden"
									name="hidden" value="Y" checked data-toggle="toggle">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
									for="hidden">공유안함</label> <input type="radio" id="hidden"
									name="hidden" value="N" data-toggle="toggle">
							</div>
						</div>
					</div>
					<div class="form-group">
						<select multiple="multiple" id="my-select" name="my-select[]">
							<option value='elem_1'>elem 1</option>
							<option value='elem_2'>elem 2</option>
							<option value='elem_3'>elem 3</option>
							<option value='elem_4'>elem 4</option>

							<option value='elem_100'>elem 100</option>
						</select>
					</div>
					<div class="form-group-button">
						<div class="col-md-12" style="padding-left: 40%">
							<button type="submit"
								class="btn btn-default col-lg-6 center-block"
								id="sns-edit-button">수정하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 글쓰기 -->
<div class="row object-non-visible " data-animation-effect="fadeIn">
	<div class="container">
		<div class="block" style="padding-top: 30px">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/sns/post/upload"
				method="post" enctype="multipart/form-data">
				<input class="ignore" type="hidden" name="usrSeq" value="${authUser.usrSeq}">

				<div class="write-main block" id="sns-write" style="display: none;">
					<div class="form-group">
						<label class="control-label col-sm-3" for="title">제목 : </label>
						<div class='col-sm-7'>
							<input type="text" class="form-control" id="title" name="title" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="contents">contents
							: </label>
						<div class='col-sm-7'>
							<textarea class="form-control" id="contents" name="contents"
								rows="5"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="selectbox">
							<label class="control-label col-sm-3" for="trvSeq">관련 여행지
								선택</label>
							<div class='col-sm-7'>
								<select class="form-control" name="trvSeq">
									<option value="-1" selected>관련 여행지 선택</option>
									<c:forEach items="${travelVo }" var="travelVo"
										varStatus="status">
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
								<input type="file" name="file" multiple="multiple"
									style="vertical-align: bottom;">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="checks">
							<label class="control-label col-sm-3" for="reviewPubYn">후기
								공개 여부 : </label>
							<div class='col-sm-7 text-center'>
								<label for="reviewPubYn">공개</label> <input type="radio"
									id="reviewPubYn" name="reviewPubYn" value="Y" checked
									data-toggle="toggle">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
									for="reviewPubYn">비공개&nbsp;&nbsp;</label> <input type="radio"
									id="reviewPubYn" name="reviewPubYn" value="N"
									data-toggle="toggle">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="checks">
							<label class="control-label col-sm-3" for="reviewPubYn">그룹
								풀 공유 여부 : </label>
							<div class='col-sm-7 text-center'>
								<label for="hidden">공유</label> <input type="radio" id="hidden"
									name="hidden" value="Y" checked data-toggle="toggle">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
									for="hidden">공유안함</label> <input type="radio" id="hidden"
									name="hidden" value="N" data-toggle="toggle">
							</div>
						</div>
					</div>
					
					<div class="ms-container" id="ms-pre-selected-options" style="margin:auto;">
						<div class="ms-selectable">
							<ul class="ms-list" tabindex="-1">
								<li  class="ms-elem-selectable " 
									id="-1300566143-selectable"><span>elem
										1</span></li>
								<li class="ms-elem-selectable" id="-1300566142-selectable"><span>elem
										2</span></li>
								<li class="ms-elem-selectable" id="-1300566141-selectable"><span>elem
										3</span></li>
								<li  class="ms-elem-selectable"
									id="-1300566140-selectable"><span>elem
										4</span></li>
								<li class="ms-elem-selectable" id="-8578751-selectable"><span>elem
										100</span></li>
							</ul>
						</div>
						<div class="ms-selection">
							<ul class="ms-list" tabindex="-1">
								<li class="ms-elem-selection"
									id="-1300566143-selection" style="display: none;"><span>elem 1</span></li>
								<li class="ms-elem-selection" id="-1300566142-selection"
									style="display: none;"><span>elem 2</span></li>
								<li class="ms-elem-selection" id="-1300566141-selection"
									style="display: none;"><span>elem 3</span></li>
								<li  class="ms-elem-selection"
									id="-1300566140-selection" style="display: none;"><span>elem 4</span></li>
								<li class="ms-elem-selection" id="-8578751-selection"
									style="display: none;"><span>elem 100</span></li>
							</ul>
						</div>
					</div>
					<div class="form-group-button">
						<div class="col-md-12" style="padding-left: 40%">
							<button type="submit"
								class="btn btn-default col-lg-6 center-block">게시글 올리기</button>
						</div>
					</div>
				</div>
				<div class="container">
					<div id="my-sns-list" class="block" style="padding-top: 100px">
					</div>
					<!-- 						<div class="loading"> -->
					<!-- 						</div> -->
				</div>
			</form>
		</div>
	</div>
</div>

<!-- <div class="fromDatePick"></div> -->
<!-- <div class="toDatePick"></div> -->
