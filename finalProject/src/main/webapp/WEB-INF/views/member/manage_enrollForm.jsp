<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>

<style>
  /* rgb(52, 152, 219) --> 사이트 색상 */
 *{ 
     margin: 0;
     padding: 0;
     
     box-sizing: border-box;
 }

.wrap{width: 100%; 
      height: 100%;
      display: flex;
     
    }
 /* 작성하기 버튼 */
.writeButton{text-align: center;}

.button1{
   border-radius: 10px;
   border: 0;
   width: 250px;
   height: 45px;
   font-size: larger;
   color: white;
   background-color: rgb(84, 129, 189);
   
            }

.button1:hover{
   cursor: pointer;
   background-color: rgb(27, 97, 189);
   
            }

/* 사이드바 */
.sidebar{
    
    justify-content: space-between;
    padding: 8px 24px;
    width: 300px;
    height: 100vh;
    background-color: #e7e1e1;
    position: fixed;
    
    

}


.sidebar_menu{
    align-items: center;
    list-style: none;
}  

.sidebar_menu a{
    display: block;
    text-decoration: none;
    line-height: 40px;
    color: rgb(107, 102, 102);
    font-size: 20px;
    padding-left: 40px;
    box-sizing: border-box;
    
}

.sidebar_menu a:hover{
    color: rgb(39, 37, 37);
}


.menu1 li{ 
    padding-left: 60px;
    list-style: none; 
}

.profile:hover{cursor: pointer;}
.profile .menu1{display: none;}



/* 콘텐츠 영역 */

.content{
   
    width:100%;
    margin-left: 300px;
    
    display:block;
    margin-top: 50px;

}

.content_1{height: fit-content; margin-left: 40px; width: fit-content;}

.content_2{height: fit-content; align-content: center; position: relative;}

.content_3{height: fit-content; padding-left: 50px;}

.w3-bar{height: fit-content; text-align: center;}

.content_1:hover{cursor: pointer;}

table{
    width: 95%;
    height: 80%;
    border-collapse: collapse;
    border-spacing: 0;
    background: #fafafa;
    text-align: center;
}
th{background: #e7e1e1;}

th,td{
    padding: 10px 15px;

}

tbody tr:hover{background-color: rgb(52, 152, 219); color: white;}

/* 문서양식 드롭다운 */
.formtype{
    border: 1px solid darkgray;
    width: 150px;
    height: 170px;
    background-color: white;
    text-align: center;
    font-size: 15px;
    z-index: 1000;
    display: none;
    margin-left: 50px;
    position: absolute;
    
    
}
.formtype div{
    margin-top: 10px;
    
}

.formtype div:hover{
    background-color: rgb(204, 198, 198);
}
.formtype a{
    text-decoration: none;
    color: rgb(61, 56, 56);
    
}
.search #selectList{width: 100px;}
.search #selectList,#keyword{ 
    height: 40px; 
    border: 1px solid #e7e1e1; 
    border-radius: 5px;
}
.search button{
    height: 40px;
    width: 60px; 
    background-color: rgb(52, 152, 219); 
    color: white;
    border: 1px solid #e7e1e1; 
    border-radius: 5px;
}
.search button:hover{
    background-color: #e7e1e1;
    color: rgb(52, 152, 219);}
/* div{border: 1px solid red;} */
    .enroll{width: 80%; height: 1000px; margin: auto;}
    .enroll>.con1,.con2{width: 100%;}
    .con1{height: 20%;}
    .con2{height: 30%;}
    .con2>#con2,.img{height: 100%; float: left; box-sizing: border-box;}
    #con2{width: 65%;}
    .img{width: 35%;}

    .enroll{font-size: 20px;}
    .enroll input{width: 300px; height: 30px;}

    .enroll select{width: 160px; height: 30px;}
    #idCheck,#pwdCheck{font-size: 15px;}
    .enroll textarea{resize: none; width: 100%;}
    .enroll button{margin-left: 20px;}
</style>
</head>
<body>
	<div class="wrap">
        
        <div class="sidebar">

                <br>
                <h2 align="center">사원 관리</h2>
                <br><br>

            <div class="sidebar_menu">
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>사원 리스트</a>
                    <ul class="menu1">
                        <li><a href="#">사원리스트 조회</a></li>
                        <li><a href="#">사원 상세 조회</a></li>
                    </ul>
                </li>
                <br><br>
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>조직도</a>
                    <ul class="menu1">
                        <li><a href="#">조직도 조회</a></li>
                    </ul>
                </li>
                <br><br>
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>* 수정/삭제</a>
                    <ul class="menu1">
                        <li><a href="#">사원 리스트</a></li>
                        <li><a href="#">사원 등록</a></li>
                    </ul>
                </li>
            </div>
        
        </div>

        <div class="content">
            <div class="content_1">
                <h2>신규 사원 등록</h2>
            </div>
            <br><br>
            <form action="" method="POST" name="enrollForm" id="enrollForm">
                <div class="enroll">
                    <div class="con1">
                            아이디 <input type="text" name="userId" placeholder="사용할 아이디를 입력해주세요"><br>
                            <div id="idCheck">사용가능한 아이디 입니다.</div>
                            <br>
                            비밀번호 <input type="password" name="userPwd" placeholder="사용할 비밀번호를 입력해주세요.">
                            <br><br>
                            비밀번호 확인 <input type="password" name="checkPwd" placeholder="비밀번호를 다시 입력해주세요"><br>
                            <div id="pwdCheck">비밀번호가 일치하지 않습니다.</div>
                            <br><br>
                    </div>
                    <hr>
                    <div class="con2">
                        <div id="con2">
                            이름 <input type="text" name="userName" placeholder="이름을 입력해주세요.">
                            <br><br>
                            생년월일 <input type="text" name="birth" placeholder="생년월일(YYYY-MM-DD">
                            <br><br>
                            성별 <select name="gender" id="gender">
                                <option>--성별 선택 --</option>
                                <option value="M">남(M)</option>
                                <option value="F">여(F)</option>
                            </select>
                            <br><br>
                            전화번호 <input type="text" name="phone" placeholder="010)0000-0000">
                            <br><br>
                            이메일 <input type="email" name="email" placeholder="ex)aaa@aaaaa.com">
                            <br>
                        </div>
                        <div class="img" align="center">
                            <div class="imgV" style="width: 70%; height: 90%; border: 1px dotted gray;"></div>
                            프로필 이미지 <br>
                            <input type="file" name="addImg" id="addImg">
                        </div>
                    </div>
                    <div class="con3">
                        주소 <input type="text" name="address" placeholder="거주지 주소를 입력해주세요.">
                        <br><br>
                        자격증<br> 
                        <textarea name="certification" id="certification" rows="3" placeholder="소지하고 있는 자격증 현황."></textarea>
                        <br><br>
                        경력 사항<br>
                        <textarea name="career" id="career" rows="3" placeholder="참여했던 프로젝트 및 경력사항"></textarea>
                    </div>
                        <br>
                        <div align="center">
                            <button type="submit">사원 등록</button>
                            <button type="reset">초기화</button>
                        </div><br><br>
                </div>
            </form>
            </div>
            <br><br><br><br>
        </div>
    </div>



  <script>

    $(document).ready(function(){
        $(".profile>a").click(function(){
            var submenu = $(this).next();
            if(submenu.css("display") == 'block'){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
            
        });
    });

  </script>

<script>

    $(document).ready(function(){
        $(".content_1").click(function(){
            var submenu = $(".formtype");
            if(submenu.css("display") == 'none'){
                submenu.show();
            }else{
                submenu.hide();
            }
            
        });
    });

  </script>
</body>
</html>