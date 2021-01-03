<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        }   
        .content{
            padding: 50px;
            width:80%;
            margin:auto;
            margin-top: 80px;
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
            <p align="center">Search Password</p>
            
            <div class="searchArea" align="center">
                <br><br>
                <b style="color: gray;">비밀번호 찾기 실패!</b>
                <br><br>
                <b>일치하는 회원이 없습니다. 다시 시도해주세요.</b>

                <br><br><br><br><br><br><br>

                <a href="javascript:history.back()" class="btn btn-primary" type="submit">뒤로가기</a>    
            </div>
        </div>
    </div>


</body>
</html>