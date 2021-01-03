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
            height:330px;
            margin:auto;
            padding:20px;
        }
        .searchArea label{
	    font-weight:900;
        }
        .searchArea input[type="text"]{
            border:1px solid gray;
            width:250px;
            margin-bottom:30px;
        }
        #searchIdForm{
            margin-left:50px;
        }
        .btn-primary{
	    margin-left:50px;
    	}
    </style>
</head>
<body>

    <div class="outer">
        <div class="content">
            <p align="center">Search Id</p>
            <div class="searchArea" >
                <form action="searchId.at" id="searchIdForm" method="post">
                    <br>
                    <label for="memName">이름</label>
                    <br>
                    <input type="text" name="memName" id="memName" required placeholder="이름을 입력하세요" minlength="2" maxlength="5">
                    <br>
                    <label for="birthday">생년월일</label>
                    <br>
                    <input type="text" name="birth" id="birth" required placeholder="6자리의 숫자로 입력하세요" minlength="6" maxlength="6">
                    <br>
                    <label for="phone">전화번호</label>
                    <br>
                    <input type="text" name="phone" id="phone" required placeholder=" - 포함해서 입력하세요" minlength="13" maxlength="13">
                    <br><br><br>
                    <a href="javascript:history.back()" class="btn btn-secondary">&nbsp; 뒤로가기 &nbsp;</a>
                    <button class="btn btn-primary" type="submit">아이디 찾기</button>
                </form>
                    
            </div>
        </div>
    </div>



</body>
</html>