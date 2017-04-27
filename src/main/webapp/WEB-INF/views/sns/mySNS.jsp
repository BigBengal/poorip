<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row object-non-visible" data-animation-effect="fadeIn">
	<div class="col-md-12">
		<div class="filters text-center">
			<form class="form-horizontal" action="${pageContext.request.contextPath}/sns/post/upload" method="post" enctype="multipart/form-data">
				<input class="ignore" type="hidden" name="usrSeq" value="${authUser.usrSeq}">
				<%-- <table>
					<tr>
						<th>
							제목
						</th>
						<td>
							<input type="text" class="form-control" id="title" name="title">			
						</td>
					</tr>
					<tr>
						<th>
							내용
						</th>
						<td>
							<textarea class="form-control" id="contents" name="contents" rows="5"></textarea>
							
						</td>
					</tr>
					<tr>
						<th>
							여행지
						</th>
						<td>
							<select name="trvSeq" id="sns-trv-seq" style="width: 100%;">
							<c:forEach items="${travelVo }" var="travelVo" varStatus="status">
								<option value="${travelVo.trvSeq }">${travelVo.name }</option>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>
							사진 올리기
						</th>
						<td>
							<input type="file" name="file" multiple="multiple">
						</td>
					</tr>
					<tr>
						<th>
							공개여부
						</th>
						<td>
							<label>공개</label>&nbsp;&nbsp;<input type="radio" name="reviewPubYn" value="Y" checked data-toggle="toggle">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label>비공개</label>&nbsp;&nbsp;<input type="radio" name="reviewPubYn" value="N" data-toggle="toggle">
						</td>
					</tr>
					<tr>
						<th>
							공유여부
						</th>
						<td>
							<label>공유</label>&nbsp;&nbsp;<input type="radio" name="hidden" value="Y" checked data-toggle="toggle">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label>공유안함</label>&nbsp;&nbsp;<input type="radio" name="hidden" value="N" data-toggle="toggle">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit"
									class="btn btn-default col-lg-12" value="게시글 올리기">
						</td>
					</tr>
				</table> --%>
				<div class="form-group" id="title">
			        <label class="control-label col-sm-3" for="title">제목 : </label>
			        <div class='col-sm-7'>
			        	<input type="text" id="title" name="title" />
			        </div>
			    </div>
				<div>
					<label class="control-label col-sm-3" for="contents">contents : </label>
					<textarea id="contents" name="contents"></textarea>
				</div>
				<div class="selectbox">
					<label class="control-label col-sm-3" for="trvSeq">관련 여행지 선택</label>
					<div class='col-sm-7'>
						<select id="sns-trv-seq" name="trvSeq">
							<option selected>관련 여행지 선택</option>
							<c:forEach items="${travelVo }" var="travelVo" varStatus="status">
								<option value="${travelVo.trvSeq }">${travelVo.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div>
					<label class="control-label col-sm-3" for="file">사진 올리기</label>
					<input type="file" name="file" multiple="multiple">
				</div>
				<div class="checks">
					<label class="control-label col-sm-3" for="reviewPubYn">공개 여부 : </label>
					<div class='col-sm-7'>
						<label for="reviewPubYn">공개</label>
	                    <input type="radio" id="reviewPubYn" name="reviewPubYn" value="Y" checked data-toggle="toggle"> 
	                    <label for="reviewPubYn">비공개</label> 
	                    <input type="radio" id="reviewPubYn" name="reviewPubYn" value="N" checked data-toggle="toggle">
                 	</div>
                 </div>
                 <div class="checks">
					<label class="control-label col-sm-3" for="reviewPubYn">공유 여부 : </label>
					<div class='col-sm-7'>
						<label for="hidden">공유</label>
	                    <input type="radio" id="hidden" name="hidden" value="Y" checked data-toggle="toggle"> 
	                    <label for="hidden">공유 안함</label> 
	                    <input type="radio" id="hidden" name="hidden" value="N" checked data-toggle="toggle">
                 	</div>
                 </div>
				<div class="form-group-button">
				<div class="col-sm-3"></div>
				<div class="col-sm-7">
			        <button type="submit" class="btn btn-default col-lg-6 center-block">게시글 올리기</button>
			    </div>
			    </div>
			</form>
			<table id="my-sns-list">
			</table>
		</div>
	</div>
</div>