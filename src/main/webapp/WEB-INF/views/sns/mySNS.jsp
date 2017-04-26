<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row object-non-visible" data-animation-effect="fadeIn">
	<div class="col-md-12">
		<div class="filters text-center">
			<form class="form-horizontal" name="write-form" action="${pageContext.request.contextPath}/sns/post/upload" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th>
							제목
						</th>
						<td>
							<input type='text' class="form-control" id="title" name="title">			
						</td>
					</tr>
					<tr>
						<th>
							내용
						</th>
						<td>
							<textarea class="form-control" id="contents" name="contents" rows="5">
							</textarea>
						</td>
					</tr>
					<tr>
						<th>
							여행지
						</th>
						<td>
							<select name="trvSeq1" style="width: 100%;">
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
							<button type="submit"
									class="btn btn-default col-lg-12">게시글 올리기</button>
						</td>
					</tr>
				</table>
			</form>
			<table id="my-sns-list">
			</table>
		</div>
	</div>
</div>