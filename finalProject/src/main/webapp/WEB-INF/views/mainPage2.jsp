<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Office Home</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    
    <style>
*{   
     margin: 0;
     padding: 0;
     box-sizing: border-box;
 }

.wrap{width: 100%; 
      height: 100%;
      display: flex;
     
    }


/* 사이드바 */
.sidebar{
    
    
    padding: 40px 50px;
    width: 300px;
    height: 100vh;
    background-color: #e7e1e1;
    position: fixed;
    margin-top:80px;
    
    

}


.sidebar_menu{
    align-items: center;
    list-style: none;
    padding-top: 30px;
    
    
}  



.sidebar_menu a{
    display: block;
    text-decoration: none;
    line-height: 40px;
    color: rgb(107, 102, 102);
    font-size: 20px;
    padding-left: 40px;
    box-sizing: border-box;
    margin-top: 20px;
}

.sidebar_menu a:hover{
    color: rgb(39, 37, 37);
}




.profile:hover{cursor: pointer;}


    </style>
</head>
<body>

 	<jsp:include page="common/approvalNavbar.jsp"/>
 	
    <div class="wrap">

        <div class="sidebar">

        
        <div class="sidebar_menu">
			<li class="profile" style="margin-left: -35px;"><a class="btn" href="list.em"><i class="fas fa-th"></i>&nbsp;&nbsp;메일</a>
               
            </li>
            <li class="profile" ><a class="btn">캘린더</a>
                
            </li>
            <li class="profile" ><a class="btn">주소록</a>
               
            </li>
            <li class="profile" ><a class="btn">게시판</a>
                
            </li>
            <li class="profile" ><a class="btn" href="reservation.re?floor=3">회의실 예약</a>
                
            </li>
            <li class="profile" ><a class="btn" href="manageList.ma">인사관리</a>
                
            </li>
            <li class="profile" ><a class="btn">근태관리</a>
                
            </li>
            <li class="profile" ><a class="btn" href="approval.me">전자결재</a>
                
            </li>
            <br>
            <li style="margin-left: -35px;"><a href=""><i class="fas fa-cog"></i>&nbsp;&nbsp;관리자 설정</a></li>
        </div>
    
    </div>

    <div class="contents">



    </div>


    </div>

</body>
</html>