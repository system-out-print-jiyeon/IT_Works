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
.em_title{
	color:gray;
	font-size:30px;
}
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
}
.em_content_center>table{
    width: 95%;
    height: 80%;
    text-align: center;
}
.em_content_center .update{
    color:gray;
    font-size:20px;
    margin-right:20px;
}
.em_content_center button{
    color:gray;
    text-decoration:none;
    border:none;
    background:none;
}
.em_content_center{
    padding:20px;
}
.em_content_center tbody>tr{
    font-size:17px;
    color:gray;
}
.em_content_center tbody>tr:hover{
    cursor:pointer;
    animation-name:key5;
    animation-duration:0.3s;
    animation-fill-mode:both;
}
@keyframes key5{
    100%{
        /* background:rgb(231, 225, 225); */
        background:rgb(241, 235, 235);
    }
}
.em_content_center .icon{
    color:rgb(105, 164, 253); 
    font-size:25px; 
    font-weight:900;
}
.em_content_center .icon-none{
    color:rgb(212, 211, 211);
    font-size:25px; 
    font-weight:900;
}
.em_content_center input[type="checkbox"]{
    width:17px;
    height:17px;
}

/* 페이징 바 */
.em_content_center>.paging{
    margin-top:100px;
    text-align:center;
}
.em_content_center>.paging>a{
    font-size:20px;
    font-weight:700;
    padding:5px;
    color:gray;
    text-decoration:none;
    width:50px;
    height:50px;
    background:rgb(241, 235, 235);
    display:inline-block;
    border-radius:5px;
}
.em_content_center>.paging>a:hover{
    animation-name:key6;
    animation-duration:0.3s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key6{
    100%{
        background:rgb(93, 158, 255); 
        color:white;
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

        </div>
          
    </div>
                      

</body>
</html>