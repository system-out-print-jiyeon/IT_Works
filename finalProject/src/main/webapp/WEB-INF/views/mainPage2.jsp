<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Office Home</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    
    <style>
*{   
     margin: 0;
     padding: 0;
     box-sizing: border-box;
 }

.wrap{width: 100%; 
      height: 100%;
      display: flex;
     
    }


/*컨텐츠*/
.contents{
	width:100%;
	height:100%;
	margin-top:80px;
}
.content1{
    width: 100%;
    height: 250px; 
    float: left;
    padding: 30px;
    }
    
.content1 div {
	float:left;
}
	
.content1_1{
	padding-left:300px;
	width:68%;
}
.content1_2{width:32%;padding-left:150px;}

.sysdateTable tr td{
    padding: 15px;
}
.sysdateTable{
	width:500px;
	display: flex;
}



/* 사이드바 */
.sidebar{
    
    
    padding: 40px 50px;
    width: 300px;
    height: 100vh;
    background-color: #e7e1e1;
    position: fixed;
    margin-top:80px;
    
    

}


.sidebar_menu{
    align-items: center;
    list-style: none;
    padding-top: 30px;
    
    
}  



.sidebar_menu a{
    display: block;
    text-decoration: none;
    line-height: 40px;
    color: rgb(107, 102, 102);
    font-size: 20px;
    padding-left: 40px;
    box-sizing: border-box;
    margin-top: 20px;
}

.sidebar_menu a:hover{
    color: rgb(39, 37, 37);
}




.profile:hover{cursor: pointer;}

  *{
    border: 1px solid red;
}    
    </style>
</head>
<body>

 	<jsp:include page="common/approvalNavbar.jsp"/>
 	
    <div class="wrap">

        <div class="sidebar">

        
        <div class="sidebar_menu">
			<li class="profile" style="margin-left: -35px;"><a class="btn" href="list.em?email=${loginUser.email}"><i class="fas fa-th"></i>&nbsp;&nbsp;메일</a>
               	
            </li>
            <li class="profile" ><a class="btn" onclick="calendar_submit();">캘린더</a>
			<form action="calendar.ca" method="post" id="calendar_btn">
				<input type="hidden" name="memNo" value="${ loginUser.memNo }">
			</form>
			<script>
				function calendar_submit(){
					$("#calendar_btn").submit();
				}
			</script>
                
            </li>
            <li class="profile" ><a class="btn">주소록</a>
               
            </li>
            <li class="profile" ><a class="btn" href="list.bo">게시판</a>
                
            </li>
            <li class="profile" ><a class="btn" href="reservation.re?floor=3">회의실 예약</a>
                
            </li>
            <li class="profile" ><a class="btn" href="manageList.ma">인사관리</a>
                
            </li>
            <li class="profile" ><a class="btn" href="workTime.at">근태관리</a>
                
            </li>
            <li class="profile" ><a class="btn" href="approval.me">전자결재</a>
            
            </li>
            <li class="profile" ><a class="btn" href="chat.do">전체채팅</a>
                
            </li>
            <br>
            <li style="margin-left: -35px;"><a href=""><i class="fas fa-cog"></i>&nbsp;&nbsp;관리자 설정</a></li>
        </div>
    
    </div>

    <div class="contents">


	
		<div class="content1">
			
			<div class="content1_1">
                		 <table class="sysdateTable">
                        <tr>
                            <td><div class="btn btn-outline-primary" class="sysdateBar"><%= sf.format(nowTime) %></div><br></td>
                        </tr>
                        <tr>
                            <td>
								<body onload="printClock()">
                                        <div style="color:#666;font-size:50px;" id="clock">
                                        </div>
                                </body>
							</td>
                        </tr>
                     </table>
              </div>
              
              <script>

              function printClock() {
                  
                  var clock = document.getElementById("clock");            // 출력할 장소 선택
                  var currentDate = new Date();                                     // 현재시간
                  var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
                  var amPm = 'AM'; // 초기값 AM
                  var currentHours = addZeros(currentDate.getHours(),2); 
                  var currentMinute = addZeros(currentDate.getMinutes() ,2);
                  var currentSeconds =  addZeros(currentDate.getSeconds(),2);
                  
                  if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
                      amPm = 'PM';
                      currentHours = addZeros(currentHours - 12,2);
                  }

                  if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
                  currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
                  }
                  clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
                  
                  setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
              }

              function addZeros(num, digit) { // 자릿수 맞춰주기
                  var zero = '';
                  num = num.toString();
                  if (num.length < digit) {
                      for (i = 0; i < digit - num.length; i++) {
                      zero += '0';
                      }
                  }
                  return zero + num;
              }
              
          </script>    
          
          <div class="content1_2">
          		<img src="https://cdn0.iconfinder.com/data/icons/work-from-home-19/512/Application-mobileapplication-smartphone-platform-mobile-512.png" width="150" height="150">
          </div>  


		<!-- to do list -->
		<%-- <jsp:include page="todolist/todolist.jsp" /> --%>
		


    </div>


    </div>

</body>
</html>