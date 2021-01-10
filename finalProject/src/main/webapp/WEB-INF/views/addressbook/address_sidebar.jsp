<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
 <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
  
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<style>

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
    padding-top:100px;
    width: 300px;
    height: 100%;
    background-color: #e7e1e1;
    position: fixed;
    z-index:3;
}

.sidebar_menu{
    align-items: center;
    list-style: none;
}  

.sidebar_menu a{
    display: block;
    text-decoration: none;
    line-height: 60px;
    color: rgb(107, 102, 102);
    font-size: 25px;
    padding-left: 20px;
    box-sizing: border-box;
}

.sidebar_menu a:hover{
    color: rgb(39, 37, 37);
}

.menu1 li{ 
    padding-left: 40px;
    list-style: none; 
}

.profile:hover{cursor: pointer;}
.profile .menu1{display: none;}


</style>
<body>
	
		      
            <div class="sidebar">

                    <br><br>
                <div class="writeButton">
                    <a href="enrollForm.ad"><button class="button1">연락처 추가</button></a>
                </div>
                    <br><br>

                <div class="sidebar_menu">
                    <li class="profile"><a class="btn" href="publiclist.ad">공용 주소록</a>   
                    </li>
                    <br>
                    <li class="profile"><a class="btn" href="personlist.ad">개인 주소록</a>                 
                    </li>
                    
                </div>

            </div>

            <script>

                /* 사이드바 메뉴 보이기 */
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
	
</body>
</html>