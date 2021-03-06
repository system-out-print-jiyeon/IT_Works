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
<style>

   .wrap{width: 100%; 
         height: 100%;
         display: flex;
       }
   
   
   
   
   /**** 컨텐트 ****/
   .contentArea{width: 80%; height: 1200px;margin-top: 80px; margin-left:300px;}

	.tool_bar1{
	    width: 100%;
	    height: 40px;
	    margin-top: 30px; 
	    position: relative;
	    padding-left:20px;
	    border-bottom: 2px solid grey;
	}
   .content1{
       width: 100%;
       height: 100%; 
       float: left;
       padding: 40px;
   }
   .nameBar{
       padding: 20px;
   }
   .nameBar h3{
       font-weight: 900;
   }
   
   .insert{
   	  float:right;
   	  padding-right:20px;
   }
   #deletebtn{background:white;}
   /* 테이블 */
   .businessTableArea{
       padding: 20px;
   }
   .tdTitle td{
       text-align: center;
       background: lightgray;
   }
   #businessTable tr td{
       text-align: center;
   }
   tbody tr td:hover{
   		cursor:pointer;
   }
   #workListTable tbody tr:hover{cursor:pointer;}
   /* 페이징 */
   .paginationBar{
       align-items: center;
   }
   

  .navBar{
      width: 100%;
      height: 80px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 1px solid gray;
      background-color: white;
      position:fixed;
      z-index:300;
      float:left;
      top: 0;
	  left: 0;
	  right: 0;
      
  }   
  
  
  
</style>
       
</head>
<body>

 	<jsp:include page="../common/navbar.jsp"/>

	<jsp:include page="board_sidebar.jsp"/>

 	


            <div class="contentArea">


                <div class="content1">
                    <br>
                    <div class="nameBar"><h3>자유 게시판</h3> </div>
                    
                    
                    <c:choose>       
                    
						<c:when test="${empty fbList}">
							
	                    	<div class="submit_btn">
		                        <label class="insert"><button onclick="showPopup();" id="insertbtn" class="btn btn-primary"><i class="fas fa-pencil-alt"></i> 새글쓰기</button></label>             
		                    </div>  
		                    <br><br><br>  
							<p style="text-align:center; font-size:20px; color:gray; font-weight:900; margin-top:60px;" >게시글이 존재하지 않습니다.</p>
							<br><br><br><br>
						</c:when>
						<c:otherwise>
				            <form name="form_freeboard" method="post" id="list-form">
								
					                 <div class="submit_btn">
				                        
				                        <label class="insert"><button onclick="showPopup();" id="insertbtn" class="btn btn-primary"><i class="fas fa-pencil-alt"></i> 새글쓰기</button></label>             
				                    </div>                               
					            
			                    <div class="businessTableArea">
			                        <table id="free-boardList" class="table">
						                 <thead>
						                    <tr align="center">
						                        <th>공지</th>
						                        <th>번호</th>
						                        <th>제목</th>
						                        <th>작성자</th>
						                        <th>작성일</th>
						                        <th>조회</th>                             
						                    </tr>
						                </thead>
						                <tbody align="center">
						                <c:forEach var="fb" items="${fbList}">
						                    <tr>
						                        <input type="hidden" id="fbno" value="${ fb.FBoardNo }">
						                        <td>
						                        	<c:if test="${ fb.boardDivision eq 'N' }">
						                        		★
						                        	</c:if>
						                        </td>
						                        <td class="fbno">${fb.FBoardNo }</td>
						                        <td class="fbtt">${fb.FBoardTitle }</td>
						                        <td>${fb.memName }</td>
						                        <td>${fb.FCreateDate }</td>
						                        <td>${fb.FCount }</td>
						                    </tr>
						                </c:forEach>
						                </tbody>
					                </table>
		                          </div>
		                      </form>
	                     </c:otherwise>
                	 </c:choose>   
                      
             <script>
            	$(function(){
            		$("#free-boardList tbody tr td").click(function(){
            			location.href = "detail.fb?fbno=" + $(this).siblings(".fbno").text();
            		})
            	})
            	
            </script> 
  
  
  
                    <div class="paginationBar">
		                <ul class="pagination justify-content-center" style="margin:20px 0">
		                
		                	<c:choose>
		                		<c:when test="${ pi.currentPage eq 1 }">
			                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<li class="page-item"><a class="page-link" href="list.fb?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
			                    </c:otherwise>
		                    </c:choose>
		                    
		                    
		                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    <li class="page-item"><a class="page-link" href="list.fb?currentPage=${ p }">${ p }</a></li>
		                    </c:forEach>
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                        	<li class="page-item"><a class="page-link" href="list.fb?currentPage=${ pi.currentPage + 1 }">Next</a></li>
		                   		</c:otherwise>
		                    </c:choose>
		                    
		                </ul>
		            </div>
                    
                
                    
                </div>

            </div>

        </div>
        


    <script>
        function showPopup() { window.open("enrollForm.fb", "a", "width=1000, height=900, left=400, top=200"); }
    </script>
        
</body>
</html>