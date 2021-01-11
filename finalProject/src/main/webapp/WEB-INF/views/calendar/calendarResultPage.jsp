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
    font-size:60px;
    cursor:pointer;
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
                	<c:when test="${ !empty fail}">
                		<img src="resources/calendar/images/fail.png" width="300" height="300">
		                <hr>
          				<b>${ fail }</b>  
                	</c:when>
                </c:choose>
               <br>
            </div>
        </div>
    </div>
   
   	<!-- 해당 페이지에서 바로 post로 시행시킴 -->
   	<c:if test="${ !empty resultCal }">
		<form action="calendar.ca" method="post" id="calendar_form">
			<input type="hidden" name="memNo" value="${ loginUser.memNo }">
		</form>
	
		<script>
			function calendarSubmit(){
				$("#calendar_form").submit();
			}
		</script>
		
		<script>
		    $(document).ready(function() {
		    	alert("${ resultCal }");
		    	calendarSubmit();
		    });
		</script>
	</c:if>
	
    <c:if test="${ !empty resultCalDept }">
		<form action="calendarDept.ca" method="post" id="calendar_dept_form">
			<input type="hidden" name="deptName" value="${ loginUser.deptName }">
		</form>
		
		<script>
			function calendarDeptSubmit(){
				$("#calendar_dept_form").submit();
			}
		</script>
		
		<script>
		    $(document).ready(function() {
		    	alert("${ resultCalDept }");
		    	calendarDeptSubmit();
		    });
		</script>
	</c:if>
	
   	<c:if test="${ !empty resultCalComp }">
		<form action="calendarComp.ca" method="post" id="calendar_comp_form">
		</form>
	
		<script>
			function calendarCompSubmit(){
				$("#calendar_comp_form").submit();
			}
		</script>
		
		<script>
		    $(document).ready(function() {
		    	alert("${ resultCalComp }");
		    	calendarCompSubmit();
		    });
		</script>
	</c:if>
	
	<c:if test="${ !empty mianCal }">
		<form action="selectMain.ca" method="post" id="select_main_calendar_form">
			<input type="hidden" name="memNo" value="${ loginUser.memNo }" >
		</form>
	
		<script>
			function mainCalendarSubmit(){
				$("#select_main_calendar_form").submit();
			}
		</script>
		
		<script>
		    $(document).ready(function() {
		    	alert("${ mianCal }");
		    	mainCalendarSubmit();
		    });
		</script>
	</c:if>
    
</body>
</html>