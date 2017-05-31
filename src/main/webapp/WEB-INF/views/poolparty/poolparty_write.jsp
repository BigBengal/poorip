<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container" style="text-align: center;">

	
	<!-- 글 작성 -->

	<div class="container">
		<div class="modal fade" style="padding-top: 30px" id="sns-write-form2"
			role="dialog">
			<div class="modal-dialog">
			<div class="modal-content">
				<form class="form-horizontal"
					action="${pageContext.request.contextPath}/poolparty/post"
					method="post" enctype="multipart/form-data">
					<input class="ignore" type="hidden" name="usrSeq"
						value="${authUser.usrSeq}">
						<input class="ignore" type="hidden" name="poolSeq" value="${pool.poolSeq}">
					<div class="sns-modal-title">
						<h3>Pool Post Write Form</h3>
					</div>
					<div class="write-main block" id="sns-write2"
						style="margin-right: 5%;">
						<div class="form-group sns-write-group" style="margin-top: 30px">
							<label class="control-label col-sm-3" for="title">제목 </label>
							<div class='col-sm-7'>
								<input type="text" class="form-control"  name="title" />
							</div>
						</div>
						<div class="form-group sns-write-group">
							<label class="control-label col-sm-3" for="contents">내용 </label>
							<div class='col-sm-7'>
								<textarea class="form-control" name="contents"
									rows="5"></textarea>
							</div>
						</div>
						<div class="form-group sns-write-group">
							<div class="selectbox">
								<label class="control-label col-sm-3" for="trvSeq">관련
									여행지 선택</label>
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
									공개 여부 </label>
								<div class='col-sm-7 text-center'>
									<label for="reviewPubYn">공개</label> <input type="radio"
										id="reviewPubYn2" name="reviewPubYn" value="Y" checked
										data-toggle="toggle">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
										for="reviewPubYn">비공개&nbsp;&nbsp;</label> <input type="radio"
										id="reviewPubYn2" name="reviewPubYn" value="N"
										data-toggle="toggle">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="checks">
								<label class="control-label col-sm-3" for="reviewPubYn">개인
									SNS 등록 여부 : </label>
								<div class='col-sm-7 text-center'>
									<label for="hidden">등록</label> <input type="radio" id="hidden"
										name="hidden" value="N" checked data-toggle="toggle">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
										for="hidden">미등록</label> <input type="radio" id="hidden"
										name="hidden" value="Y" data-toggle="toggle">
								</div>
							</div>
						</div>
						<div class="form-group sns-write-group sns-buttons"
							style="margin-left: 0px; text-align: center; margin: 5%;">

							<button type="submit" class="sns-post-footer" style="width: 30%;">게시글
								올리기</button>
							<button type="button" class="sns-post-footer"
								data-dismiss="modal" style="width: 30%;">닫기</button>
						</div>

					</div>
					<div class="container"></div>
				</form>
				</div>
			</div>
		</div>
	</div>

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
				<label class="control-label col-sm-3" for="title">제목  </label>
				<div class='col-sm-7'>
					<input type="text" class="form-control" id="update-title" name="title" value=""/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="contents">내용  </label>
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
						<label class="control-label col-sm-3" for="reviewPubYn">후기 공개 여부  </label>
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
					<label class="control-label col-sm-3" for="reviewPubYn">개인 SNS 등록 여부  </label>
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
