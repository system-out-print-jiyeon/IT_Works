<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/hierarchy-view.css">
    <link rel="stylesheet" href="css/main.css">
   
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
                <h2>조직도 -"배경색 변경 예정"</h2>
            </div>
            <br><br>
            <section class="management-hierarchy">
                <div class="hv-container">
                    <div class="hv-wrapper">
        
                        <div class="hv-item">
        
                            <div class="hv-item-parent">
                                <div class="person">
                                    <img src="images/github-blue.svg" alt="">
                                    <p class="name">
                                        홍길동 <b>/ CEO</b>
                                    </p>
                                </div>
                            </div>
        
                            <div class="hv-item-children">
        
                                <div class="hv-item-child">
                                    <div class="hv-item">
        
                                        <div class="hv-item-parent">
                                            <div class="person">
                                                <img src="images/github-red.svg" alt="">
                                                <p class="name">
                                                    이름 <b>/ 직책</b>
                                                </p>
                                            </div>
                                        </div>
                                        
        
                                        <div class="hv-item-children">
        
                                            <div class="hv-item-child">
                                                <div class="person">
                                                    <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="">
                                                    <p class="name">
                                                        이름 <b>/ 직책</b>
                                                    </p>
                                                </div>
                                            </div>
        
                                            <div class="hv-item-child">
                                                <div class="person">
                                                    <img src="https://randomuser.me/api/portraits/men/81.jpg" alt="">
                                                    <p class="name">
                                                        이름 <b>/ 직책</b>
                                                    </p>
                                                </div>
                                            </div>
        
                                            <div class="hv-item-child">
                                                <div class="person">
                                                    <img src="https://randomuser.me/api/portraits/women/18.jpg" alt="">
                                                    <p class="name">
                                                        이름 <b>/ 직책</b>
                                                    </p>
                                                </div>
                                            </div>
        
                                        </div>
        
                                    </div>
                                </div>
        
                                <div class="hv-item-child">
                                    <div class="hv-item">
        
                                        <div class="hv-item-parent">
                                            <div class="person">
                                                <img src="images/github-red.svg" alt="">
                                                <p class="name">
                                                    이름 <b>/ 직책</b>
                                                </p>
                                            </div>
                                        </div>
        
                                        <div class="hv-item-children">
        
                                            <div class="hv-item-child">
                                                <div class="person">
                                                    <img src="https://randomuser.me/api/portraits/men/41.jpg" alt="">
                                                    <p class="name">
                                                        이름 <b>/ 직책</b>
                                                    </p>
                                                </div>
                                            </div>
        
                                            <div class="hv-item-child">
                                                <div class="person">
                                                    <img src="https://randomuser.me/api/portraits/men/90.jpg" alt="">
                                                    <p class="name">
                                                        이름 <b>/ 직책</b>
                                                    </p>
                                                </div>
                                            </div>
        
                                        </div>
        
                                    </div>
                                </div>
        
                                <div class="hv-item-child">
                                    <div class="hv-item">
        
                                        <div class="hv-item-child">
                                            <div class="person">
                                                <img src="images/github-red.svg" alt="">
                                                <p class="name">
                                                    이름 <b>/ 직책</b>
                                                </p>
                                            </div>
                                        </div>
        
                                    </div>
                                </div>
        
                            </div>
        
                        </div>
        
                    </div>
                </div>
            </section>
        
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