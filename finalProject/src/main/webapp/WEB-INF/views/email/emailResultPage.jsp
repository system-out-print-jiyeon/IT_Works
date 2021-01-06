<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
*{ 
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.em_wrap{
    width: 100%; 
    height: 100%;
    display: flex;
}
/*내용*/
.em_content{
    width:100%;
    margin-left:300px;
}
.em_navbar {
	width:100%;
    position: fixed;
    background:white;
}
.em_content_center{
    margin-top:100px;
    padding:20px;
    text-align:center;
}
.em_content_center a{
    color:gray;
    font-size:20px;
}
.em_content_center a:hover{
    text-decoration:none;
    animation-name:key;
    animation-duration:0.3s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key{
    100%{
        color:rgb(80, 150, 255); 
    }
}


</style>
</head>
<body>	
    <div class="em_navbar">
    	<!-- 상단바 include -->
		<jsp:include page="../common/approvalNavbar.jsp"/>
    </div>
    
	<div class="em_wrap">
		<jsp:include page="../common/sideBar_email.jsp"/>
		
        <div class="em_content">

            <div class="em_content_center">
            	<br>
               	<br>
               	<br>
                <c:choose>
                	<c:when test="${ !empty send }">
		                <img src="resources/emailImages/send.png" width="300" height="300">
		                <hr>
          				<b>${ send }</b>      		
                	</c:when>
                	<c:when test="${ !empty delete }">
                		<img src="resources/emailImages/delete.png" width="300" height="300">
		                <hr>
          				<b>${ delete }</b>      		
                	</c:when>
                	<c:when test="${ !empty fail}">
                		<img src="resources/emailImages/fail.png" width="300" height="300">
		                <hr>
          				<b>${ fail }</b>  
                	</c:when>
                	<c:when test="${ !empty restore}">
                		<img src="resources/emailImages/restore.png" width="300" height="300">
		                <hr>
          				<b>${ restore }</b>  
                	</c:when>
                </c:choose>
               <br>
               <br>
               <br>
               <a href="list.em?email=${loginUser.email}"><i class="fa fa-envelope"></i> 전체메일함</a>&nbsp;&nbsp;&nbsp;
               <a href="listFrom.em?email=${loginUser.email}"><i class="fa fa-paper-plane"></i> 보낸메일함</a>&nbsp;&nbsp;&nbsp;
	           <a href="listTo.em?email=${loginUser.email}"><i class="fa fa-box-open"></i> 받은메일함</a>&nbsp;&nbsp;&nbsp;
	           <a href="listInp.em?email=${loginUser.email}"><i class="fa fa-star"></i> 중요메일함</a>&nbsp;&nbsp;&nbsp;
			   <a href="listDelete.em?email=${loginUser.email}"><i class="fa fa-trash"></i></i> 휴지통</a>
            </div>
        </div>
    </div>

</body>
</html>