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
    z-index:10;
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
		<jsp:include page="../common/sideBar_calendar.jsp"/>
		
        <div class="em_content">

            <div class="em_content_center">
            	<br>
               	<br>
               	<br>
                <c:choose>
                	<c:when test="${ !empty cal }">
		                <img src="resources/calendar/images/calendar.png" width="300" height="300">
		                <hr>
          				<b>${ cal }</b>
          				<br>
          				<br>
                		<a class="ca_submit" onclick="calendar_submit();"><i class="fa fa-user"></i> 확인</a>
                	</c:when>
                	<c:when test="${ !empty calDept }">
                		<img src="resources/calendar/images/calendar.png" width="300" height="300">
		                <hr>
          				<b>${ calDept }</b>  
          				<br>
          				<br>    		
	            		<a class="ca_submit" onclick="calendar_dept_submit();"><i class="fa fa-user-friends"></i> 확인</a>
                	</c:when>
                	<c:when test="${ !empty calComp}">
                		<img src="resources/calendar/images/calendar.png" width="300" height="300">
		                <hr>
          				<b>${ calComp }</b>  
          				<br>
          				<br>
	           		 	<a class="ca_submit" href="calendarComp.ca"><i class="fa fa-users"></i> 확인</a>
                	</c:when>
                	<c:when test="${ !empty fail}">
                		<img src="resources/calendar/images/fail.png" width="300" height="300">
		                <hr>
          				<b>${ fail }</b>  
                	</c:when>
                </c:choose>
               <br>
               <br>
               <br>
	            
	            
				<form action="calendar.ca" method="post" id="calendar_btn">
					<input type="hidden" name="memNo" value="${ loginUser.memNo }">
				</form>
				<form action="calendarDept.ca" method="post" id="calendar_dept_btn">
					<input type="hidden" name="memNo" value="${ loginUser.memNo }">
					<input type="hidden" name="deptName" value="${ loginUser.deptName }">
				</form>

				<script>
					function calendar_submit(){
						$("#calendar_btn").submit();
					}
					
					function calendar_dept_submit(){
						$("#calendar_dept_btn").submit();
					}
				</script>
                
                
                
                
                
                
                
            </div>
        </div>
    </div>

</body>
</html>