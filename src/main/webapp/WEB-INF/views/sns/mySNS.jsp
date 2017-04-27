<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row object-non-visible " data-animation-effect="fadeIn">
	<div class="container">
		<div class="block"  style="padding-top: 30px" >
			<form class="form-horizontal" action="${pageContext.request.contextPath}/sns/post/upload" method="post" enctype="multipart/form-data">
				<input class="ignore" type="hidden" name="usrSeq" value="${authUser.usrSeq}">
				<img onclick="showWrite();" alt="글쓰기" src="${pageContext.request.contextPath}/assets/images/write-btn.png" style="width: 30px">
				<div class="write-main block" id="sns-write" style="display: none;">
					<div class="form-group">
				        <label class="control-label col-sm-3" for="title">제목 : </label>
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
								<select class="form-control" id="sns-trv-seq" name="trvSeq">
									<option selected>관련 여행지 선택</option>
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
								<input type="file" name="file" multiple="multiple"  style="vertical-align: bottom;">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="checks">
							<label class="control-label col-sm-3" for="reviewPubYn">후기 공개 여부 : </label>
							<div class='col-sm-7 text-center'>
								<label for="reviewPubYn">공개</label>
			                    <input type="radio" id="reviewPubYn" name="reviewPubYn" value="Y" checked data-toggle="toggle">
			                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    <label for="reviewPubYn">비공개&nbsp;&nbsp;</label> 
			                    <input type="radio" id="reviewPubYn" name="reviewPubYn" value="N" data-toggle="toggle">
		                 	</div>
		                </div>
	                </div>
	                <div class="form-group">
		                 <div class="checks">
							<label class="control-label col-sm-3" for="reviewPubYn">그룹 풀 공유 여부 : </label>
							<div class='col-sm-7 text-center'>
								<label for="hidden">공유</label>
			                    <input type="radio" id="hidden" name="hidden" value="Y" checked data-toggle="toggle"> 
			                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    <label for="hidden">공유안함</label> 
			                    <input type="radio" id="hidden" name="hidden" value="N" data-toggle="toggle">
		                 	</div>
		                 </div>
	                </div>
					<div class="form-group-button">
						<div class="col-md-12" style="padding-left: 40%">
					        <button type="submit" class="btn btn-default col-lg-6 center-block">게시글 올리기</button>
					    </div>
				    </div>
			    </div>
			    <div class="container">
				    <div id="my-sns-list" class="block" style="padding-top: 100px">
					</div>
				</div>
				<div class='cycle-slideshow'
				    data-cycle-fx='scrollHorz'
				    data-cycle-timeout='0'
				    data-cycle-prev='prev'
				    data-cycle-next='#next'
				    >
				    <c:forEach items='${vo }' var='postPicVo' varStatus='status'>
					    <img src='/poorip/" + vo2.path + "/" + vo2.fileName + "'>
				    </c:forEach>
				    
				</div>
				<div class="center">
				    <a href=# id="prev"> ! </a> 
				    <a href=# id="next"> > </a>
				</div>
			</form>
		</div>
	</div>
</div>