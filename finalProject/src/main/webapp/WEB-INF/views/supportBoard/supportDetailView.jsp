<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
    .datawrap{
        height: 80%;
        width: 80%;
        margin: auto;
        margin-top: 50px;
        border: 1px solid lightgray;
    }
    .tablewrap{
        height:10%;
        margin: auto;
        width: 100%;
        margin-top: 10px;
        margin-bottom: 10px;
        
    }
    #table1>thead>tr>th{font-size: 12px; color: gray; padding-left: 10px; font-weight: 100;}
    #table1>tbody>tr>td{font-size: 12px; padding-left: 10px; font-weight: 600; background-color: rgb(240, 240, 240); }
    #title{height:5%; font-size: 15px; font-weight: 600; border-bottom: 2px solid rgb(89, 89, 89); padding-left: 10px;}
    
    #content{height:65%; font-size: 13px; padding-left: 10px;}
    #attach, #date{height: 5%; font-size: 14px; padding-right: 30px;}
    #attach>a{line-height: 30px;}
    div>span{padding-left: 20px;}
</style>
<body>
    <div class="wrap">
        <h4>업무협업</h4>
        <div class="datawrap">
            <div class="tablewrap">
                <table id="table1" border="0" bordercolor="lightgray">
                    <thead>
                        <tr>
                            <th width="200">카테고리</th>
                            <th width="120">발신부서</th>
                            <th width="160">요청시작일</th>
                            <th width="160">요청종료일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>회사내지침</td>
                            <td>지원팀</td>
                            <td>2020.12.01 (화)</td>
                            <td>2020.12.01 (화)</td>
                        </tr>
                    </tbody>
                </table>    
            </div>
            <div id="title">
                사무실 환경 점검 예정의 件
            </div>
            <div id="date" align="right">
                2020.12.01(화)
            </div>
            <div id="attach" align="right">
                <a href="" download="">테스트.pdf</a>
            </div>
            <div id="content">
                <p style="height: 100%">
                    내용내용내용
                </p>
            </div>
            <div align="right" style="width: 98%;">
                <button type="button" class="btn btn-info btn-sm" onclick="location.href='';">수정</button>
                <button type="button" class="btn btn-danger btn-sm" onclick="location.href='';">삭제</button>
                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='';">목록</button>
            </div>
        </div>
    </div>
</body>
</html>