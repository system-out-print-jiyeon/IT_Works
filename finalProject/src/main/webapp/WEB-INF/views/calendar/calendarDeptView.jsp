<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/calendar/css/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/calendar/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='resources/calendar/js/moment.min.js'></script>
<script src='resources/calendar/js/jquery.min.js'></script>
<script>
  var jb = jQuery.noConflict();
</script>
<script src='resources/calendar/js/fullcalendar.min.js'></script>
<script src='resources/calendar/js/ko.js'></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
  	jb(document).ready(function() {

	    jb('#calendar').fullCalendar({
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay,listWeek'
	      },
	      local: 'ko',
 	      events: [
 			<c:forEach var="cal" items="${ list }">
				{
					title: '${cal.calTitle}',
					start: '${cal.calStartDate}',
					end: '${cal.calEndDate}',
					sdate: '${cal.calStartDate}',
					edate: '${cal.calEndDate}',
					place: '${cal.calPlace}',
					content: '${cal.calContent}',
					no: '${cal.calNo}',
					ctime: '${cal.calTime}',
					color: '${cal.calColor}',
					range: '${cal.calRange}',
					memNo: '${cal.memNo}',
					memName: '${cal.memName}',
					deptName: '${cal.deptName}',
					jobName: '${cal.jobName}'
				},
			</c:forEach>
			{

			}	
	      ],
	      eventClick: function(info) {

	          // opens events in a popup window
	          $('#modal-btn').trigger("click");	// 클릭시 모달창
	          
	          $('#cal-title').val(info.title); // 일정명
	          
	          $('#cal-place').val(info.place); // 장소
	          $('#cal-content').val(info.content); // 내용
	          
	          $('.cal-no').val(info.no); // 일정 고유번호
	          
	          if(info.ctime == "Y"){// ---- Y일 경우
	        	  $('#cal-time').prop('checked', true); // 체크활성화
	        	  
	        	  $('#cal-start').prop('type', 'datetime-local').val(info.sdate); // datetime-local로 시간설정 가능
	        	  $('#cal-end').prop('type', 'datetime-local').val(info.edate); // datetime-local로 시간설정 가능
	          }else{ // -----Y가 아닐 경우 --> N일 경우임
	        	  $('#cal-time').prop('checked', false); // 체크 비활성화
	        	  
	        	  $('#cal-start').prop('type', 'date'); // date로 시간설정 불가능
	        	  $('#cal-end').prop('type', 'date'); // date로 시간설정 불가능
	        	  
	 	          $('#cal-start').val(info.sdate); // 시작일
		          $('#cal-end').val(info.edate); // 마감일
	          }
	          $('#cal-color').val(info.color); // 색상
			  $('.cal-range').val(info.range); // 개인/부서/사내 --> 수정 삭제 후 넘어갈 화면 정하기 위해
	          $('#mem-no').html(info.memNo);
	          $('#mem-name').html(info.memName); // 유저명
	          $('#dept-name').html(info.deptName); // 부서명
	          $('#job-name').html(info.jobName); // 직급명
	          $('#title-color').css('background-color',info.color); // 모달창 header의 배경색을 넘어온색으로 변경
	          
				if($('#mem-no').html() == ${loginUser.memNo}){
					$('.btn-status').show(); // 수정/삭제 보이기		
				}else{
					$('.btn-status').hide(); // 수정/삭제 숨기기
				}
	          
	          return false;
	        }
	    });
	});
</script>

<style>

.ca_wrap{
    width: 100%; 
    height: 100%;
    display: flex;
}
/*내용*/
.ca_title{
	color:gray;
	font-size:30px;
}
.ca_content{
    width:100%;
    margin-left:300px;
}
.ca_navbar {
	width:100%;
    position: fixed;
    background:white;
    z-index:10;
}
.ca_content_center{
    margin-top:100px;
    padding:20px;
}
.ca_content_center tbody>tr{
    font-size:17px;
    color:gray;
}
#calendar{
	border:2px solid lightgray;
	max-width:800px;
	border-radius:5px;
 	margin:0 auto;
 	padding: 10px;
 	box-shadow: 0px 0px 10px 1px gray;
}
#modal-btn{
	display:none;
}

.calendar-title{
	color:white;
	font-size:20px;
	margin:auto;
	font-weight:700;
}
#calendar-detail{
	width:400px;
	margin:auto;
}
#calendar-detail input[type=text]{
	width:100%;
}
#calendar-detail textarea{
	width:100%;
	resize:none;
}

</style>
</head>
<body>
    <div class="ca_navbar">
    	<!-- 상단바 include -->
		<jsp:include page="../common/approvalNavbar.jsp"/>
    </div>
	<div class="ca_wrap">

		<jsp:include page="../common/sideBar_calendar.jsp"/>
		
        <div class="ca_content">

            <div class="ca_content_center">
	            <span class="ca_title">부서일정(${ loginUser.deptName }부서)</span>	
				<hr>
				<div class="ca_content_center_calendar">
	            	<div id='calendar'>
	            	</div>
				</div>
				<hr>
            </div>
        </div>
    </div>
    
    <!-- 상세조회 모달 -->
	<!-- 버튼 숨겨둠 -->
	<button id="modal-btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	</button>
	<p id="calendar-data"></p>

	<!-- The Modal -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header" id="title-color" style="width:100%; height:100%;">
			<p class="calendar-title">부서일정</p>
	      	
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">
			<table style="margin:auto;">
				<tr>
					<td width="50">이름&nbsp;&nbsp;&nbsp;</td><td><span id="mem-name"></span></td>
				</tr>
				<tr>
					<td>사번</td><td><span id="mem-no"></span></td>
				</tr>
				<tr>
					<td>직급</td><td><span id="job-name"></span></td>
				</tr>
				<tr>
					<td>부서</td><td><span id="dept-name"></span></td>
				</tr>
			</table>
			<hr>
	      	<form action="update.ca" method="post">
     			<input type="hidden" class="cal-no" name="calNo">
     			<input type="hidden" name="memNo" value="${ loginUser.memNo }">
     			<input type="hidden" class="cal-range" name="calRange">
     				
	      		<table id="calendar-detail" class="table table-borderless" style="margin:auto;">
	      			<tr>
	      				<td>일정명</td><td><input type="text" id="cal-title" name="calTitle" required></td>
	      			</tr>
	      			<tr>
	      				<td>시간</td><td width="300px;"><input type="checkbox" onclick="timeCheck();" id="cal-time" name="calTime" value="Y"></td>
	      			</tr>
	      			<tr>
	      				<td>시작일</td><td width="300px;"><input type="date" id="cal-start" name="calStartDate" required></td>
	      			</tr>
	      			<tr>
	      				<td>마감일</td><td><input type="date" id="cal-end" name="calEndDate" required></td>
	      			</tr>
	      			<tr>
	      				<td>장소</td><td><input type="text" id="cal-place" name="calPlace"></td>
	      			</tr>
	      			<tr>
	      				<td>내용</td><td><textarea id="cal-content" rows="5" name="calContent"></textarea></td>
	      			</tr>
	      			<tr>
	      				<td>색상</td><td><input type="color" id="cal-color" name="calColor" required></td>
	      			</tr>
	      			<tr>
	      				<td>
	      				</td>
	      			</tr>
	      		</table>
	      		<hr>
	      		
	      		<div style="text-align:center;">
		      		<button type="button" class="btn btn-danger btn-status" onclick="deleteCalendar();">삭제</button>
			        <button type="submit" class="btn btn-warning btn-status">수정</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      		</div>
	      	</form>
	      </div>
	    </div>
	  </div>
	</div>

	<form action="delete.ca" method="post" id="delete-calendar">
		<input type="hidden" class="cal-no" name="calNo">
		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
		<input type="hidden" class="cal-range" name="calRange">
	</form>
	<script>
	function deleteCalendar(){
		$("#delete-calendar").submit();
	}
	</script>

	<script>
		// 시간 설정 여부
		function timeCheck(){
			if($('#cal-time').is(':checked')){
				
				$('#cal-start').prop('type', 'datetime-local');
				$('#cal-end').prop('type', 'datetime-local');
			}else{
				$('#cal-start').prop('type', 'date');
				$('#cal-end').prop('type', 'date');
			}
		}
	</script>
    
</body>
</html>