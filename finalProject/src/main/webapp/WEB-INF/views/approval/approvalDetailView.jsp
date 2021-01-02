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
						<th>문서 종류</th>
						<td>${ ad.docForm }</td>
						<th>작성자</th>
						<td>${ ad.memNo }</td>
					</tr>
					<tr>
						<th>보존 연한</th>
						<td>${ ad.docRetention }</td>
						<th>보안 등급</th>
						<td>${ ad.docGrade }</td>
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
						<th rowspan="3" colspan="" align="center">결재</th>
						<th class="firstCell">대리</th>
						<th class="firstCell"></th>
						<th class="firstCell"></th>
						<th class="firstCell"></th>
					</tr>
					<tr>
						<td class="secondCell" colspan="">
							<button class="btn btn-secondary" data-toggle="modal"
								data-target="#approvalModal" style="margin-top: 10px;">결재</button>
						</td>
						<td class="secondCell"></td>
						<td class="secondCell"></td>
						<td class="secondCell"></td>
					</tr>
					<tr>
						<td class="thirdCell" align="center">사원명</td>
						<td class="thirdCell"></td>
						<td class="thirdCell"></td>
						<td class="thirdCell"></td>
					</tr>
					<tr>
						<th class="secondTitle">참조</th>
						<td colspan="7"></td>
					</tr>
				</table>
			</div>

			<jsp:include page="./approvalDecisionModal.jsp"/>

			<br>
			<br>
			
			<div class="titleBox">
               <h5>제목</h5> 
            </div>
                
            <div class="inputTitle">
                <h3>${ ad.docTitle }</h3>
            </div>

			<div class="titleBox" style="display: flex; margin-left: 30px;">
				<h5>문서내용</h5>
			</div>

			<!-- 문서 내용 -->
			<div>
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
						<th><a href="">파일.pdf</a><br> <a href="">asdf</a></th>
					</thead>
				</table>
			</div>

			<br>

			<div class="titleBox" style="display: flex; margin-left: 30px;">
				<h5>의견</h5>
			</div>

			<!-- 의견 -->
			<div class="opinion" style="margin-left: 30px; width: 800px;">
				<div class="opinionList" style="margin-left: 10px;" align="center">
					<table class="table table-sm table-borderless">
						<th width="100">이름</th>
						<th>입력날짜</th>
						<tr>
							<td colspan="2">댓글내용</td>
						</tr>
					</table>
					<hr>

				</div>

				<br>

				<!-- 의견입력 -->
				<div class="mb-3 opinionEnroll" style="margin-left: 10px;">
					<label for="exampleFormControlTextarea1" class="form-label">의견
						입력</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="2"></textarea>
					<br>
					<button type="submit" class="btn btn-secondary">등록</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>