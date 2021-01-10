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
  <link rel="preconnect" href="https://fonts.gstatic.com"><link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display&display=swap" rel="stylesheet">
    
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
	height:100%;
}
	
.content1_1{
	padding-left:300px;
	width:44%;
}
.content1_2{width:26%;float:left;}
.content1_3{width:30%;padding-left:120px;float:left;}

.sysdateTable tr td{
    padding: 15px;
}
.sysdateTable{
	width:500px;
	display: flex;
}


.workTimeBtn{
	float:left;
	background-color:  rgb(44, 146, 255);
    padding: 15px;
    border-radius: 6px;
    color:white;
    text-decoration: none;
    font-family: 'Nanum Gothic Coding', monospace;
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


/* 출퇴근버튼 css */
body {
  font-size: 16px;
  font-family: "Helvetica", "Arial", sans-serif;
  background-color: #f8faff;
}

.bubbly-button {
  font-family: 'DM Serif Display', serif;
  display: inline-block;
  font-size: 1em;
  padding: 1em 2em;
  margin-top: 80px;
  margin-bottom: 80px;
  -webkit-appearance: none;
  appearance: none;
  background-color: rgb(44, 146, 255);
  color: #fff;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  position: relative;
  transition: transform ease-in 0.1s, box-shadow ease-in 0.25s;
  box-shadow: 0 2px 25px rgba(44, 146, 255, 0.5);
}
.bubbly-button:focus {
  outline: 0;
}
.bubbly-button:before, .bubbly-button:after {
  position: absolute;
  content: "";
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}
.bubbly-button:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, rgb(44, 146, 255) 20%, transparent 20%), radial-gradient(circle, transparent 20%, rgb(45, 30, 255) 20%, transparent 30%), radial-gradient(circle, rgb(44, 146, 255) 20%, transparent 20%), radial-gradient(circle, rgb(44, 146, 255) 20%, transparent 20%), radial-gradient(circle, transparent 10%, rgb(44, 146, 255) 15%, transparent 20%), radial-gradient(circle, rgb(44, 146, 255) 20%, transparent 20%), radial-gradient(circle, rgb(44, 146, 255) 20%, transparent 20%), radial-gradient(circle, rgb(44, 146, 255) 20%, transparent 20%), radial-gradient(circle, rgb(45, 30, 255) 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%, 10% 10%, 18% 18%;
}
.bubbly-button:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, rgb(45, 30, 255) 20%, transparent 20%), radial-gradient(circle, rgb(44, 146, 255) 20%, transparent 20%), radial-gradient(circle, transparent 10%, rgb(44, 146, 255) 15%, transparent 20%), radial-gradient(circle, rgb(44, 146, 255) 20%, transparent 20%), radial-gradient(circle, rgb(44, 146, 255) 20%, transparent 20%), radial-gradient(circle, rgb(45, 30, 255) 20%, transparent 20%), radial-gradient(circle, rgb(45, 30, 255) 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}
.bubbly-button:active {
  transform: scale(0.9);
  background-color:  rgba(86, 187, 255, 0.664);
  box-shadow: 0 2px 25px  rgba(86, 187, 255, 0.664);
}
.bubbly-button.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}
.bubbly-button.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}

@keyframes topBubbles {
  0% {
    background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%, 40% 90%, 55% 90%, 70% 90%;
  }
  50% {
    background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%, 50% 50%, 65% 20%, 90% 30%;
  }
  100% {
    background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%, 50% 40%, 65% 10%, 90% 20%;
    background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
  }
}
@keyframes bottomBubbles {
  0% {
    background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%, 70% -10%, 70% 0%;
  }
  50% {
    background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%, 105% 0%;
  }
  100% {
    background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%, 110% 10%;
    background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
  }
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
            <li class="profile" ><a class="btn" href="list.fb">게시판</a>
                
            </li>
            <li class="profile" ><a class="btn" href="reservation.re?floor=3">회의실 예약</a>
                
            </li>
            <li class="profile" ><a class="btn" href="manageList.ma">인사관리</a>
                
            </li>
            <li class="profile" ><a class="btn" href="workTime.at">근태관리</a>
                
            </li>
            <li class="profile" ><a class="btn" href="approval.me">전자결재</a>
            
            </li>
            <li class="profile" ><a class="btn" id="chat">전체채팅</a>
                
            </li>
            <br>
            <li style="margin-left: -35px;"><a href=""><i class="fas fa-cog"></i>&nbsp;&nbsp;관리자 설정</a></li>
        </div>
    
    </div>

<!-- 채팅 기능 팝업창 -->
<script type="text/javascript">
	$('#chat').click(function(event){  //버튼을 클릭 했을시 popupOpen 함수 출력 
	    console.log('click');
	    popupOpen();	//Popup Open 함수
	});
	
	function popupOpen(){
		var url= "chat.do";    //팝업창 페이지 URL
		var winWidth = 630;
	    var winHeight = 480;
	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}
</script>

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
          		<button class="bubbly-button" >Let's go to Work !</button>
          </div>  
          
          <div class="content1_3">
          		<img src="https://cdn0.iconfinder.com/data/icons/work-from-home-19/512/WorkAlone-working-businessman-work-office-workfromhome-512.png" width="200" height="200">
          </div>  

		  <script>
		  var animateButton = function(e) {

			  e.preventDefault;
			  //reset animation
			  e.target.classList.remove('animate');
			  
			  e.target.classList.add('animate');
			  setTimeout(function(){
			    e.target.classList.remove('animate');
			  },700);
			};

			var bubblyButtons = document.getElementsByClassName("bubbly-button");

			for (var i = 0; i < bubblyButtons.length; i++) {
			  bubblyButtons[i].addEventListener('click', animateButton, false);
			}
			
			// css보여지게 딜레이주는 함수
			$(document).ready(function(){
		    	$(".bubbly-button").click(function(){
		    		setTimeout(function() {
		    	        location.href = 'workTime.at';
		    	    }, 800);
		    	})
		    });
		  </script>


		<!-- to do list -->
		<%-- <jsp:include page="todolist/todolist.jsp" /> --%>
		


    </div>


    </div>

</body>
</html>