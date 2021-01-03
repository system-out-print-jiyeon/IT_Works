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
            margin-top: 80px;
        }   
        .content{
            padding: 50px;
            width:80%;
            margin:auto;
        }
        #title{
            font-size: 2rem;
            font-family: 'Amiri', serif;
            text-decoration: none;
            color: rgb(57, 146, 230);
        }
        .searchArea{
            width: 420px;
            margin: auto;
            border:3px solid rgb(57, 146, 230);
            height:350px;
            margin:auto;
            padding:20px;
        }
        .searchArea label{
	    font-weight:900;
        }
        .searchArea input[type="password"]{
            border:1px solid gray;
            width:250px;
            margin-bottom:30px;
        }
        #searchIdForm{
            margin-left:50px;
        }
        .btn-primary{
	    margin-left:75px;
    	}
    	#searchIdForm p{
    		font-size:12px;
    		color: rgb(57, 146, 230);
    	}
    </style>
</head>
<body>

    
    <div class="outer">
        <div class="content">
            <p id="title" align="center">Reset Password</p>
            <div class="searchArea" >
                <form action="update.at" id="searchIdForm" method="post">
                	<input type="hidden" name="memId" id="memId" value="${ searchPwd.memId }">
                    <br>
	               <label for="memPwd">새 비밀번호 입력</label>
	               <br>
	               <input type="password" name="memPwd" id="memPwd" required minlength="8" maxlength="16" onfocusout="checkPwd();">
	               <p id="checkPwd"> ${ searchPwd.memName }님, 변경하실 비밀번호를 입력하세요</p>
	               <br>
	               <label for="memPwdCheck">새 비밀번호 확인</label>
	               <br>
	               <input type="password" id="memPwdCheck" required minlength="8" maxlength="16" onfocusout="checkPwdCheck();">
                   <p id="checkPwdCheck">비밀번호를 다시 입력하세요</p>
                   <br><br><br>
                   <button class="btn btn-primary" id="submitbtn" type="submit" disabled>비밀번호 변경</button>
                </form>
                    
            </div>
        </div>
    </div>

	<script>

        // 비밀번호 유효성검사
        function checkPwd(){
            var memPwd = document.getElementById("memPwd");
            var checkPwd = document.getElementById("checkPwd");
            var regExp = /^[a-z\d!@#$%^&*]{8,16}$/i

            if(!regExp.test(memPwd.value)){
                checkPwd.innerHTML = "<p class='fail'>8 ~ 16자의 영문, 숫자, 특수문자로만 입력해주세요.</p>";
                cPwd = false;
                buttonAble();
            }else{
                checkPwd.innerHTML = "<p class='success'>안전한 비밀번호입니다!</p>";
                cPwd = true;
                buttonAble();
            }
        }

        // 비밀번호 확인 유효성검사
        function checkPwdCheck(){
            var memPwd = document.getElementById("memPwd");
            var memPwdCheck = document.getElementById("memPwdCheck");
            var checkPwdCheck = document.getElementById("checkPwdCheck");
            var regExp = /^[a-z\d!@#$%^&*]{8,16}$/i

            if(!regExp.test(memPwdCheck.value)){
                checkPwdCheck.innerHTML = "<p class='fail'>8 ~ 16자의 영문, 숫자, 특수문자로만 입력해주세요.</p>";
            }else{
                if(memPwd.value != memPwdCheck.value){
                    checkPwdCheck.innerHTML = "<p class='fail'>비밀번호가 일치하지 않습니다.</p>";
                    cPwdCheck = false;
                    buttonAble();
                }else{
                    checkPwdCheck.innerHTML = "<p class='success'>비밀번호가 일치합니다!</p>";
                    cPwdCheck = true;
                    buttonAble();
                }
            }
        }
        
        
     // 버튼 disabled속성주기
        var cPwd = false;
        var cPwdCheck = false;

        function buttonAble(){
            if(cPwd === true && cPwdCheck === true){
                document.getElementById("submitbtn").removeAttribute("disabled");
            }else{
                document.getElementById("submitbtn").disabled ="true";
            }
        }
	</script>


</body>
</html>