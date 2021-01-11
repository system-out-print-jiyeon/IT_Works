<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
.ca_wrap{
    width: 100%; 
    height: 100%;
    display: flex;
}

/* 메뉴바 */
.ca_menubar{
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
.ca_menubar>button{
    font-size:20px;
    margin-top:50px;
    width:200px;
    height:100px;
    border-radius:10px;
    border:none;
    background:rgb(133, 182, 255); 
    color:white;
}
.ca_menubar>button:hover{
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
.ca_menubar_list{
    margin:50px 0px 0px 0px;
}
.ca_menubar_list li{
    list-style:none;
    margin:10px 0;
}
.ca_menubar_list>span{
    font-size:25px;
    font-weight:900;
    color:rgb(85, 84, 84);
}
.ca_menubar_list .ca_submit{
    color:gray;
    font-size:20px;
}
.ca_menubar_list .ca_submit:hover{
    cursor:pointer;
}


.ca_menubar_list a:hover{
    text-decoration:none;
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
.insert-calendar-title{
	font-size:20px;
	margin:auto;
	font-weight:700;
}
#insert-calendar-detail{
	width:400px;
	margin:auto;
}
#insert-calendar-detail{
	width:80%;
	margin:auto;
}
#insert-calendar-detail input[type=text]{
	width:100%;
}
#insert-calendar-detail textarea{
	width:100%;
	resize:none;
}
</style>
</head>
<body>
	<div class="ca_menubar" align="center">
	    <button type="button" data-toggle="modal" data-target="#myModalInsert">
	    	일정추가&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right"></i>
	    </button>
	    <div class="ca_menubar_list">
	        <span>캘린더</span>
	        <ul>
	            <li><a class="ca_submit" onclick="calendar_submit();"><i class="fa fa-user"></i> 개인일정</a></li>
	            <li><a class="ca_submit" onclick="calendar_dept_submit();"><i class="fa fa-user-friends"></i> 부서일정</a></li>
	            <li><a class="ca_submit" href="calendarComp.ca"><i class="fa fa-users"></i> 사내일정</a></li>

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
				
	        </ul>
	    </div>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="myModalInsert">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header" style="width:100%; height:100%;">
			<p class="insert-calendar-title"><i class="fa fa-calendar-plus"></i> 일정추가</p>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<form action="insert.ca" method="post">
     			<input type="hidden" name="memNo" value="${ loginUser.memNo }">
     			<input type="hidden" name="deptName" value="${ loginUser.deptName }">
	      		<table id="insert-calendar-detail" class="table table-borderless" style="margin:auto;">
	      			<tr>
	      				<td>일정명</td><td><input type="text" name="calTitle" required></td>
	      			</tr>
	      			<tr>
	      				<td>시간</td><td><input type="checkbox" id="isnert-cal-time" onclick="insertTimeCheck();" name="calTime" value="Y"></td>
	      			</tr>
	      			<tr>
	      				<td>시작일</td><td width="300px;"><input type="date" id="insert-cal-start" name="calStartDate" required></td>
	      			</tr>
	      			<tr>
	      				<td>마감일</td><td width="300px;"><input type="date" id="insert-cal-end" name="calEndDate" required></td>
	      			</tr>
	      			<tr>
	      				<td>장소</td><td><input type="text" name="calPlace"></td>
	      			</tr>
	      			<tr>
	      				<td>내용</td><td><textarea rows="5" name="calContent"></textarea></td>
	      			</tr>
	      			<tr>
	      				<td>색상</td><td><input type="color" name="calColor" value="#6191EA" required></td>
	      			</tr>
	      			<tr>
	      				<td>범위<a href="#" data-toggle="tooltip" title="부서일정-대리부터 등록가능 사내일정-차장부터 등록가능"><i class="fa fa-question-circle"></i></a></td>
	      				<td>
	      					<label for="a">개인</label><input type="radio" id="a" name="calRange" value="개인" checked>&nbsp;&nbsp;&nbsp;
							<c:choose>
								<c:when test='${ loginUser.jobName eq "계약직" }'>
								</c:when>
								<c:when test='${ loginUser.jobName eq "사원" }'>
								</c:when>
								<c:when test='${ loginUser.jobName eq "대리" }'>
									<label for="b">부서</label><input type="radio" id="b" name="calRange" value="부서">&nbsp;&nbsp;&nbsp;
								</c:when>
								<c:when test='${ loginUser.jobName eq "과장" }'>
									<label for="b">부서</label><input type="radio" id="b" name="calRange" value="부서">&nbsp;&nbsp;&nbsp;
								</c:when>
								<c:otherwise>
									<label for="b">부서</label><input type="radio" id="b" name="calRange" value="부서">&nbsp;&nbsp;&nbsp;
			      					<label for="c">사내</label><input type="radio" id="c" name="calRange" value="사내">&nbsp;&nbsp;&nbsp;
								</c:otherwise>
							</c:choose>
	      				</td>
	      			</tr>
	      		</table>
	      		<hr>
	      		<button type="submit" class="btn btn-primary">추가</button>
		        <button type="button" class="btn btn-secondary" style="margin-left:345px;" data-dismiss="modal">닫기</button>

				
	      	</form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		// 시간 설정 여부
		function insertTimeCheck(){
			if($('#isnert-cal-time').is(':checked')){
				
				$('#insert-cal-start').prop('type', 'datetime-local');
				$('#insert-cal-end').prop('type', 'datetime-local');
			}else{
				$('#insert-cal-start').prop('type', 'date');
				$('#insert-cal-end').prop('type', 'date');
			}
		}
	</script>
	<script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();
		});
	</script>
	
</body>
</html>