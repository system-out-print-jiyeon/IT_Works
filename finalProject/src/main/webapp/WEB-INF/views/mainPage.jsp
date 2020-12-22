<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style>
        /* *{
            border: 1px solid red;
        } */
        div{box-sizing: border-box;}
           
        .outer{
            width: 1200px;
            height: 600px;
            padding-top: 100px;
            margin:auto;
        }   
        .content{
            padding: 50px;
            width:80%;
            margin:auto;
        }
        .content p{
            font-size: 4rem;
            font-family: 'Amiri', serif;
            text-decoration: none;
            color: rgb(57, 146, 230);
        }
        .loginArea{
            width: 420px;
            margin: auto;
            border:3px solid rgb(57, 146, 230);
            height:300px;
            margin:auto;
            padding:20px;
        }
        #loginBtn{
            margin:20px 0px 20px 0px;
            width:100%;
            height:40px;
            font-size:20px;
            color:white;
        }
        #userId, #userPwd{
            width:100%;
            height:40px;
        }
        table tr td{
            padding:5px;
        }
        table tr td a{
            text-decoration: none !important;
            color: rgb(57, 146, 230);
        }
    </style>
</head>
<body>
	
	<!-- 첫페이지 로그인 폼 나오기 -->
	
    <div class="outer">
        <div class="content">
            <p align="center">IT Works</p>
            <div class="loginArea">
                <form action="login.at" method="post">
                    <table width="100%">
                            <tr align="center">
                                <td width="5"><i class="far fa-user" style="font-size:36px;"></i></td>
                                <td colspan="2"><input type="text" name="memId" id="memId" placeholder="아이디를 입력하세요" required></td>
                            </tr>
                            <tr align="center">
                                <td><i class="fas fa-key" style="font-size:36px;"></i></td>
                                <td colspan="2"><input type="password" name="memPwd" id="memPwd" placeholder="비밀번호를 입력하세요" required></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <!-- 로그인 오류문구 -->
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" id="loginBtn" class="btn btn-primary" value="login"></td>
                            </tr>
            
                        <tr>
                            <table width="100%">
                                <tr align="center">
                                    <td id="searchId"><a href="searchIdForm.at">아이디 찾기</a></td>
                                    <td id="searchPwd"><a href="searchPwdForm.at">비밀번호 찾기</a></td>
                                </tr>
                            </table>
                            
                        </tr>
                    </table>
                </form>    
                    
            </div>
        </div>
    </div>
    
</body>
</html>