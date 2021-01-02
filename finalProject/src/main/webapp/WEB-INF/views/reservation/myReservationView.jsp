<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="../common/navbar.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
    div{border: px solid red; box-sizing: border-box;}
    .wrap{
        padding-top: 50px;
        margin:auto; 
        width: 800px;
        height: 900px;
    }
    .divwrap{width: 80%; height: 20%; text-align: left; margin-top: 40px;}
    .divwrap>div{padding-left: 20px;}
    .divwrap:hover{cursor: pointer;}
    .title{height: 20%; line-height: 35px; background: rgb(240, 240, 240); font-size: 13px; font-weight: 500;}
    .content{height: 80%; border:1px solid rgb(220, 220, 220); margin-top: 3px; font-size: 14px; line-height: 25px;}
    .content>#meetingRoom{padding-top: 20px; font-weight: 600; color: rgb(57, 146, 230);}
    #meetingDate>div{float: right; margin-right: 20px;}

    #pagediv{margin:auto; color: black; margin-top: 100px;}
    #pagingArea{width: fit-content;}
</style>
<body>

	<jsp:include page="../common/approvalNavbar.jsp"/>
    <jsp:include page="sidebar.jsp" />
	<div class="wrap" align="center">
        <h4 align="left">나의 예약조회</h4>
        <div class="divwrap">
            <div class="title">
                <span>예약일 : </span>
                <span>2020-12-14 (월)</span>
            </div>
            <div class="content">
                <div id="meetingRoom">
                    <span>5층</span>
                    <span>중회의실</span>
                </div>
                <div id="meetingObject">
                    <span>신입사원 OJT</span>
                </div>
                <div id="meetingDate">
                    <span>2020-12-14(월) 13:00</span>
                    <span>2020-12-14(월) 14:00</span>
                    <div>
                        <button type="button" class="btn btn-primary btn-sm" onclick="">변경</button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="goDelete();">취소</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="pagediv">
            <div id="pagingArea">
                <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">></a></li>
                </ul>
            </div>
        </div>
            
    </div>
</body>
</html>