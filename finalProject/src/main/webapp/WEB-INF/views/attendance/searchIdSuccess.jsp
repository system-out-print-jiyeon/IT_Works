<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../common/navbar.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        /* *{
            border: 1px solid red;
        } */
        div{box-sizing: border-box;}
           
        .outer{
            width: 1200px;
            height: 600px;
            margin:auto;
            margin-top: 80px;
        }   
        .content{
            padding: 50px;
            width:80%;
            margin:auto;
        }
        .content p{
            font-size: 2rem;
            font-family: 'Amiri', serif;
            text-decoration: none;
            color: rgb(57, 146, 230);
        }
        .searchArea{
            width: 420px;
            margin: auto;
            border:3px solid rgb(57, 146, 230);
            height:230px;
            margin:auto;
            padding:20px;
        }
        .btn-primary{
	    margin-left:20px;
    	}
    </style>
</head>
<body>

    
    <div class="outer">
        <div class="content">
            <p align="center">Search Id</p>
            	<c:if test="${ !empty searchId}">
	            	<div class="searchArea" align="center">
	                <br><br><br> 
	                <b>${searchId.memName }님의 아이디는 </b>
	                <br>
	                <b>${searchId.memId }입니다</b>
            	
            	</c:if>

                <br><br><br><br><br><br><br>

                <button onclick="location.href='index.jsp'" class="btn btn-primary" type="button">로그인하러 가기</button>    
            </div>
        </div>
    </div>


</body>
</html>