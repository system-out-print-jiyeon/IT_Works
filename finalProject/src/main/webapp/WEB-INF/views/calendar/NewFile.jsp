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
<script src='resources/calendar/js/fullcalendar.min.js'></script>
<script src='resources/calendar/js/ko.js'></script>

<script>
  	$(document).ready(function() {
		jQuery.noConflict(); // jquery 충돌 오류 해결
	    $('#calendar').fullCalendar({
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay'
	      },
	      local: 'ko',
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectHelper: true,
	      select: function(start, end) {
	        var title = prompt('Event Title:');
	        var eventData;
	        if (title) {
	          eventData = {
	            title: title,
	            start: start,
	            end: end
	          };
	          $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
	        }
	        $('#calendar').fullCalendar('unselect');
	      },
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      
 	      events: [
			
 	    	 $.ajax({
				type:"post",
				url:"listA.ca",
				data:{memNo:${loginUser.memNo}},
				success:function(list){
					
					var value = "";
					for(var i in list){
						value += "{" +
									"title:" + list[i].calTitle + "," +
									"start:" + list[i].calStartDate + "," +
									"end:" + list[i].calEndDate + "," +
									"color:" + list[i].calColor + "," +
								 "}"
					}
					
					console.log(value);
					return value;
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
			})
	      ]
			
			
			/*		
	      events: [

 	        {
	          title: 'All Day Event',
	          start: '2021-01-02',
	          color: '#257e4a',
	
	        }
	      ]
			 */	 
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
	max-width: 900px;
 	margin: 0 auto;
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
	            <span class="ca_title">개인일정</span>
	            <br>
	            <br>			
				<div class="ca_content_center_calendar">
	            	<div id='calendar'>
	            	</div>
				</div>
            </div>
        </div>
        
    </div>
</body>
</html>