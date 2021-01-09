<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.wrap{width: 100%; 
      height: 100%;
      display: flex;
    }


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
    height: 1000px;
    background-color: #e7e1e1;
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
	<div class="wrap">      
            <div class="sidebar">

                    <br><br>
                <div class="writeButton">
                        <button class="button1">연락처 추가</button>
                </div>
                    <br><br>

                <div class="sidebar_menu">
                    <li class="profile"><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>개인 주소록</a>
                        <ul class="menu1">
                            <li><a href="Publiclist.ad" style="color: cornflowerblue;">전체 주소록</a></li>
                        </ul>
                    </li>
                    <br>
                    <li class="profile"><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>공용 주소록</a>
                        <ul class="menu1">
                            <li style="font-size: 20px;"><a href="#"></a>전체 주소록</li>
                        </ul>
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