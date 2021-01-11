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
    box-sizing: border-box;
    padding-left: 40px;
}
.sidebar_menu a:hover{
    color: rgb(39, 37, 37);
}
.menu1 li{ 
    padding-left: 60px;
    list-style: none; 
}
.btn{text-align:left;}
.profile:hover{cursor: pointer;}
.profile .menu1{display: none;}
</style>

<body>

	<jsp:include page="../common/approvalNavbar.jsp"/>

      <div class="sidebar">
      
      	    <br><br>
            <br><br><br>
      
            <div class="sidebar_menu">
                <li class="profile" ><a class="btn" href="list.fb">자유게시판</a>
                </li>
                <li class="profile" ><a class="btn" href="list.sp">업무협업</a>
                </li>
                <br><br>
            </div>
        </div>
</body>
</html>