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

html,
body {
  height: 100%;
}

html {
  background: #444;
}

body {
  min-height: 100%;
  overflow: hidden;
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

.button-label {
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
.button-label h1 {
  font-size: 1em;
  font-family: "Lato", sans-serif;
  font-weight: 600;
}
.button-label:hover {
  background: #d6d6d6;
  color: #101010;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0 -3px 0 rgba(0, 0, 0, 0.32);
}
.button-label:active {
  transform: translateY(2px);
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0px -1px 0 rgba(0, 0, 0, 0.22);
}
@media (max-width: 40em) {
  .button-label {
    padding: 0em 1em 3px;
    margin: 0.25em;
  }
}

#yes-button, #no-button, .button-label{
    width: 100px;
    height: 40px;
    padding: 0px;
    text-align: center;
}

#yes-button:checked + .button-label {
  background: #2ecc71;
  color: #efefef;
}
#yes-button:checked + .button-label:hover {
  background: #29b765;
  color: #e2e2e2;
}

#no-button:checked + .button-label {
  background: #d91e18;
  color: #efefef;
}
#no-button:checked + .button-label:hover {
  background: #c21b15;
  color: #e2e2e2;
}

.hidden {
  display: none;
}

/* *{
    border: 1px solid red;
}  */
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
    height: 1400px;
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
.contentArea{width: 100%; height: 1200px;margin-top: 80px;}
.content1{
    width: 100%;
    height: 350px; 
    float: left;
    padding: 40px;
    }
.content2{width: 100%; height: 850px; float: left;}

.sysdateTable tr td{
    padding: 15px;
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
                            <li><a href="#">나의 근무시간 조회</a></li>
                        </ul>
                    </li>
                    <br>
                    <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>출장</a>
                        <ul class="menu1">
                            <li><a href="insertForm.bt">출장 신청</a></li>
                            <li><a href="list.bt">출장 내역 조회</a></li>
                            <li class="selectedTitle"><a href="approval.bt">출장 승인</a></li>
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
                        <tr>
                        	<form action="">
	                            <td>
	                                <input class="hidden radio-label" id="yes-button" type="radio" name="onTime" value="<%= wt.format(nowTime) %>"/>
	                                <label class="button-label" for="yes-button">
	                                  <h1>출근</h1>
	                                </label>
	                                <input class="hidden radio-label" id="no-button" type="radio" name="onTime" value="<%= wt.format(nowTime) %>"/>
	                                <label class="button-label" for="no-button">
	                                  <h1>퇴근</h1>
	                                </label>
	                            </td>
	                            <td>
                                    <select name="onLocation" id="onLocation">
                                        <option value="서울지사">서울지사</option>
                                        <option value="경기지사">경기지사</option>
                                    </select>
                                    &nbsp;&nbsp;
                                    <button  class="btn btn-primary" class="submit-btn" type="submit">&nbsp; 입력 &nbsp;</button>
                            	</td>
                             </form>
                        </tr>
                    </table>


                </div>

                <div class="content2">
                    <div class="nameBar"><h5> ${loginUser.memName } 님의 출퇴근 기록</h5></div>

                    <div class="workList">
                        <table id="workListTable" class="table">
                            <tr class="tdTitle">
                                <td>일자</td>
                                <td>출근시각</td>
                                <td>출근위치</td>
                                <td>퇴근시각</td>
                                <td>퇴근위치</td>
                                <td>총 근무시간</td>
                                <td>상태</td>
                            </tr>
                            <tr>
                                <td>2020-11-23</td>
                                <td>09:00</td>
                                <td>서울지사</td>
                                <td>18:00</td>
                                <td>경기지사</td>
                                <td>09:00</td>
                                <td>
                                     <c:choose>
	                                	<c:when test="${wd.workStatus eq 'Y'}">
	                                    	<p class="btn btn-primary">처리완료</p>
										</c:when>
										<c:otherwise>
											<p class="btn btn-secondary">미처리</p>
										</c:otherwise>
									 </c:choose>	         
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
			                    	<li class="page-item"><a class="page-link" href="list.an?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
			                    </c:otherwise>
		                    </c:choose>
		                    
		                    
		                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    <li class="page-item"><a class="page-link" href="list.an?currentPage=${ p }">${ p }</a></li>
		                    </c:forEach>
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                        	<li class="page-item"><a class="page-link" href="list.an?currentPage=${ pi.currentPage + 1 }">Next</a></li>
		                   		</c:otherwise>
		                    </c:choose>
		                    
		                </ul>
		            </div>
                    
        
                </div>



            </div>





        </div>

</body>
</html>