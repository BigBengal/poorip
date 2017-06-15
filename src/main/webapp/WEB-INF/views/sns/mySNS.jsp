<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 글 수정 -->

<div class="container" style="text-align: center;">

	<button type=button class="sns-write-button" 
		data-text="Enter text here" style="width: 600px; cursor:text;"
		data-toggle="modal" data-target="#sns-write-form">
		<img alt="수정" src="/poorip/assets/images/write-btn.png"
			class="sns-post-footer"
			style="width: 2%; display: inline-block; margin-right: 10px; margin-left: 10px;"
			data-display="mySNS--"> <span style="color: #bfbfbf;">Begin
			Writing Your Story ...</span>
	</button>
	<div id="sns-pool-list-anchor" style="position: relative;"></div>
	<div id="sns-pool-list" class="sns-pool-lists">
		<div class="sns-poollist-title" style="margin:0; padding:10px;">
			<span
				style="font-size:1em;">나의 풀 파티 목록 </span>
				   </div>
				   <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
		</div>
		<div class="modal fade" style="padding-top: 30px" id="sns-edit-form" role="dialog">
		<div class="modal-dialog" style="background-color:#f2f2f2;">
			<form class="form-horizontal" id="sns-edit-ajax"
				method="post" enctype="multipart/form-data">

				<!-- 글쓰기 버튼 까꿍 이벤트-->
				<input class="ignore" type="hidden" name="usrSeq" value="${authUser.usrSeq}">
				<input class="ignore" id="postSeq" type="hidden" name="postSeq" value=""> 
				<input class="ignore" id="postPicSeqArray" type="hidden" name="postPicSeqArray" value=""> 
				
				<div class="sns-modal-title">
					<h3>Post Edit Form</h3>
				</div>
				<div class="edit-main block" id="sns-edit">
					<div class="form-group">
						<label class="control-label col-sm-3" for="title">제목 : </label>
						<div class='col-sm-7'>
							<input type="text" class="form-control" id="edit-title"
								name="title" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="contents">내용
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
								공개 여부  </label>
							<div class='col-sm-7 text-center'>
								<label for="reviewPubYn">공개</label> <input type="radio"
									id="reviewPubYn3" name="reviewPubYn" value="Y" checked
									data-toggle="toggle">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
									for="reviewPubYn">비공개&nbsp;&nbsp;</label> <input type="radio"
									id="reviewPubYn4" name="reviewPubYn" value="N"
									data-toggle="toggle">
							</div>
						</div>
					</div>
					
			
					<div class="form-group sns-write-group sns-buttons" style="margin-left:0px; text-align:center; margin-top:50px;">
						
							<button type="submit"
								class="sns-post-footer"
								id="sns-edit-button" style="width:30%">수정하기</button>
								<button type="button" class="sns-post-footer" data-dismiss="modal" style="width:30%">닫기</button>
					</div>
				</div>
				
			</form>
		</div>
		</div>
		</div>
<!-- 글쓰기 -->

	<div class="container">
		<div class="modal fade" style="padding-top: 30px" id="sns-write-form" role="dialog">
		<div class="modal-dialog" style="background-color:#f2f2f2;">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/sns/post/upload"
				method="post" enctype="multipart/form-data">
				<input class="ignore" type="hidden" name="usrSeq" value="${authUser.usrSeq}">
				<input class="ignore" type="hidden" name="usrPic" value="${authUser.usrProfile}" id="usr-profile-pic">
				<div class="sns-modal-title">
				<h3>SNS 글 작성</h3>
				</div>
				<div class="write-main block" id="sns-write" style="margin-right: 5%;">
					<div class="form-group sns-write-group" style="margin-top:30px">
						<label class="control-label col-sm-3" for="title">제목  </label>
						<div class='col-sm-7'>
							<input type="text" class="form-control" id="title" name="title" />
						</div>
					</div>
					<div class="form-group sns-write-group">
						<label class="control-label col-sm-3" for="contents">내용
							 </label>
						<div class='col-sm-7'>
							<textarea class="form-control" id="contents" name="contents"
								rows="5"></textarea>
						</div>
					</div>
					<div class="form-group sns-write-group">
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
					<div class="form-group sns-write-group">
						<div>
							<label class="control-label col-sm-3" for="file">사진 올리기</label>
							<div class='col-sm-7'>
								<input type="file" name="file" multiple="multiple"
									style="vertical-align: bottom;">
							</div>
						</div>
					</div>
					<div class="form-group sns-write-group">
						<div class="checks">
							<label class="control-label col-sm-3" for="reviewPubYn">후기
								공개 여부  </label>
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
					<div class="form-group sns-write-group">
						<div class="checks">
							<label class="control-label col-sm-3" for="reviewPubYn">그룹
								풀 공유 여부  </label>
							<div class='col-sm-7 text-center'>
								<label for="share">공유</label> <input type="radio" id="share"
									name="share" value="Y" checked data-toggle="toggle" onclick="div_share_show(this.value,'div-share-show');">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
									for="share">공유안함</label> <input type="radio" id="share"
									name="share" value="N" data-toggle="toggle" onclick="div_share_show(this.value,'div-share-show');">
							</div>
						</div>
					</div>
					<div class="form-group sns-write-group" style="width: 100%; margin: auto; margin-left: 10%; margin-bottom: 5%;  "id="div-share-show">
						<div class="row">
						    <div class="col-xs-5" style="width:33%">
						        <select name="from[]" class="js-multiselect form-control" size="8" multiple="multiple">
						        	<c:forEach items="${poolpartyList }" var="poolpartyList" varStatus="status">
						        		<option value="${poolpartyList.poolSeq }">${poolpartyList.poolName }</option>
						        	</c:forEach>
						        </select>
						    </div>
						    <div class="col-xs-2" style="width:initial">
						        <button type="button" id="js_right_All_1" class="btn btn-block sns-share-button"><i class="glyphicon glyphicon-forward"></i></button>
						        <button type="button" id="js_right_Selected_1" class="btn btn-block sns-share-button"><i class="glyphicon glyphicon-chevron-right"></i></button>
						        <button type="button" id="js_left_Selected_1" class="btn btn-block sns-share-button"><i class="glyphicon glyphicon-chevron-left"></i></button>
						        <button type="button" id="js_left_All_1" class="btn btn-block sns-share-button"><i class="glyphicon glyphicon-backward"></i></button>
						    </div>
						    <div class="col-xs-5" style="width:33%">
						        <select name="to[]" id="js_multiselect_to_1" class="form-control" size="8" multiple="multiple"></select>
						    </div>
						</div>
					</div>
					
						<div class="form-group sns-write-group sns-buttons" style="margin-left:0px; text-align:center; margin: 5%;">
						
							<button type="submit"
								class="sns-post-footer" style="width:30%;">게시글 올리기</button>
							<button type="button" class="sns-post-footer" data-dismiss="modal" style="width:30%;">닫기</button>
						</div>
					
				</div>
				<div class="container">
					
				</div>
			</form>
			</div>
		</div>
	</div>



<!-- <div class="fromDatePick"></div> -->
<!-- <div class="toDatePick"></div> -->

