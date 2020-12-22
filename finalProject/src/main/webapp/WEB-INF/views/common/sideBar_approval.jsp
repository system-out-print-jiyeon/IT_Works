<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>approvalSideBar</title>
<style>

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
</style>
</head>
<body>

<div class="sidebar">

                <br><br>
            <div class="writeButton">
              	 <a href="approval.me"><button class="button1">작성하기</button></a>
            </div>
                <br><br><br>

            <div class="sidebar_menu">
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>진행 중인 문서</a>
                    <ul class="menu1">
                        <li><a href="approval.do">전체</a></li>
                        <li><a href="approval.do">대기</a></li>
                        <li><a href="approval.do">확인</a></li>
                        <li><a href="approval.do">예정</a></li>
                        <li><a href="approval.do">진행</a></li>
                    </ul>
                </li>
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>문서함</a>
                    <ul class="menu1">
                        <li><a href="approval.do">전체</a></li>
                        <li><a href="approval.do">기안</a></li>
                        <li><a href="approval.do">결제</a></li>
                        <li><a href="approval.do">수신</a></li>
                        <li><a href="approval.do">회람/참조</a></li>
                        <li><a href="approval.do">반려</a></li>
                    </ul>
                </li>
                <li><a href=""><i class="fas fa-cog"></i>&nbsp;관리자 설정</a></li>
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