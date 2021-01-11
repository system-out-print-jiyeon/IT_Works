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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

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
	margin-left:300px;
	display:flex;
    flex-wrap: wrap;
}
.content1{
    width: 100%;
    height: 470px; 
    }
    
.content1 div {
	float:left;
}
.content1_1{
	width:100%;
	height:100%;
}
.content1_1_1{width:100%; height:260px;}
.content1_1_2{width:100%; height:210px;}
.centerDiv , .topcenterDiv {width:20%; height:100%;}
.topempty1 , .empty1, .empty2{width:40%; height:100%;}
.topempty2{width:40%; height:450px;}
.topempty2 .area{height:260px;}
.userName{font-weight:700; }


.centerDiv div, .topempty1 div, .topcenterDiv div{width:100%; height:100%;}

.userimg{
	margin-top:50px;
	width:100%;
	height:100%;
	width: 100px;
    height: 100px; 
    border-radius: 70%;
    overflow: hidden;
    border:10px solid white;
}

.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.userinfo table{margin-top:70px;font-family: 'Noto Serif KR', serif; color:rgb(92, 92, 92);}
.sysdateTable{
	width:230px;
	display: flex;
	margin:80px;
}
.sysdateBar{
	color:white;
	font-family: 'Noto Serif KR', serif;
}
/******************************************************/







.content2{width: 50%; height:500px; }
.content3{width: 50%; height:500px;}
.content4{width: 50%; height:500px;}
.content5{width: 50%; height:500px;}





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


  /* 결재할문서div css */
	.content4_substance{
	    width: 400px;
	    height: 300px;
	    border: 1px solid #aaa5a5;
	    box-shadow: 2px 2px 2px 2px #aaa5a5;
	    margin:50px;
		}
	
	.content4_substance_title{
	    font-weight: 700;
	    font-size:larger;
	    padding-left: 10px;
	    padding-top: 10px;
		}
	
	.content4_substance_contents_list{
		  width: 390px;
		  text-align: center;
		  border-collapse: collapse;
		}
	
	.content4_substance_contents_list tr{
		    height: 40px;
		}
	
	.content4_substance_contents_list tr:hover{
		    cursor: pointer;
		    background-color: #e7e1e1;
		}
	
	.list_titleCell{
		    width: 230px;
		}
	
	.list_nameCell{
		    width: 70px;
		}
	
	.list_enrollDate{
		    width: 100px;
		}



/********** 프로필 도형 css애니메이션 **************/
@import url('https://fonts.googleapis.com/css?family=Exo:400,700');

*{
    margin: 0px;
    padding: 0px;
}

body{
    font-family: 'Exo', sans-serif;
}

.context {
    width: 100%;
    position: absolute;
    top:50vh;
    
}




.area{
    background:  rgba(32, 132, 226, 0.6);
    background: -webkit-linear-gradient(to left, #6598e4,  #1762d3);  
    width: 100%;
    height:100vh;
    
   
}

.circles{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 350px;
    overflow: hidden;
	margin-left:330px;
}

.circles li{
    position: absolute;
    display: block;
    list-style: none;
    width: 20px;
    height: 20px;
    background: rgba(255, 255, 255, 0.7);
    animation: animate 25s linear infinite;
    bottom: -150px;
    
}

.circles li:nth-child(1){
    left: 85%;
    width: 10px;
    height: 10px;
    animation-delay: 0s;
    animation-duration: 12s;
}


.circles li:nth-child(2){
    left: 10%;
    width: 10px;
    height: 10px;
    animation-delay: 2s;
    animation-duration: 12s;
}

.circles li:nth-child(3){
    left: 70%;
    width: 20px;
    height: 20px;
    animation-delay: 4s;
}

.circles li:nth-child(4){
    left: 20%;
    width: 10px;
    height: 10px;
    animation-delay: 9s;
    animation-duration: 18s;
}

.circles li:nth-child(5){
    left: 25%;
    width: 20px;
    height: 20px;
    animation-delay: 0s;
}

.circles li:nth-child(6){
    left: 75%;
    width: 30px;
    height: 30px;
    animation-delay: 1s;
}

.circles li:nth-child(7){
    left: 35%;
    width: 10px;
    height: 10px;
    animation-delay: 40s;
}

.circles li:nth-child(8){
    left: 90%;
    width: 25px;
    height: 25px;
    animation-delay: 15s;
    animation-duration: 45s;
}

.circles li:nth-child(9){
    left: 20%;
    width: 15px;
    height: 15px;
    animation-delay: 0s;
    animation-duration: 35s;
}

.circles li:nth-child(10){
    left: 85%;
    width: 10px;
    height: 10px;
    animation-delay: 0s;
    animation-duration: 11s;
}

.circles li:nth-child(11){
    left: 35%;
    width: 40px;
    height: 40px;
    animation-delay: 3s;
    animation-duration: 12s;
}

.circles li:nth-child(12){
    left: 10%;
    width: 15px;
    height: 15px;
    animation-delay: 1s;
    animation-duration: 25s;
}

.circles li:nth-child(13){
    left: 20%;
    width: 21px;
    height: 21px;
    animation-delay: 2s;
    animation-duration: 45s;
}

.circles li:nth-child(14){
    left: 85%;
    width: 5px;
    height: 5px;
    animation-delay: 0s;
    animation-duration: 21s;
}
.circles li:nth-child(15){
    left: 90%;
    width: 12px;
    height: 12px;
    animation-delay: 2s;
}


.circles li:nth-child(16){
    left: 5%;
    width: 15px;
    height: 15px;
    animation-delay: 1s;
    animation-duration: 12s;
}

.circles li:nth-child(17){
    left: 80%;
    width: 14px;
    height: 14px;
    animation-delay: 2s;
}

.circles li:nth-child(18){
    left: 20%;
    width: 10px;
    height: 10px;
    animation-delay: 0s;
    animation-duration: 18s;
}



@keyframes animate {

    0%{
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
    }

    100%{
        transform: translateY(-1000px) rotate(720deg);
        opacity: 0;
        border-radius: 50%;
    }
/**********************************************************/
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
            <li class="profile" ><a class="btn" href="publiclist.ad">주소록</a>
               
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
            <!-- <li style="margin-left: -35px;"><a href=""><i class="fas fa-cog"></i>&nbsp;&nbsp;관리자 설정</a></li>   -->
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
		var winWidth = 800;
	    var winHeight = 600;
	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}
</script>

    <div class="contents">

		<div class="content1">
			<div class="content1_1">
				<div class="content1_1_1">
	                <div class="topempty1">
	                	<div class="area" >
	                	<table class="sysdateTable">
	                        <tr>
	                            <td><div class="sysdateBar"><%= sf.format(nowTime) %></div><br></td>
	                        </tr>
	                        <tr>
	                            <td>
									<body onload="printClock()">
	                                        <div style="color:white;font-size:30px;" id="clock">
	                                        </div>
	                                </body>
								</td>
	                        </tr>
	                     </table>
	                     
	                     
	                     
				            <ul class="circles">
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				            </ul>
				    	 </div >
					                     
	                </div>
	                <div class="topcenterDiv">
	                	<div class="area" >
	                	<div class="userimg" align="center">
	               				<img class="profile" src="${ loginUser.memImg }"alt="" class="img-rounded img-responsive" />
	               		 </div>
	               		 
	               		 
				            <ul class="circles">
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				            </ul>
				    	 </div >
	                </div>
	                <div class="topempty2">
	                     <div class="area" >
				            <ul class="circles">
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				                    <li></li>
				            </ul>
				    	 </div >
	                     </div>
	               </div>
	               <div class="content1_1_2">
	               		<div class="empty1"></div>
	               		<div class="centerDiv" align="center">
	               			
	               			<div class="userinfo">
	               				<table>
	               					<tr>
	               						<td width="400px" align="center" class="userName">${ loginUser.memName }</td>
	               					</tr>
	               					<tr>
	               						<td align="center">${ loginUser.deptName }팀 / ${ loginUser.jobName } </td>
	               					</tr>
	               					<tr>
	               						<td align="center">${ loginUser.phone }</td>
	               					</tr>
	               					<tr>
	               						<td align="center">${ loginUser.email }</td>
	               					</tr>
	               				</table>
	               			</div>
	               		</div>
	               		<div class="empty2"></div>
	               </div>
              	</div>
              <script>

              function printClock() {
                  
                  var clock = document.getElementById("clock");           
                  var currentDate = new Date(); // 현재시간
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
                  clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:30px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
                  
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
          
		       
		
		
    </div>
    
		<div class="content2">  <!-- 캘린더 영역 -->
		<!-- 
			<jsp:include page="member/mainProfile.jsp"/>
		 -->
		 
			<jsp:include page="calendar/mainPageCalendar.jsp"/>

		</div>
		
		<div class="content3">  <!-- todoList 영역 -->
		
			<jsp:include page="todolist/todolist.jsp" />
		
		</div>

		<div class="content4">  <!-- 전자결재 영역 -->
		
		 <div class="content4_substance">

            <div class="content4_substance_title">진행중인 결재</div>
            <hr >
            <div class="content4_substance_contents">
                <table class="content4_substance_contents_list">
                    <tr>
                        <td class="list_titleCell">제목1</td>
                        <td class="list_nameCell">홍길동</td>
                        <td class="list_enrollDate">2020/01/04</td>
                    </tr>
                    <tr>
                        <td class="list_titleCell">제목2</td>
                        <td class="list_nameCell">홍길동</td>
                        <td class="list_enrollDate">2020/01/04</td>
                    </tr>
                    <tr>
                        <td class="list_titleCell">제목3</td>
                        <td class="list_nameCell">홍길동</td>
                        <td class="list_enrollDate">2020/01/04</td>
                    </tr>
                    <tr>
                        <td class="list_titleCell">제목4</td>
                        <td class="list_nameCell">홍길동</td>
                        <td class="list_enrollDate">2020/01/04</td>
                    </tr>
                    <tr>
                        <td class="list_titleCell">제목5</td>
                        <td class="list_nameCell">홍길동</td>
                        <td class="list_enrollDate">2020/01/04</td>
                    </tr>
                </table>
            </div>




        </div>
		
		
		
		</div>
		
		<div class="content5">  <!-- 사원목록 영역 -->
		 	
		</div>

    </div>
    
    
    </div>

</body>
</html>