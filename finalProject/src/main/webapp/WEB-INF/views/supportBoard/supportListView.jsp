<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../common/navbar.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
    div{border: 0px solid rgb(89, 89, 89); box-sizing: border-box;}
    .wrap{
        padding-top: 50px;
        margin:auto; 
        width: 800px;
        height: 800px;
    }
    #listwrap{width: 90%; height: 80%; margin: auto; margin-top: 50px; }
    .box{height:8%; padding-top: 5px;}
    .box>div{float: left; height: 100%;}
    #box1>div{float: left; margin-right: 7px;}
    .insert{width: 80%;}
    .select{width: 20%;}
    .search{width: 10%;}
    #box2{height:60%;}
    .tablewrap>table {margin-top: 15px; width: 100%;}
    .tablewrap>table tbody>tr{text-align: center; font-size: 10px; height: 28px;}
    .tablewrap>table th{height: 35px; font-size: 12px; font-weight: 700; background-color: rgb(240, 240, 240); text-align: center;}
    .tablewrap>table tbody>tr:hover{cursor: pointer; background-color: rgb(240, 240, 240);}
    #box3{height:20%;}
    #box4{width: 50%; height: 12%; margin:auto;}
    #pagingArea{width: fit-content; margin: auto;}
    .custom-select:hover{cursor: pointer;}
</style>
</head>
<body>
	<div class="wrap">
        <h4>업무협업</h4>
        <div id="listwrap">
            <div class="box">
                <div class="insert">
                    <button type="button" class="btn btn-info" onclick="">업무헙업 요청</button>
                </div>
                <div class="select">
                    <select class="custom-select" name="category">
                        <option selected hidden>분류</option>
                        <option value="claim">클레임</option>
                        <option value="requestion">업무요청</option>
                        <option value="notice">회사내지침</option>
                        <option value="meetingPaper">회의록</option>
                    </select>
                </div>
            </div>
            <div id="box2" class="tablewrap" align="center">
                <table border="1" bordercolor="lightgray">
                    <thead>
                        <tr>
                            <th width="30px">No</th>
                            <th width="100px">분류</th>
                            <th width="100px">수신부서</th>
                            <th width="400px">제목</th>
                            <th width="100px">작성일</th>
                            <th width="100px">발신부서</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2</td>
                            <td>회사내지침</td>
                            <td>개발팀</td>
                            <td>사무실 환경 점검 예정의 件</td>
                            <td>2020. 12. 14 (월)</td>
                            <td>지원팀</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>업무요청</td>
                            <td>모든부서</td>
                            <td>제5회 정기주주총회 개최 일정 안내의 件</td>
                            <td>2020. 12. 01 (화)</td>
                            <td>총무팀</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="box3">
                <form action="★" method="GET">
                    <div id="box1">
                        <div class="select">
                            <select class="custom-select" name="condition">
                                <option value="title" selected>제목</option>
                                <option value="titleContent">제목/내용</option>
                                <option value="sendDeft">발신부서</option>
                            </select>
                        </div>
                        <div class="insert" style="width: 68%;">
                            <input type="text" class="form-control" name="keyword">
                        </div>
                        <button type="submit" class="search btn btn-secondary">검색</button>
                    </div>
                </form>
            </div>
            <div id="box4">
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
    </div>
</body>
</html>