<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
</head>
<style>
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
    height: 1300px;
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
.contentArea{width: 100%; height: 1200px; margin-top: 50px; padding: 40px;}
.content1{
    width: 100%;
    float: left;
    padding: 40px;
    }
.content2{width: 100%; height: 850px; float: left;}
.content1 div{float: left;}

.nameBar{
    padding-top: 50px;
    padding-left: 40px;
}
.nameBar h5{
    font-weight: 900;
}
.anuualBar{
    background: lightgray;
    width: 240px;
    height: 40px;
    border-radius: 10px;
    padding-left: 20px;
    padding-top: 8px;
    font-size: 16px;
}

/* 테이블 */
#annualTable tr td{
    padding: 20px;
}
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
#workListTable tr td p{
    width:100px;
}
#workListTable tbody tr:hover{cursor:pointer;}

/* 페이징 */
.paginationBar{
    align-items: center;
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
                            <li><a href="workTime.at">출/퇴근 등록</a></li>
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
                            <li class="selectedTitle"><a href="list.an">연차 내역 조회</a></li>
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
                <br>
                <div class="nameBar"><h5>연차 내역 조회</h5></div>

                <div class="content1">
                    <table id="annualTable">
                        <tr>
                            <td>
                                <div class="anuualBar"><i class='far fa-check-circle' style='font-size:20px'></i> 사용한 휴가 개수 ${15-loginUser.annualLeave }개</div>
                            </td>
                            <td>
                                <div class="anuualBar"><i class='far fa-circle' style='font-size:20px'></i> 미사용 휴가개수 ${loginUser.annualLeave }개</div>
                            </td>
                        </tr>
                    </table>
                   

                </div>

                <div class="content2">

                    <div class="workList">
                        <table id="workListTable" class="table">
	                        <thead>
	                            <tr class="tdTitle">
	                                <td>글번호</td>
	                                <td>일자</td>
	                                <td>연차 기간</td>
	                                <td>상태</td>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="an" items="${ anList }">
		                        	<c:if test="${loginUser.memNo eq an.anProposer }"> 
			                            <tr>
			                            	<td class="anno">${ an.annualNo }</td>
			                                <td>${an.createDate }</td>
			                                <td>${an.annualStart } ~ ${an.annualEnd }</td>
			                                <td>
			                                   <c:choose>
					                                	<c:when test="${an.anStatus eq 'Y'}">
					                                    	<p class="btn btn-primary">처리완료</p>
														</c:when>
														<c:when test="${an.anStatus eq 'R'}">
															<p class="btn btn-danger">반려</p>
														</c:when>
														<c:otherwise>
															<p class="btn btn-secondary">미처리</p>
														</c:otherwise>
													</c:choose>	          
			                                </td>
			                            </tr>
		                            </c:if>
                            	</c:forEach>
                            </tbody>
                        </table>
                        
                                             
		            <script>
		            	$(function(){
		            		$("#workListTable tbody tr").click(function(){
		            			location.href = "detail.an?anno=" + $(this).children(".anno").text();
		            		})
		            	})
		            </script>
  
  
                        
             	</div>
             	
             	
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