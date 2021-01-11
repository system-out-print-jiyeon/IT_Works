<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




<style>
.em_wrap{
    width: 100%; 
    height: 100%;
    display: flex;
}

/* 메뉴바 */
.em_menubar{
	margin-top:80px;
    width:300px;
    height:0%;
    background:linear-gradient(rgb(231, 225, 225),rgb(231, 225, 225), rgb(255, 255, 255));
    position: fixed;

    animation-name:key1;
    animation-duration:2s;
    animation-delay:0.5s;
    animation-fill-mode:both;
}
@keyframes key1{
    to{
        height:100%;
    }
}
.em_menubar>button{
    font-size:20px;
    margin-top:50px;
    width:200px;
    height:100px;
    border-radius:10px;
    border:none;
    background:rgb(133, 182, 255); 
    color:white;
}
.em_menubar>button:hover{
    cursor:pointer;
    animation-name:key2;
    animation-duration:0.5s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key2{
    to{
        background:rgb(80, 150, 255); 
        padding-right:10px;
    }
}
.em_menubar_list{
    margin:50px 0px 0px 0px;
}
.em_menubar_list li{
    list-style:none;
    margin:10px 0;
}
.em_menubar_list>span{
    font-size:25px;
    font-weight:900;
    color:rgb(85, 84, 84);
}
.em_menubar_list a{
    color:gray;
    font-size:20px;
}
.em_menubar_list a:hover{
    text-decoration:none;
    color:gray;
    animation-name:key3;
    animation-duration:0.3s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key3{
    100%{
        color:rgb(80, 150, 255); 
        padding-right:5px;
    }
}
</style>
</head>
<body>
	<div class="em_menubar" align="center">
	    <button onclick="location.href='enrollForm.em'">메일쓰기&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right"></i></button>
	    <div class="em_menubar_list">
	        <span>메일함</span>
	        <ul>
	            <li><a href="list.em?email=${loginUser.email}"><i class="fa fa-envelope"></i> 전체메일함</a></li>
	            <li><a href="listFrom.em?email=${loginUser.email}"><i class="fa fa-paper-plane"></i> 보낸메일함</a></li>
	            <li><a href="listTo.em?email=${loginUser.email}"><i class="fa fa-box-open"></i> 받은메일함</a></li>
	            <li><a href="listInp.em?email=${loginUser.email}"><i class="fa fa-star"></i> 중요메일함</a></li>
	        </ul>
	    </div>
	    <div class="em_menubar_list">
	        <span>휴지통</span>
	        <ul>
	            <li><a href="listDelete.em?email=${loginUser.email}"><i class="fa fa-trash"></i></i> 휴지통</a></li>
	        </ul>
	    </div>
	</div>
</body>
</html>