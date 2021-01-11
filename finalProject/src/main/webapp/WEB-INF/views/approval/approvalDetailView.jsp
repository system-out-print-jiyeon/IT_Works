<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결제상세</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.wrap {
	width: 100%;
	height: 100%;
	display: flex;
}
/* 문서작성폼 */
.detailForm {
	margin-left: 300px;
	margin-top: 120px;
}

.titleBox {
	margin-left: 30px;
	position: relative;
}

.titleBox:hover {
	cursor: pointer;
}

.infoTable {
	border-collapse: collapse;
	text-align: center;
	width: 800px;
	height: 100px;
}

.infoTable th {
	background-color: #e7e1e1;
}

.infoTable td {
	padding-left: 20px;
}

.approvalLine {
	width: 100%;
	margin-left: 30px;
}

.approvalLine {
	margin-top: 10px;
}

.approvalTable {
	border-collapse: collapse;
	text-align: center;
	width: 800px;
	height: 200px;
}

.approvalTable th {
	background-color: #e7e1e1;
	width: 80px;
}

.mainTitle {
	height: 150px;
}

.secondTitle {
	height: 40px;
}

.firstCell {
	height: 40px;
}

.secondCell {
	height: 80px;
}

.thirdCell {
	height: 40px;
}
</style>

</head>
<body>

	<jsp:include page="../common/approvalNavbar.jsp" />

	<jsp:include page="../common/sideBar_approval.jsp" />
	<div class="wrap">
		<div class="detailForm">
			<!-- 결재문서 정보 -->
			<div class="titleBox">
				<h5>결재문서 정보</h5>
				<table class="table table-bordered infoTable">
					<tr>
						<th width="175">문서 종류</th>
						<td>
							<c:choose>
								<c:when test="${ ad.docForm eq 1 }">지출결의서</c:when>
								<c:when test="${ ad.docForm eq 2 }">문서발급요청서</c:when>
								<c:when test="${ ad.docForm eq 3 }">프로젝트업무보고서</c:when>
								<c:when test="${ ad.docForm eq 4 }">품의서</c:when>
							</c:choose>
						</td>
						<th width="175">작성자</th>
						<td>${ ad.memName }</td>
					</tr>
					<tr>
						<th width="175">보존 연한</th>
						<td>${ ad.docRetention }년</td>
						<th width="175">보안 등급</th>
						<td>${ ad.docGrade }등급</td>
					</tr>
				</table>
			</div>

			<br>

			<div class="titleBox" style="display: flex; margin-left: 30px;">
				<h5>결재선</h5>
			</div>

			<!-- 결재선 -->
			<div class="approvalLine">
				<table class="table table-bordered approvalTable">
					<tr>
						<th rowspan="3" align="center">결재</th>
						<c:forEach var="aList" items="${ aList }">
							<th class="firstCell">${ aList.jobName }</th>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="aList" items="${ aList }" varStatus="approve">
							<td class="secondCell">
								<c:choose>
									<c:when test="${ aList.approvalStatus eq 'Y' }">
										<button class="btn btn-primary" disabled>승인</button>
									</c:when>
									<c:when test="${ aList.approvalStatus eq 'N' }">
										<button class="btn btn-outline-danger" disabled>반려</button>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${ aList.memNo eq loginUser.memNo }">
												<button class="btn btn-secondary" id="approvalBtn" data-toggle="modal" data-target="#approvalModal" onclick="approvalOrder();">결재</button>
												<input type="hidden" value="${ aList.approvalOrder }" id="orderNum" name="approvalOrder">
											</c:when>
											<c:otherwise>
												<button class="btn btn-secondary" id="approvalBtn" data-toggle="modal" data-target="#approvalModal" disabled>결재</button>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</td>
						</c:forEach>
						<jsp:include page="./approvalDecisionModal.jsp"/>
					</tr>
					<tr>
						<c:forEach var="aList" items="${ aList }">
							<td class="thirdCell" align="center">${ aList.memName }</td>
						</c:forEach>
					</tr>
					<tr>
						<th class="secondTitle">참조</th>
						<c:forEach var="rList" items="${ rList }">
							<td>${rList.deptName } &nbsp; ${ rList.memNo }</td>
						</c:forEach>
					</tr>
				</table>
			</div>
			
			<script>
				function approvalOrder() {
					document.getElementById("approvalOrder").value = document.getElementById("orderNum").value;
				}
			</script>

			<br>
			<br>
			
			<div class="titleBox">
               <h5>제목</h5> 
	           <hr>
            </div>            
                
            <div class="inputTitle">
                <label style="margin-left: 35px">${ ad.docTitle }</label>
            </div>
            
            <br>

			<div class="titleBox">
				<h5>문서내용</h5>
				<hr>
			</div>

			<div style="margin-left: 35px">
				${ ad.docContents }
			</div>

			<br>

			<div class="titleBox" style="display: flex; margin-left: 30px;">
				<h5>별첨</h5>
			</div>

			<!-- 첨부파일 내용 -->
			<div class="approvalAttachment" style="margin-left: 35px;">
				<table class="table">
					<thead scope="col">
						<th width="100" style="text-align: center;">첨부파일</th>
						<c:choose>
							<c:when test="${ not empty attList }">
								<th>
									<c:forEach var="attList" items="${ attList }">
										<a href="${ attList.attChangeName }" download="${ attList.attPath }">
											${attList.attOriginName }
										</a>
									</c:forEach>
								</th>
							</c:when>
							<c:otherwise>
								<th style="display: block">첨부파일이 없습니다.</th>
							</c:otherwise>
							</c:choose>
					</thead>
				</table>
			</div>

			<br>

			<div class="titleBox">
				<h5>의견</h5>
				<hr>
			</div>

			<!-- 의견 -->
			<div class="opinion" style="margin-left: 30px; width: 800px;">
				<div class="opinionList" style="margin-left: 10px;" align="center">
					<table class="table table-sm" id="opinionArea">
						<c:choose>
							<c:when test="${ not empty opList }">
								<c:forEach var="opList" items="${ opList }">
									<th rowspan="2" width="100" align="center">${ opList.memNo }</th>
									<th>${ opList.opiEnrollDate }</th>
									<tr>
										<td>${ opList.opiContent }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								입력된 의견이 없습니다.
							</c:otherwise>
						</c:choose>
					</table>
					<hr>

				</div>

				<br>

				<!-- 의견입력 -->
				<form action="opinion.ap" method="POST">
					<div class="mb-3 opinionEnroll" style="margin-left: 10px;">
						<label for="exampleFormControlTextarea1" class="form-label">의견입력</label>
						<input type="hidden" value="${ loginUser.memNo }" name="memNo">
						<input type="hidden" value="${ ad.docNo }" name="docNo">
						<textarea class="form-control" id="opiContent" rows="2" name="opiContent"></textarea>
						<br>
						<button type="submit" class="btn btn-secondary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	

</body>
</html>