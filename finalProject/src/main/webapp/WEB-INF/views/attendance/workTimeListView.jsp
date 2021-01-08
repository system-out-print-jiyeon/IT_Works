<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
	SimpleDateFormat wt = new SimpleDateFormat("HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>


<style>

/*출퇴근버튼 css*/
@import url(https://fonts.googleapis.com/css?family=Lato:300,400,900);
* {
  box-sizing: border-box;
}


.container {
  height: 100%;
  min-height: 100%;
  margin: 0 auto;
}

.button-wrap {
  position: relative;
  text-align: center;
  top: 50%;
  margin-top: -2.5em;
}
@media (max-width: 40em) {
  .button-wrap {
    margin-top: -1.5em;
  }
}

.onButton-label, .leaveButton-label {
  display: inline-block;
  padding: 1em 2em;
  margin: 0.5em;
  cursor: pointer;
  color: #292929;
  border-radius: 0.25em;
  background: #efefef;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0 -3px 0 rgba(0, 0, 0, 0.22);
  transition: 0.3s;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.onButton-label h1 , .leaveButton-label h1{
  font-size: 1em;
  font-family: "Lato", sans-serif;
  font-weight: 600;
}
.onButton-label:hover , .leaveButton-label:hover{
  background: #d6d6d6;
  color: #101010;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0 -3px 0 rgba(0, 0, 0, 0.32);
}
.onButton-label:active , .leaveButton-label:active{
  transform: translateY(2px);
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0px -1px 0 rgba(0, 0, 0, 0.22);
}
@media (max-width: 40em) {
  .onButton-label, .leaveButton-label {
    padding: 0em 1em 3px;
    margin: 0.25em;
  }
}

#yes-button, #no-button, .onButton-label, .leaveButton-label{
    width: 100px;
    height: 40px;
    padding: 0px;
    text-align: center;
}


.onButton-label:hover {
  background: #29b765;
  color: #e2e2e2;
}


.leaveButton-label:hover {
  background: #c21b15;
  color: #e2e2e2;
}

.hidden {
  display: none;
}

/* *{
    border: 1px solid red;
} */
.wrap{width: 100%; 
      height: 100%;
      display: flex;
    }

 .titleBar{text-align: center;}

.titleArea{
   border-radius: 10px;
   border: 0;
   width: 250px;
   height: 45px;
   font-size: larger;
   color: white;
   background-color: rgb(84, 129, 189);
   padding-top: 10px;
}
/* 사이드바 */
.sidebar{    
    justify-content: space-between;
    padding: 8px 24px;
    width: 300px;
    height: 1500px;
    background-color: #e7e1e1;
    margin-top: 80px;
}

.sidebar_menu{
    align-items: center;
    list-style: none;
}  

.sidebar_menu a{
    text-decoration: none;
    line-height: 40px;
    color: rgb(107, 102, 102);
    font-size: 18px;
    padding-left: 40px;
    box-sizing: border-box;
}

.sidebar_menu a:hover{
    color: rgb(39, 37, 37);
}

.menu1 li{ 
    padding-left: 20px;
    list-style: none; 
}

.profile:hover{cursor: pointer;}
.profile .menu1{display: none;}


/* 컨텐트 */
.contentArea{width: 100%; height: 100%;margin-top: 80px;}
.content1{
    width: 100%;
    height: 350px; 
    float: left;
    padding: 40px;
    }
.content2{width: 100%; height: 850px; float: left;}
.content1 div{
	height:100%;
	float:left;
	
}
.content1_1{width:68%}
.content1_2{width:32%; padding:40px;}

.sysdateTable tr td{
    padding: 15px;
}
#updateTable tr td{
	padding: 10px;
}
.work-btn{
    background: rgb(155, 155, 155);
    color: rgb(255, 255, 255);
    border-radius: 10px;
    width: 90px;
    height: 40px;
}
.work-btn:hover{
    background: rgb(21, 130, 255);
    color: white;
    border-radius: 10px;
}
.nameBar{
    padding: 20px;
    padding-left:30px;
}
.nameBar h5{
    font-weight: 900;
}

/* 테이블 */
.workList{
    padding: 20px;
}
.tdTitle td{
    text-align: center;
    background: lightgray;
}
#workListTable tr td{
    text-align: center;
}

/* 페이징 */
.paginationBar{
    align-items: center;
}
/*선택된메뉴*/
.selectedTitle{
    background-color: rgba(76, 135, 212, 0.616);
    border-radius: 10px;
}  

</style>
</head>
<body>

 	<jsp:include page="../common/navbar.jsp"/>
 	
        <div class="wrap">      
            <div class="sidebar">

                    <br><br>
                <div class="titleBar">
                    <div class="titleArea">근태관리</div>
                </div>
                    <br><br><br>

                <div class="sidebar_menu">
                    <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>근태 현황</a>
                        <ul class="menu1">
                            <li class="selectedTitle"><a href="workTime.at">출/퇴근 등록</a></li>
                        </ul>
                    </li>
                    <br>
                    <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>출장</a>
                        <ul class="menu1">
                            <li><a href="insertForm.bt">출장 신청</a></li>
                            <li><a href="list.bt">출장 내역 조회</a></li>
                            <li><a href="approval.bt">출장 승인</a></li>
                        </ul>
                    </li>
                    <br>
                    <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>연차</a>
                        <ul class="menu1">
                            <li><a href="insertForm.an">연차 신청</a></li>
                            <li><a href="list.an">연차 내역 조회</a></li>
                            <li><a href="approval.an">연차 승인</a></li>
                        </ul>
                    </li>
                </div>

            </div>

            <script>

                /* 사이드바 메뉴 보이기 */
                $(document).ready(function(){
                    $(".profile>a").click(function(){
                        var submenu = $(this).next();
                        if(submenu.css("display") == 'block'){
                            submenu.slideUp();
                        }else{
                            submenu.slideDown();
                        }
                        
                    });
                });
            </script>

            <div class="contentArea">

                <div class="content1">
                	<div class="content1_1">
                		 <table class="sysdateTable">
                        <tr>
                            <td>사용한 휴가개수 ${15-loginUser.annualLeave } 개 | 미사용 ${loginUser.annualLeave }개</td>
                            <td><div class="btn btn-outline-primary" class="sysdateBar"><%= sf.format(nowTime) %></div><br></td>
                        </tr>
                        <tr>
                            <td colspan="2">
								<body onload="printClock()">
                                        <div style="color:#666;font-size:40px;" id="clock">
                                        </div>
                                </body>
							</td>
                        </tr>
                     </table>
                     
                     <table id="updateTable">
                        <tr>
                        	<form id="updateOnWork">
                        	 	<td>
                                    <select name="onLocation" id="onLocation">
                                        <option value="서울지사">서울지사</option>
                                        <option value="경기지사">경기지사</option>
                                    </select>
                            	</td>
	                            <td>
	                            	<input type="hidden" name="memNo" value="${loginUser.memNo }">
	                                <input class="hidden radio-label" id="yes-button" type="button" name="onTime" value="<%= wt.format(nowTime) %>"  onclick="test1(); return false;"/>
	                                <input type="hidden" name="onTime" value="<%= wt.format(nowTime) %>">
	                                <label class="onButton-label" for="yes-button">
	                                  <h1>출근</h1>
	                                </label>
	                            </td>
	                            
	                         </form>
	                         <form id="updateLeaveWork">
                            	<td>
                                    <select name="leaveLocation" id="leaveLocation">
                                        <option value="서울지사">서울지사</option>
                                        <option value="경기지사">경기지사</option>
                                    </select>
                            	</td>
	                            <td>
	                          	    <input type="hidden" name="memNo" value="${loginUser.memNo }">
	                                <input class="hidden radio-label" id="no-button" type="button" onclick="test2(); return false;"/>
	                                <input type="hidden" id="leaveTime" name="leaveTime">
	                                <label class="leaveButton-label" for="no-button">
	                                  <h1>퇴근</h1>
	                                </label>
	                            </td>
	                           
                             </form>
                        </tr>
                    </table>
                	</div>
                	
                	
                	
                	
                	<div class="content1_2">
                     	<img src="https://cdn0.iconfinder.com/data/icons/work-from-home-19/512/WorkAlone-working-businessman-work-office-workfromhome-512.png" width="250" height="250">
                	</div>
                   


					<script>
					    setInterval("leaveTime()",1000);
					    function leaveTime(){
					       var now = new Date();
					        hours = now.getHours();
					        minutes = now.getMinutes();
					        seconds = now.getSeconds();
					 
					       
					        if (hours < 10){
					            hours = "0" + hours;
					        }
					        if (minutes < 10){
					            minutes = "0" + minutes;
					        }
					        if (seconds < 10){
					            seconds = "0" + seconds;
					        }
						var leaveTime = document.getElementById("leaveTime");
						leaveTime.setAttribute("value", hours + ":" + minutes + ":" + seconds);
					    }
						
					    
					    
						 function test1(){
						        var formData = $("#updateOnWork").serialize();

						        $.ajax({
						            cache : false,
						            url : "updateOnWork.wd",
						            type : 'POST', 
						            data : formData, 
						            success : function(result) {
						                if(result == "success"){
						                	alert("출근 등록 완료!");
						                	console.log("success");
						                	
						                }else if(result == "fail"){
						                	alert("등록실패하였습니다");
						                	console.log("fail");
						                }else{
						                	alert("출근등록은 두 번 할 수 없습니다.");
						                	console.log("already");
						                }
						                
						                window.location.href = "workTime.at";
						            }, // success 
						    
						            error : function() {
						            }
						        }); 
						    }
						
						 
						 function test2(){
						        var formData = $("#updateLeaveWork").serialize();

						        $.ajax({
						            cache : false,
						            url : "updateLeaveWork.wd",
						            type : 'POST', 
						            data : formData, 
						            success : function(result) {
						                if(result == "success"){
						                	alert("퇴근 등록 완료!");
						                	console.log("success");
						                	
						                }else if(result == "fail"){
						                	alert("등록실패하였습니다");
						                	console.log("fail");
						                }else{
						                	alert("출근등록을 먼저 해주세요!");
						                	console.log("already");
						                }
						                
						                window.location.href = "workTime.at";
						            }, // success 
						    
						            error : function() {
						            }
						        }); 
						    }
						
						
					</script>



                </div>

                <div class="content2">
                    <div class="nameBar"><h5> ${loginUser.memName } 님의 출퇴근 기록</h5></div>
					
                    <div class="workList">
                        <table id="workListTable" class="table">
                        	<thead>
	                            <tr class="tdTitle">
	                                <td>일자</td>
	                                <td>출근시각</td>
	                                <td>출근위치</td>
	                                <td>퇴근시각</td>
	                                <td>퇴근위치</td>
	                                <td>상태</td>
	                            </tr>
                        	</thead>
                        	<tbody>
	                        	
                            </tbody>
                        </table>
                    </div>
                               	
                               	
                    
                    <script>
                    
                    
                    
	                    $(function(){
	            			selectWorkDayList();
	            		})
	            		
                    	function selectWorkDayList(){
						$.ajax({
							url:"workTime.wd",
							data:{memNo:${loginUser.memNo}},
							success:function(wdList){
								var value ="";
								
								for(var i in wdList){
									value += "<tr>" + 
												 "<td>" + wdList[i].workDate + "</td>" ;
												 if(wdList[i].onTime == null){
													value += "<td>" + " " + "</td>"
												 }else{
												 	value += "<td>" + wdList[i].onTime + "</td>" 
												 }; 
												 
												 if(wdList[i].onLocation == null){
													value += "<td>" + " " + "</td>"
												 }else{
												 	value += "<td>" + wdList[i].onLocation + "</td>" 
												 }; 
												 
												 if(wdList[i].leaveTime == null){
													value += "<td>" + " " + "</td>"
												 }else{
												 	value += "<td>" + wdList[i].leaveTime + "</td>" 
												 }; 
												 if(wdList[i].leaveLocation == null){
													value += "<td>" + " " + "</td>"
												 }else{
												 	value += "<td>" + wdList[i].leaveLocation + "</td>" 
												 }; 
												
								   			    if(wdList[i].workStatus == "Y"){ 
								   			value += "<td>" + '<p class="btn btn-primary">' + "처리완료" + '</p>' + "</td>"
												 }else{ 
											value += "<td>" + '<p class="btn btn-secondary">' + "미처리" + '</p>' + "</td>"
												 };
								   value +=	 "</tr>";
								}
								
								$("#workListTable tbody").html(value);
								
							}, error:function(){
								console.log("ajax 통신 실패");
							}
						})
					}
	                    
	                    
	                    
	                    
	                    
			                    

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
                            clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:40px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
                            
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
                               	
                               	
                    
                    <div class="paginationBar">
		                <ul class="pagination justify-content-center" style="margin:20px 0">
		                
		                	<c:choose>
		                		<c:when test="${ pi.currentPage eq 1 }">
			                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<li class="page-item"><a class="page-link" href="workTime.at?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
			                    </c:otherwise>
		                    </c:choose>
		                    
		                    
		                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    <li class="page-item"><a class="page-link" href="workTime.at?currentPage=${ p }">${ p }</a></li>
		                    </c:forEach>
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                        	<li class="page-item"><a class="page-link" href="workTime.at?currentPage=${ pi.currentPage + 1 }">Next</a></li>
		                   		</c:otherwise>
		                    </c:choose>
		                    
		                </ul>
		            </div>
                    
        
                </div>



            </div>





        </div>

</body>
</html>