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

				<!-- 글쓰기 버튼 까꿍 이벤트-->
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
									<option value="-1" selected>관련 여행지 없음</option>
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
								<label for="share">공유</label> <input type="radio" id="share"
									name="share" value="Y" checked data-toggle="toggle" onclick="div_share_show(this.value,'div-share-show');">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
									for="share">공유안함</label> <input type="radio" id="share"
									name="share" value="N" data-toggle="toggle" onclick="div_share_show(this.value,'div-share-show');">
							</div>
						</div>
					</div>
					<div class="form-group" id="div-share-show">
						<div class="row">
						    <div class="col-xs-5">
						        <select name="from[]" class="js-multiselect form-control" size="8" multiple="multiple">
						        	<c:forEach items="${poolpartyList }" var="poolpartyList" varStatus="status">
						        		<option value="${poolpartyList.poolSeq }">${poolpartyList.poolName }</option>
						        	</c:forEach>
						        </select>
						    </div>
						    <div class="col-xs-2">
						        <button type="button" id="js_right_All_1" class="btn btn-block"><i class="glyphicon glyphicon-forward"></i></button>
						        <button type="button" id="js_right_Selected_1" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
						        <button type="button" id="js_left_Selected_1" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
						        <button type="button" id="js_left_All_1" class="btn btn-block"><i class="glyphicon glyphicon-backward"></i></button>
						    </div>
						    <div class="col-xs-5">
						        <select name="to[]" id="js_multiselect_to_1" class="form-control" size="8" multiple="multiple"></select>
						    </div>
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
				</div>
			</form>
		</div>
	</div>
</div>


<!-- <div class="fromDatePick"></div> -->
<!-- <div class="toDatePick"></div> -->

