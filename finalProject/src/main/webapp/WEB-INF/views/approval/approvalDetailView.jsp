<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결제상세</title>
</head>
<body>

	<jsp:include page="../common/approvalNavbar.jsp"/>

	<jsp:include page="../common/sideBar_approval.jsp"/>
	
	<div class="wrap">
	
		<!-- 결재문서 정보 -->
	    <div class="titleBox">
	        <h5>결재문서 정보</h5>
	        <table class="table table-bordered infoTable">
	            <tr>
	                <th>문서 종류</th>
	                <td> ${ 문서종류 } </td>
	                <th>작성자</th>
	                <td> ${ 기안자 }</td>
	            </tr>
	            <tr>
	                <th>보존 연한</th>
	                <td> ${ 보존 연한 }</td>
	                <th>보안 등급</th>
	                <td> ${ 보안 등급} </td>
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
	                  <button class="btn btn-secondary" data-toggle="modal" data-target="#approvalModal" style="margin-top: 10px;">결재</button>
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

    	<link rel="import" href="결재승인Modal.html">

    	<br><br>

	    <div class="titleBox" style="display: flex; margin-left: 30px;">
	        <h5>문서내용</h5>
	    </div>
	
	    <!-- 문서 내용 -->
	    <div>
	
	        <!-- 문서종류에 맞는 문서내용상세양식 불러올거 -->
	        <link rel="stylesheet" href="문서상세내용.jsp">
	
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
	                <th>
	                    <a href="">파일.pdf</a><br>
	                    <a href="">asdf</a>
	                </th>
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
	            
	            <!-- profile img -->
	            
	            <!-- 사원명 / 의견 입력 시간 -->
	            <!-- 의견 내용 -->
	        </div>
	
	        <br>
	
	        <!-- 의견입력 -->
	        <div class="mb-3 opinionEnroll" style="margin-left: 10px;">
	            <label for="exampleFormControlTextarea1" class="form-label">의견 입력</label>
	            <textarea class="form-control" id="exampleFormControlTextarea1" rows="2"></textarea> <br>
	            <button type="submit" class="btn btn-secondary">등록</button>
	        </div>
	    </div>
	    
	</div>

</body>
</html>