<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
    
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
    <style>
        /* *{
            border: 1px solid red;
        } */
        :root{


}
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Alata', sans-serif;
}

.page-container{
    width: 100vw;
    height: 100vh;
    background: #eff0f2;
    display: flex;
    justify-content: center;
    align-items: center;

}
.shadow{
    -webkit-box-shadow: 27px 43px 43px -26px rgba(89,89,89,0.39);
    -moz-box-shadow: 27px 43px 43px -26px rgba(89,89,89,0.39);
    box-shadow: 27px 43px 43px -26px rgba(89,89,89,0.39);
}/*
.shadow-light{
    -webkit-box-shadow: 45px 45px 104px -33px rgba(38,38,38,0.92);
    -moz-box-shadow: 45px 45px 104px -33px rgba(38,38,38,0.92);
    box-shadow: 45px 45px 104px -33px rgba(38,38,38,0.92);
}*/
.login-form-container{
 
    background:#f5f5f5 ;
    width:860px;
    height: 540px;
    display: flex;
    flex-direction: row;
    box-shadow: 10px black;
    border-radius: 10px;

}
.login-form-right-side{
    width: 50%; 
    border-radius: 10px 0px 0px 10px;
    padding:75px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: white;
    background-image: 
  radial-gradient(ellipse farthest-corner at 0 140%, #5d9dff 0%, #2178ff 70%, #3585ff 70%);
}
.login-form-right-side h1{
    color: white;
    width:100%;
    text-align: right;
    opacity: 0.9;

}
.login-form-right-side p{
    padding-top: 50px;
    padding-left:100px;
    font-size:12px;
    text-align: right;
    opacity: 0.8;
}
.login-form-left-side{
    width: 50%;
    border-radius: 0px 10px 10px 0px;
    display: flex;

    flex-direction: column;
    align-items: center;
    padding:40px;
    background: rgb(255,255,255);
background: linear-gradient(287deg, rgba(255,255,255,1) 0%, rgba(243,244,244,1) 0%, rgba(255,255,255,1) 100%);
}
.login-form-left-side .login-top-wrap{
    display: flex;
    justify-content: flex-end;
    align-items: center;
    width:100%;
}
.login-form-left-side .login-top-wrap span{
    color: gray;
    font-size: 11px;
    padding-right:20px;

}
.login-form-left-side .login-top-wrap .create-account-btn {
    background: white;
    border:  0;
    width:85px;
    height: 35px;
    font-size: 11px;
    color: #2178ff;
    border-radius: 3px;

}
.login-input-container{
    padding-top:90px;
    width:300px;
}
.login-input-container .login-input-wrap{
    width:300px;
    height: 45px;
    margin-top: 20px;
    border-radius: 2px;
    border-bottom: solid 2px #2178ff;
   
}

.login-input-container .login-input-wrap input{
    background: none;
   
    border: none;
    line-height: 45px;
    padding-left:10px;
    width:267px;
}
.login-input-container .login-input-wrap input:focus{
    outline: none;
}
.find-btn-wrap{
    margin-top: 40px;
    display: inline-flex;
}
.find-btn{margin:10px;}
.find-btn-wrap .find-btn{
    width:95px;
    height:35px;
    color:white;
    border: 0;
    border-radius: 4px;
    float:left;

    background: rgb(105,163,255);
background: linear-gradient(162deg, rgba(105,163,255,1) 0%, rgba(43,125,254,1) 50%, rgba(43,125,254,1) 100%);
}
.find-btn:hover{
	cursor:pointer;
}

#resetPwdForm p{
    		font-size:12px;
    		color: rgb(57, 146, 230);
    	}

    </style>
</head>
<body>
	
	<!-- 첫페이지 로그인 폼 나오기 -->
	
    <div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                    
                </div>
                <h1>Forgot your Password?</h1>
                <p>Please create your new password.</p>
            </div>
            <div class="login-form-left-side">
                <div class="login-input-container">
                	<form action="update.at" id="resetPwdForm" method="post">
      	          		<input type="hidden" name="memId" id="memId" value="${ searchPwd.memId }">
	                    <div class="login-input-wrap input-newpwd">
	                        <input type="password" name="memPwd" id="memPwd" required minlength="8" maxlength="16" onfocusout="checkPwd();">
	                    	<p id="checkPwd"> ${ searchPwd.memName }님, 변경하실 비밀번호를 입력하세요</p>
	                    </div>
	                    <div class="login-input-wrap input-id">
	                    	<input type="password" id="memPwdCheck" required minlength="8" maxlength="16" onfocusout="checkPwdCheck();">
                   			<p id="checkPwdCheck">비밀번호를 다시 입력하세요</p>
	                    </div>
	                </div>
	                <div class="find-btn-wrap">
	                    <button class="find-btn" type="submit" id="findBtn" disabled>비밀번호 변경</button>
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
               	                document.getElementById("findBtn").removeAttribute("disabled");
               	            }else{
               	                document.getElementById("findBtn").disabled ="true";
               	            }
               	        }
               			
               			
               		</script>
            </div>
        </div>
    </div>
    
</body>
</html>