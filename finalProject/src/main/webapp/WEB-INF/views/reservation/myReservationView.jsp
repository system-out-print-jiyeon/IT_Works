<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="../common/navbar.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
    div{border: px solid red; box-sizing: border-box;}
    .wrap{
        padding-top: 50px;
        margin:auto; 
        width: 800px;
        height: 900px;
    }
    .divwrap{width: 80%; height: 20%; text-align: left; margin-top: 40px;}
    .divwrap>div{padding-left: 20px;}
    .divwrap:hover{cursor: pointer;}
    .title{height: 20%; line-height: 35px; background: rgb(240, 240, 240); font-size: 13px; font-weight: 500;}
    .content{height: 80%; border:1px solid rgb(220, 220, 220); margin-top: 3px; font-size: 14px; line-height: 25px;}
    .content>#meetingRoom{padding-top: 20px; font-weight: 600; color: rgb(57, 146, 230);}
    #meetingDate>div{float: right; margin-right: 20px;}
	div>span{padding-right:5px;}
    #pagediv{margin:auto; color: black; margin-top: 100px;}
    #pagingArea{width: fit-content;}
</style>
<body>

	<jsp:include page="../common/approvalNavbar.jsp"/>
    <jsp:include page="sidebar.jsp" />
    
    
	<div class="wrap" align="center">
        <h4 align="left">나의 예약조회</h4>
      <c:choose>
      	<c:when test="${empty list}">
      		<h4 style="margin-top:100px">회의실 예약 현황이 없습니다. </h4>
      	</c:when>
      	<c:otherwise>
	      <c:forEach var="r" items="${list}">
		        <div class="divwrap">
		            <div class="title">
		                <span>예약번호 : </span>
		                <span>${r.reserveNo}</span>
		            </div>
		            <div class="content">
		                <div id="meetingRoom">
		                    <span>${r.floor}층</span> 
		                    <span>${r.room}</span>
		                </div>
		                <div id="meetingObject">
		                    <span>${r.object}</span>
		                </div>
		                <div id="meetingDate">
		                    <span>${r.startPeriod} - </span>
		                    <span>${r.endPeriod}</span>
		                    <div>
		                        <button type="button" class="btn btn-primary btn-sm" onclick="goUpdate(${r.reserveNo});">변경</button>
		                        <button type="button" class="btn btn-danger btn-sm" onclick="goDelete(${r.reserveNo});">취소</button>
		                    </div>
		               	 </div>
		            </div>
	        	</div>
        	</c:forEach>
      
        <script type="text/javascript">
        	function goUpdate(rno){
        		open("updateReservation.re?rno="+rno,"childForm",
                "width=500, height=500, location=no, menubar=no, scrollbars=no, status=no, toolbar=no, resizable=no");
        		location.reload();
        	}
        	function goDelete(rno){
        		var answer = confirm("예약을 정말 취소하시겠습니까?");
        		if(answer == true){
        			$.ajax({
        				url:"delete.re",
        				type:"post",
        				data:{rno:rno},
        				success:function(result){
        					if(result>0){
	        					alert("삭제되었습니다.");
	        					location.reload();
        					}else{
        						alert("삭제되지 않았습니다.");
        					}
        				},error:function(){
        					alert("통신 실패");
        				}
        			});
        		}
        	}
        </script>

		        <div id="pagediv">
		            <div id="pagingArea">
		                <ul class="pagination">
		                <c:choose>
			                <c:when test="${pi.currentPage eq 1}">
			                    <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
			                </c:when>
			                <c:otherwise>
			                    <li class="page-item"><a class="page-link" href="myreservation.re?currentPage=${pi.currentPage-1}"><</a></li>
			                </c:otherwise>
		                </c:choose>
		                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
		                    <li class="page-item"><a class="page-link" href="myreservation.re?currentPage=${p}">${p}</a></li>
		                </c:forEach>
		                <c:choose>
			                <c:when test="${pi.currentPage eq pi.maxPage}">
			                    <li class="page-item disabled"><a class="page-link" href="#">></a></li>
			                </c:when>
			                <c:otherwise>
			                    <li class="page-item"><a class="page-link" href="myreservation.re?currentPage=${pi.currentPage+1}">></a></li>
			                </c:otherwise>
		                </c:choose>
		                </ul>
		            </div>
		        </div>
         	</c:otherwise>
      </c:choose>   
    </div>
</body>
</html>