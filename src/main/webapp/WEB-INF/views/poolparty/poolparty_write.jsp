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
						<h3><strong>풀 파티 글 </strong></h3>
					</div>
					<div class="write-main block" id="sns-write2"
						style="margin-right: 5%; background:#f3f3f3  ">
						<div class="form-group sns-write-group" style="margin-top: 30px">
							
							<div class='col-sm-7 pool-post-contents'>
								<input type="text" class="form-control"  name="title" placeholder="제목.." />
							</div>
						</div>
						<div class="form-group sns-write-group">
							
							<div class='col-sm-7 pool-post-contents'>
								<textarea class="form-control" name="contents"
									rows="5" placeholder="내용.."></textarea>
							</div>
						</div>
						<div class="form-group sns-write-group">
							<div class="selectbox">
							
								<div class='col-sm-7 pool-post-contents'>
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
								
								<div class='col-sm-7 pool-post-contents'>
									<input type="file" name="file" multiple="multiple"
										style="vertical-align: bottom; display:none;" id="poolpostimg" class="img-upload-pool">
									<label for="poolpostimg" style="cursor:pointer;" class="poolpostimglabel">사진 추가</label>
									<div id="poolimgnames"></div>
								</div>
							</div>
						</div>
						<div class="form-group sns-write-group">
								<h5><strong>후기 공개 여부</strong></h5>
								
								<div class='col-sm-7 text-center pool-post-contents'>
									<input type="radio"
										id="reviewPubYn1" name="reviewPubYn" value="Y" checked
										>
									<label for="reviewPubYn1" class="review-public-yn">공개</label>   <input type="radio"
										id="reviewPubYn2" name="reviewPubYn" value="N">
										 <label
										for="reviewPubYn2" class="review-public-yn">비공개</label>
								</div>
						
						</div>
						<div class="form-group sns-write-group">
							<div class="checks">
								<h5><strong>개인 SNS 등록 여부</strong></h5>
								<div class='col-sm-7 text-center pool-post-contents'>
									<input type="radio" id="hidden1"
										name="hidden" value="N" checked data-toggle="toggle">
									<label for="hidden1" class="review-public-yn">등록</label> 
									
									<input type="radio" id="hidden2"
										name="hidden" value="Y" data-toggle="toggle">
										<label class="review-public-yn"
										for="hidden2">미등록</label> 
								</div>
							</div>
						</div>
						<div class="form-group sns-write-group"
							style="margin-left: 0px; text-align: center; margin: 5%; margin-top:10%;">

							<button type="submit" class="sns-post-footer gray_button" style="width: 30%;">게시글
								올리기</button>
							<button type="button" class="sns-post-footer gray_button"
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
		<div class="write-main block" id="post-modify" style="margin-top: 30px; background: #f7f8f9; padding: 30px; border-radius: 12px;">
			<div class="form-group">
				
				<div class='col-sm-7 pool-post-contents'>
					<input type="text" class="form-control " id="update-title" name="title" value="" placeholder="제목 .."/>
				</div>
			</div>
			<div class="form-group">
				
				<div class='col-sm-7 pool-post-contents'>
					<textarea class="form-control" id="update-contents" name="contents" rows="5" placeholder="내용 .."></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="selectbox">
					
					<div class='col-sm-7 pool-post-contents'>
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
					<div class='col-sm-7 pool-post-contents'>
									<input type="file" name="file" multiple="multiple"
										style="vertical-align: bottom; display:none;" id="pooleditimg" class="img-edit-pool">
									<label for="pooleditimg" style="cursor:pointer;" class="poolpostimglabel">사진 추가</label>
									<div class="pool-editimgnames"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="checks">
				
						<div class='col-sm-7 text-center pool-post-contents'>
						<input type="radio"	id="update-reviewPubYn-y" name="reviewPubYn-edit" value="Y" checked  >
							<label for="update-reviewPubYn-y" class="review-public-yn" id="review-public-y">후기 공개</label> 
							
						<input type="radio"	id="update-reviewPubYn-n" name="reviewPubYn-edit" value="N" >
						<label for="update-reviewPubYn-n" class="review-public-yn" id="review-public-n">후기 비공개&nbsp;&nbsp;</label> 
						
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="checks">
					<div class='col-sm-7 text-center pool-post-contents'>
					<input type="radio" id="update-hidden-n" name="hidden-edit" value="N" checked data-toggle="toggle">
						<label for="update-hidden-n" class="review-public-yn">SNS 등록</label> 
						
						<input type="radio" id="update-hidden-y" name="hidden-edit" value="Y" data-toggle="toggle">
						<label	for="update-hidden-y" class="review-public-yn">SNS 미등록</label> 
						
					</div>
				</div>
			</div>
			<div class="form-group-button">
				<div class="col-md-12" style="padding-left: 35%; margin-top: 30px;">
					<button type="submit" class="btn btn-default col-lg-6 center-block" style="margin-bottom: 30px; margin-top: 30px;">게시글 수정</button>
				</div>
			</div>
		</div>

	</form>
</div>
</div>
