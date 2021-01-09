<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

                <br>
                <h2 align="center">사원 관리</h2>
                <br><br>

            <div class="sidebar_menu">
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>사원 리스트</a>
                    <ul class="menu1">
                        <li><a href="manageList.ma">사원리스트 조회</a></li>
                    </ul>
                </li>
                <br><br>
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>조직도</a>
                    <ul class="menu1">
                        <li><a href="orgTree.ma">조직도 조회</a></li>
                    </ul>
                </li>
                <br><br>
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>* 수정/삭제</a>
                    <ul class="menu1">
                        <li><a href="listManage.ma">사원 리스트</a></li>
                        <li><a href="enrollForm.ma">사원 등록</a></li>
                    </ul>
                </li>
            </div>
        
        </div>
</body>
</html>