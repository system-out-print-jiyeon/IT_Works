<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
<body>
      <div class="sidebar"><br>
            <div class="sidebar_menu">
                <li class="profile" ><a class="btn" href="reservation.re?floor=3">회의실 예약</a>
                </li>
                <li class="profile" ><a class="btn" href="myreservation.re?mno=${loginUser.memNo}">나의 예약 현황</a>
                </li>
                <br><br>
            </div>
        </div>
</body>
</html>